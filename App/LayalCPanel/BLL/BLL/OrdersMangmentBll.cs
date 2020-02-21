using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using Resources;
using Resources.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;

namespace BLL.BLL
{
    public class OrdersMangmentBll : BasicBLL
    {
        public object Cancel(OrderCancleRequestVM c)
        {
            try
            {
                //التحقق انة لا يوجد هناك طلبات الغاء منتظرة او حتى متوافق عليها 
                if (db.Phot_OrderCancleRequests_CheckIfCanBeCancled(c.OrderId).Any(v => v.Value > 0))
                    return ResponseVM.Error(Token.CanNotCancleNow);

                //Cancle Now
                long? CancleId = this.db.Phot_OrderCancleRequests_Insert(c.Description, c.RemainingAmounts, c.IsRemainingAmountsForCustomer, this.UserLoggad.Id, c.OrderId)
                      .Select(v => v.Value).FirstOrDefault();

                //Check If Not Added
                if (!CancleId.HasValue)
                    return ResponseVM.Error(Token.ICantAdded);

                //Send Notification To Clinet
                NotifyVM Notify = new NotifyVM()
                {
                    TitleAr = "إلغاء الطلب",
                    TitleEn = "Cancle Order",
                    DescriptionAr = string.Format("طلب الغاء جديد على طلبك رقم {0}",c.OrderId),
                    DescriptionEn = string.Format("New Cancle Request On Youre Order No {0}",c.OrderId),
                    DateTime = DateTime.Now,
                    TargetId = CancleId.Value,
                    PageId = PagesEnum.PhotoOrders,
                    RedirectUrl = $"/PhotoOrders/Details?id={c.OrderId}&go=cancelRequests&notifyId=",
                };

                new NotificationsBLL().Add(Notify, c.UserCreatedOrderId);
                new NotificationHub().SendNotificationToSpcifcUsers(c.UserCreatedOrderId, Notify);

                return ResponseVM.Success(Token.Added);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen);
            }
        }
        public object GetPhotographerOrders(int skip, int take, int? productTypeId, long? productId,
            long? userCreatedId, DateTime? createDateFrom, DateTime? createDateTo, bool? isActive)
        {
            var Result = db.Phot_Orders_SelectByFilterV2(skip, take, productTypeId, productId, userCreatedId, createDateFrom, createDateTo, isActive)
                .Select(c => new OrderVM
                {
                    Id = c.Id,
                    CreateDateTime = c.CreateDateTime,
                    UserCreatedId = c.FKUserCreated,
                    IsActive = c.IsActive,
                    IsCancledWaiting = c.IsCancledWaiting,
                    IsCancled = c.IsCancled,
                    Product = new ProductVM
                    {
                        NameAr = c.ProductNameAr,
                        NameEn = c.ProductNameEn
                    },
                    ProductType = new ProductTypeVM
                    {
                        NameAr = c.ProductTypeNameAr,
                        NameEn = c.ProductTypeNameEn
                    },
                    UserCreated = new UserVM
                    {
                        UserName = c.UserCreated_UserName,
                        FullName = c.UserCreated_FullName,
                    },
                }).ToList();

            if (Result.Count == 0)
            {
                if (skip == 0)
                    return ResponseVM.Info(Token.NoResult);
                return ResponseVM.Info(Token.NoMoreResult);
            }
            return ResponseVM.Success(Result);
        }

        public object GetOrdeById(long id)
        {
            return new OrdersBll().GetOrdeById(id, true);
        }

        public object CancleRequestPaymentImage(OrderCancleRequestVM o)
        {
            try
            {

                //Get Cancle Request Information
                var CancleInfo = db.Phot_OrderCancleRequests_SelectPK(o.Id).Select(c => new OrderCancleRequestVM
                {
                    Id = c.Id,
                    CreateDateTime = c.CreateDateTime,
                    IsRemainingAmountsForCustomer = c.IsRemainingAmountsForCustomer,
                    RemainingAmounts = c.RemainingAmounts,
                    OrderId = c.FKOrder_Id,
                    Description = c.Description,
                    FkUserCancled_Id = c.FkUserCancled_Id,
                    UserCreatedOrderId=c.FKUserCreated,
                    Customer_ReasonCanceling = c.Customer_ReasonCanceling,
                    Customer_BankAccountName = c.Customer_BankAccountName,
                    Customer_BankAccountNumber = c.Customer_BankAccountNumber,
                    Customer_BankName = c.Customer_BankName,
                    Customer_IsAccepted = c.Customer_IsAccepted,
                    Customer_AcceptedDateTime = c.Customer_AcceptedDateTime,
                }).FirstOrDefault();

                if (CancleInfo == null)
                    return ResponseVM.Error($"{Token.CancleRequest} : {Token.NotFound}");

                //Save Image In Server
                if (CancleInfo.IsRemainingAmountsForCustomer && CancleInfo.Customer_IsAccepted.Value)
                    if (o.TransfaerAmpuntImageFile == null)
                        return ResponseVM.Error($"{Token.BankTransferPhoto} {Token.NotFound}");
                    else
                    {
                        var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                        {
                            File = o.TransfaerAmpuntImageFile,
                            ServerPathSave = "/Files/Orders/Cancle/"
                        });

                        if (!FileSave.IsSaved)
                            return ResponseVM.Error(Token.CanNotSaveBankTransferPhoto);
                        CancleInfo.TransfaerAmpuntImage = FileSave.SavedPath;
                    }

                //Save Now And Disactive Order If Clinet Accepted
                db.Phot_OrderCancleRequests_UpdateV2(CancleInfo.Id,CancleInfo.TransfaerAmpuntImage);

                //Send Notification Manger
                NotifyVM Notify = new NotifyVM()
                {
                    TitleAr = "تحويل مبلغ مالى",
                    TitleEn = "Transfer of money",
                    DescriptionAr = string.Format("تم تحويل مبلغ مالى بناء على الغاء الطلب رقم {0}", CancleInfo.OrderId),
                    DescriptionEn = string.Format("A sum of money was transferred based on the cancellation of order {0}",  CancleInfo.OrderId),
                    DateTime = DateTime.Now,
                    TargetId = CancleInfo.Id,
                    PageId = PagesEnum.PhotoOrders,
                    RedirectUrl = $"/PhotoOrders/Details?id={CancleInfo.OrderId}&go=cancelRequests&notifyId=",
                };
                new NotificationsBLL().Add(Notify, CancleInfo.UserCreatedOrderId);
                new NotificationHub().SendNotificationToSpcifcUsers(CancleInfo.UserCreatedOrderId, Notify);

                return ResponseVM.Success(CancleInfo);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen, ex);
            }
        }

        private List<OrderFileVM> GetDropboxFiles(string dropboxFolderPath)
        {
            var Files = new List<OrderFileVM>();
            using (var dr = new DropboxService())
            {
                dr.GetDropboxFilesFromFolder(dropboxFolderPath).ForEach(c =>
                {
                    Files.Add(new OrderFileVM
                    {
                        DropboxFileId = c.Id,
                        DropboxThumbnailPath = c.Thumbnail,
                    });
                });
            }
            return Files;
        }

    }//End Class
}

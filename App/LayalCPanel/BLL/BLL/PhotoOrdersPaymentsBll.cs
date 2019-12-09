using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using Resources;
using Resources.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace BLL.BLL
{
    public class PhotoOrdersPaymentsBll : BasicBLL
    {
        public object AddPaymentByClinet(OrderPaymentVM o)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //اذا هى عملية حجز عن طريق حوالة بنكية
                    
                    var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                    {
                        File =o.File,
                        ServerPathSave = "/Files/Orders/Payments/"
                    });
                    if (!FileSave.IsSaved)
                        return   ResponseVM.Error(Token.CanNotSaveBankTransferPhoto);
                    o.TransferImageUrl = FileSave.SavedPath;

                    long? PaymentId = db.Phot_OrderPayments_Insert(o.OrderId,o.Amount, o.TransferImageUrl, true,this.UserLoggad.Id).FirstOrDefault();

                    //Check If Inserted
                    if (!PaymentId.HasValue )
                        return ResponseVM.Error(Token.SomeErrorHasBeen);

                    //Save And Sent Notification
                    NotificationsBLL NotificationsBLL = new NotificationsBLL();
                    var Notify = new NotifyVM
                    {
                        TitleAr =string.Format("عملية دفع جديدة لـ طرلب رقم {0}",o.OrderId),
                        TitleEn = string.Format("New Payment Process For Order {0}",o.OrderId),
                        DescriptionAr=string.Format("لقد قام العميل {0} باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها {1}",this.UserLoggad.FullName,o.Amount),
                        DescriptionEn=string.Format("The customer {0} has added a new payment for a bank transfer of {1}", this.UserLoggad.FullName,o.Amount),
                        DateTime = DateTime.Now,
                        TargetId = o.OrderId,
                        PageId = PagesEnum.Orders,
                        RedirectUrl = $"/Orders/Payments?id={o.OrderId}&go=w_payment&notifyId=",
                    };

                    //Send Notification To Manger
                    NotificationsBLL.Add(Notify, this.AdminId);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);

                    o.Id = PaymentId;
                    o.IsBankTransfer = true;
                    o.CreateDateTime = DateTime.Now;
                    o.File = null;
                    tran.Commit();
                    return ResponseVM.Success(Token.Add, o);
                }
                catch (Exception ex)
                {
                    FileService.RemoveFile(o.TransferImageUrl);
                    tran.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }

        public List<OrderPaymentVM> GetPaymentsByOrderId(long orderId)
        {
            return db.Phot_OrderPayments_SelectByOrderId(orderId).Select(c=> new OrderPaymentVM{

                Id=c.Id,
                Amount=c.Amount,
                IsAcceptFromManger=c.IsAcceptFromManger,
                IsBankTransfer=c.IsBankTransfer,
                CreateDateTime=c.PaymentDateTime,
                OrderId=c.FkOrder_Id,
                TransferImageUrl=c.TransferImage,
            }).ToList();
          
        }


    }//End Class
}

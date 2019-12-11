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
    public class PhotoOrdersMangmentBll : BasicBLL
    {
        public object Cancel(long id)
        {
            try
            {
                db.Phot_Orders_Cancel(id, this.UserLoggad.Id);
                return ResponseVM.Success(Token.Canceled,new { 
                UserId=this.UserLoggad.Id,
                UserName=this.UserLoggad.Name,
                DateTime=DateService.GetDateAr(DateTime.Now)
                
                });
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen);
            }
        }
        public object GetPhotographerOrders(int skip, int take, int? productTypeId, long? productId,
            long? userCreatedId, DateTime? createDateFrom, DateTime? createDateTo, bool? isActive)
        {
            var Result = db.Phot_Orders_SelectByFilterV2(skip, take, productTypeId, productId, userCreatedId, createDateFrom, createDateTo, isActive).Select(c => new PhotoOrderVM
            {
                Id = c.Id,
                CreateDateTime = c.CreateDateTime,
                CancledDateTime = c.DateTimeCancel,
                UserCreatedId = c.FKUserCreated,
                UserCancleddId = c.FkUserCancel_Id,
                IsActive = c.IsActive,
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
                UserCancled = new UserVM
                {
                    UserName = c.UserCancled_UserName,
                    FullName = c.UserCancled_FullName,
                }
            }).ToList();

            if (Result.Count == 0)
            {
                if (skip == 0)
                    return ResponseVM.Info(Token.NoResult);
                return ResponseVM.Info(Token.NoMoreResult);
            }
            return ResponseVM.Success(Result);
        }


        public object GetOrderFullDetailsById(long id)
        {
            var Order = db.Phot_Orders_SelectFullDetailsById(id).GroupBy(c => new
            {
                c.Id,
                c.CreateDateTime,
                c.IsActive,
                c.FKUserCreated,
                c.UserCreated_UserName,
                c.UserCreated_FullName,
                c.FKProduct_Id,
                c.FKProductType_Id,
                c.DropboxFolderPath,
                c.ProductTypeNameAr,
                c.ProductTypeNameEn,
                c.ProductTypeImage,
                c.Delivery_IsReceiptFromTheBranch,
                c.Delivery_Address,
                c.Delivery_FKCity_Id,
                c.Delivery_FkCountry_Id,
                c.Delivery_CountryNameAr,
                c.Delivery_CountryNameEn,
                c.Delivery_CityNameAr,
                c.Delivery_CityNameEn

            }).Select(c => new PhotoOrderVM
            {
                Id = c.Key.Id,
                CreateDateTime = c.Key.CreateDateTime,
                UserCreatedId = c.Key.FKUserCreated,
                IsActive = c.Key.IsActive,
                Delivery_Address = c.Key.Delivery_Address,
                Delivery_IsReceiptFromTheBranch = c.Key.Delivery_IsReceiptFromTheBranch,
                DeliveryCountry = new CountryVM { NameAr = c.Key.Delivery_CountryNameAr, NameEn = c.Key.Delivery_CountryNameEn },
                DeliveryCity = new CityVM { NameAr = c.Key.Delivery_CityNameAr, NameEn = c.Key.Delivery_CityNameEn },
                UserCreated = new UserVM
                {
                    UserName = c.Key.UserCreated_UserName,
                    FullName = c.Key.UserCreated_FullName,
                },
                Options = c.Select(v => new ProductOptionVM
                {
                    StaticField = new StaticFieldVM
                    {
                        NameAr = v.OptionNameAr,
                        NameEn = v.OptionNameEn,
                    },
                    ItemSelected = new ProductOptionItemVM
                    {
                        ValueAr = v.OptionItemValueAr,
                        ValueEn = v.OptionItemValueEn
                    }
                }).ToList(),
                ProductType = new ProductTypeVM
                {
                    NameAr = c.Key.ProductTypeNameAr,
                    NameEn = c.Key.ProductTypeNameEn,
                    ImageUrl = c.Key.ProductTypeImage
                },
                Product = (ProductVM)new ProductsBLL().GetProductById(c.Key.FKProduct_Id, false).Result,
                Files = GetDropboxFiles(c.Key.DropboxFolderPath),
                ServicePrices = db.Phot_OrderServicePrices_SelectByOrderId(c.Key.Id, c.Key.FKUserCreated).Select(b => new OrderPriceVM
                {
                    Price = b.Price,
                    CreateDateTime = b.CreateDateTime,
                    ServiceNameAr = b.ServiceNameAr,
                    ServiceNameEn = b.ServiceNameEn,
                }).ToList(),
                Payments = new PhotoOrdersPaymentsBll().GetPaymentsByOrderId(c.Key.Id)
            }).FirstOrDefault();


            if (Order == null )
                return ResponseVM.Error($"{Token.Order} : {Token.NotFound}");

            //Sum Total 
            Order.TotalPrices = Order.ServicePrices.Sum(c => c.Price);
            Order.TotalPayments = Order.Payments.Sum(c => c.Amount);
            Order.TotalPaymentsAccepted = Order.Payments.Where(c=> c.IsAcceptFromManger.HasValue&&c.IsAcceptFromManger.Value).Sum(c => c.Amount);
            
            return ResponseVM.Success(Order);
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

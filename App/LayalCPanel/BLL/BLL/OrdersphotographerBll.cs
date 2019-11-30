﻿using BLL.Enums;
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
    public class OrdersphotographerBll : BasicBLL
    {
        public object Add(OrderphotographerVM o)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //Check Ig This Product Is Active 
                    if (db.Phot_Products_CheckIfActive(o.ProductId).Any(c=> c.Value))
                        return ResponseVM.Error(Token.ThisProductIsNotAllowd);

                    //Marge Options
                    string OptionAndItems = "",
                      ItemsIds = "";
                    o.Options.Where(c => c.ProductOptionItemSelectedId.HasValue).ToList().ForEach(c =>
                    {
                        //OptionId:ItemIds
                        OptionAndItems += $"{c.Id}:{c.ProductOptionItemSelectedId},";
                        ItemsIds += c.ProductOptionItemSelectedId + ",";
                    });
                    ItemsIds = ItemsIds.Remove(ItemsIds.Length - 1);

                    //Reset Vaules To Null
                    if(o.Delivery_IsReceiptFromTheBranch)
                    {
                        o.Delivery_Address = null;
                        o.Delivery_CityId = null;
                        o.Delivery_CountryId = null;
                    }

                    //Insert Order
                    var OrderId = db.Phot_Orders_Insert(o.ProductTypeId, o.ProductId, UserLoggad.Id, OptionAndItems, o.Delivery_IsReceiptFromTheBranch, o.Delivery_Address, o.Delivery_CountryId, o.Delivery_CityId).LastOrDefault();

                    //Check If Not Inserted
                    if (OrderId == null)
                        return ResponseVM.Error(Token.ICantAdded);

                    //بتم جلب آخر الاسعار اثناء الحفظ بحيثنكون متاكدينلان ممكن يكون المستخدم فاتح الصفحة من فترة
                    //Refrash Prices Prices For Options Items
                    var Prices = new JavaScriptSerializer().Serialize(db.Phot_ProductsOptionsItems_SelectByIds(ItemsIds).Select(c => new
                    {
                        WordId = c.FKWord_Value_Id,
                        Price = c.Price
                    }).ToList());
                    //Insert Order Prices
                    db.Phot_OrderServicePrices_Insert(OrderId, this.UserLoggad.Id, Prices);

                    //Add Delvery Pric If Not ReceiptFromTheBranch
                    if (!o.Delivery_IsReceiptFromTheBranch)
                    {

                    //Refrash City Price
                    var DeliveryCity = db.Cities_SelectById(o.Delivery_CityId).FirstOrDefault();
                    if (DeliveryCity == null)
                    {
                        tran.Rollback();
                        return ResponseVM.Error($"{Token.DeliveryCity} : {Token.NotFound}");
                    }
                    //Add Delivery  City Price
                    db.Phot_OrderServicePrices_InsertCustom(OrderId, this.UserLoggad.Id, DeliveryCity.ShippingPrice, TokenService.GetToken("DeliveryService",true), TokenService.GetToken("DeliveryService", false));
                    }

                    //Uplaod Files To DropBox
                    using (var Drbox = new DropboxService())
                    {
                        string FolderFullPath = Drbox.UplaodFiles(o.Files, this.UserLoggad.UserName);

                        //Update Folder Id
                        db.Phot_Orders_UpdateDropboxFolderPath(OrderId, FolderFullPath);
                    }

                    tran.Commit();
                    //Return Success
                    if (o.Files.Any(c => c.IsUplaoded == false))
                        return ResponseVM.Success(Token.AddBuWeHaveSomFilesNotSaved, new { Id = OrderId });

                    return ResponseVM.Success(Token.Added, new { Id = OrderId });
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }
        
        public object GetPhotographerOrders(int skip, int take)
        {
            var Result = db.Phot_Orders_SelectByFilter(skip, take, this.UserLoggad.Id).Select(c => new OrderphotographerVM
            {
                Id = c.Id,
                CreateDateTime = c.CreateDateTime,
                UserCreatedId = c.FKUserCreated,
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
                }
            }).ToList();

            if (Result.Count == 0)
            {
                if (skip == 0)
                    return ResponseVM.Error(Token.NoResult);
                return ResponseVM.Error(Token.NoMoreResult);
            }

            return ResponseVM.Success(Result);
        }

        public object GetOrdeById(long id)
        {
            var Order = db.Phot_Orders_SelectById(id).GroupBy(c => new
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
                c.Delivery_FkCountry_Id

            }).Select(c => new OrderphotographerVM
            {
                Id = c.Key.Id,
                CreateDateTime = c.Key.CreateDateTime,
                IsActive = c.Key.IsActive,
                UserCreatedId = c.Key.FKUserCreated,
                ProductId = c.Key.FKProduct_Id,
                Delivery_Address = c.Key.Delivery_Address,
                Delivery_CityId = c.Key.Delivery_FKCity_Id,
                Delivery_CountryId = c.Key.Delivery_FkCountry_Id,
                Delivery_IsReceiptFromTheBranch = c.Key.Delivery_IsReceiptFromTheBranch,
                UserCreated = new UserVM
                {
                    UserName = c.Key.UserCreated_UserName,
                    FullName = c.Key.UserCreated_FullName,
                },
                Options = c.Select(v => new ProductOptionVM
                {
                    Id = v.FKProdutOption_Id,
                    ProductOptionItemSelectedId = v.FKProductOptionItem_Id,
                }).ToList(),
                ProductType = new ProductTypeVM
                {
                    NameAr = c.Key.ProductTypeNameAr,
                    NameEn = c.Key.ProductTypeNameEn,
                    ImageUrl = c.Key.ProductTypeImage
                },
                Product = (ProductVM)new ProductsBLL().GetProductById(c.Key.FKProduct_Id).Result,
                Files = GetDropboxFiles(c.Key.DropboxFolderPath),
                ServicePrices = db.Phot_OrderServicePrices_SelectByOrderId(c.Key.Id, c.Key.FKUserCreated).Select(b => new OrderPriceVM
                {
                    Price = b.Price,
                    CreateDateTime = b.CreateDateTime,
                    ServiceNameAr = b.ServiceNameAr,
                    ServiceNameEn = b.ServiceNameEn,
                }).ToList(),
                Payments = new OrdersphotographerPaymentsBll().GetPaymentsByOrderId(c.Key.Id)
            }).FirstOrDefault();


            if (Order == null || Order.UserCreatedId != this.UserLoggad.Id)
                return ResponseVM.Error($"{Token.Order} : {Token.NotFound}");

            //Sum Total 
            Order.TotalPrices = Order.ServicePrices.Sum(c => c.Price);
            Order.TotalPayments = Order.Payments.Sum(c => c.Amount);

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
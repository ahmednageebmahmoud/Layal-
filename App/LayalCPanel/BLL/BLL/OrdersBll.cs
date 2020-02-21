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
    public class OrdersBll : BasicBLL
    {
        public object Add(OrderVM o)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //Check Ig This Product Is Active 
                    if (!db.Phot_Products_CheckIfAllowSelling(o.ProductId, 1).Any(c => c.Value > 0))
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
                    if (o.Delivery_IsReceiptFromTheBranch)
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

                    /*
                     نقوم بجلب اخر الاسعار من اجل وصع الاسعار الاخير بحيث لا نعتمد على الاسعا القادمة مع الريكويست لانها ممكن انن تتغير اثناء انشاء هذا ااطلب
                     واذا كان الاوبشن مسجل من قبل فنضع السعر القديم 
                     */
                    var ServicePrices =
                        db.Phot_ProductsOptionsItems_SelectByIds(ItemsIds)
                        .Select(c => new OrderServicePriceVM
                        {
                            WordId = c.StaticFieldWordId,
                            Price = c.Price
                        }).ToList();



                    //Add Delvery Pric  
                    int WordDeliveryId = (int)WordsEnum.DeliveryService;
                    if (o.Delivery_IsReceiptFromTheBranch)
                    {
                        ServicePrices.Add(new OrderServicePriceVM
                        {
                            WordId = WordDeliveryId,
                            Price = 0
                        });
                    }
                    else
                    {
                        //Refrash City Price
                        var DeliveryCity = db.Cities_SelectById(o.Delivery_CityId).FirstOrDefault();
                        if (DeliveryCity == null)
                        {
                            tran.Rollback();
                            return ResponseVM.Error($"{Token.DeliveryCity} : {Token.NotFound}");
                        }
                        ServicePrices.Add(new OrderServicePriceVM
                        {
                            WordId = WordDeliveryId,
                            Price = DeliveryCity.ShippingPrice
                        });
                    }

                    //Insert Order Prices
                    db.Phot_OrderServicePrices_Insert(OrderId, this.UserLoggad.Id, new JavaScriptSerializer().Serialize(ServicePrices));



                    //Save  Files In DropBox
                    using (var Drbox = new DropboxService())
                    {
                        //Upload Files now
                        string FolderFullPath = Drbox.UplaodFiles(o.Files, this.UserLoggad.UserName + "/" + OrderId);

                        //Update Folder Id
                        db.Phot_Orders_UpdateDropboxFolderPath(OrderId, FolderFullPath);
                    }


                    //اضافة اشعار لـ المدير

                    //Save And Sent Notification
                    NotificationsBLL NotificationsBLL = new NotificationsBLL();
                    var Notify = new NotifyVM
                    {
                        TitleAr = string.Format("لقم تم انشاء طلب جديد رقم {0}", OrderId),
                        TitleEn = string.Format("A new order has been created no {0}", OrderId),
                        DescriptionAr = string.Format("لقد قام العميل {0} بانشاء طلب جديد ", this.UserLoggad.FullName),
                        DescriptionEn = string.Format("The customer {0} has xreated new order", this.UserLoggad.FullName),
                        DateTime = DateTime.Now,
                        TargetId = OrderId,
                        PageId = PagesEnum.PhotoOrdersMangment,
                        RedirectUrl = $"/PhotoOrdersMangment/Details?id={OrderId}",
                    };

                    //Send Notification To Manger
                    NotificationsBLL.Add(Notify, this.AdminId);
                    new NotificationHub().SendNotificationToSpcifcUsers(this.AdminId, Notify);


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

        /// <summary>
        /// قرار العميل للموافقة على طلب الالغاء
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public object CancleRequestDecision(OrderCancleRequestVM o)
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

                    Customer_ReasonCanceling = o.Customer_ReasonCanceling,
                    Customer_BankAccountName = o.Customer_BankAccountName,
                    Customer_BankAccountNumber = o.Customer_BankAccountNumber,
                    Customer_BankName = o.Customer_BankName,
                    Customer_IsAccepted = o.Customer_IsAccepted,
                    Customer_AcceptedDateTime = DateTime.Now,
                }).FirstOrDefault();

                if (CancleInfo == null)
                    return ResponseVM.Error($"{Token.CancleRequest} : {Token.NotFound}");

                //Save Image In Server
                if (!CancleInfo.IsRemainingAmountsForCustomer && o.Customer_IsAccepted.Value)
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
                db.Phot_OrderCancleRequests_Update(CancleInfo.Id,
                        CancleInfo.OrderId,
                        CancleInfo.Customer_ReasonCanceling,
                        CancleInfo.Customer_IsAccepted,
                        CancleInfo.Customer_BankAccountNumber,
                        CancleInfo.Customer_BankName,
                        CancleInfo.Customer_BankAccountName,
                        CancleInfo.TransfaerAmpuntImage
                        );

                //Send Notification Manger
                NotifyVM Notify = new NotifyVM()
                {
                    TitleAr = "اتخاذ قرار على الغاء الطلب",
                    TitleEn = "Decision to cancel the order",
                    DescriptionAr = string.Format("لقد قام الموظف {0} بـ {1} على طلب الالغاء لـ الطلب رقم {2}", this.UserLoggad.FullName, CancleInfo.Customer_IsAccepted.Value ? "الموافقة" : "الرفض", CancleInfo.OrderId),
                    DescriptionEn = string.Format("{0} Has Been {1} On Cancle Request For Order No {2}", this.UserLoggad.FullName, CancleInfo.Customer_IsAccepted.Value ? "Acepted" : "Rejected", CancleInfo.OrderId),
                    DateTime = DateTime.Now,
                    TargetId = CancleInfo.Id,
                    PageId = PagesEnum.PhotoOrders,
                    RedirectUrl = $"/PhotoOrdersMangment/Details?id={CancleInfo.OrderId}&go=cancelRequests&notifyId=",
                };
                new NotificationsBLL().Add(Notify, CancleInfo.FkUserCancled_Id);
                new NotificationHub().SendNotificationToSpcifcUsers(CancleInfo.FkUserCancled_Id, Notify);


                return ResponseVM.Success(CancleInfo);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen, ex);
            }
        }

        public object SaveChange(OrderVM order)
        {
            switch (order.State)
            {
                case StateEnum.Create:
                    return Add(order);
                case StateEnum.Update:
                    return Update(order);
                case StateEnum.Delete:
                    return Delete(order);
                case StateEnum.Cancel:
                    return Cancel(order);
            }
            return ResponseVM.Error(Token.StateNotFound);
        }

        private object Delete(OrderVM order)
        {
            try
            {
                //Check If Can Be Delete This Order
                /*
                 لا يمكن حذف الطلب اذا كان هناك عملية دفع تمت الموافقة عليها ففى هذة الحالة يمكن الغاء وليس حذفة 
                 */
                if (db.Phot_Orders_CheckCanBeDelete(order.Id, this.UserLoggad.Id).Any(c => c.Value > 0))
                    return ResponseVM.Error(Token.CanNotDelete);

                db.Phot_Orders_Delete(order.Id, this.UserLoggad.Id);
                return ResponseVM.Success(Token.Success);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen);
            }
        }

        private object Update(OrderVM o)
        {

            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //Get Old Order Data
                    var OldOrder = GetOrderSimpleData(o.Id);

                    //If Curen User Not Admin And Not Ownar Order Must be Return Error
                    if (!this.UserLoggad.IsAdmin && OldOrder.UserCreatedId != this.UserLoggad.Id)
                        return ResponseVM.Error(Token.YouCanNotUpdate);

                    //If This Not Admin Adn Order Is he have Payment IsAccepted Must be Return Error
                    if (!this.UserLoggad.IsAdmin && !OldOrder.IsCanUpdate)
                        return ResponseVM.Error(Token.YouCanNotUpdate);

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
                    if (o.Delivery_IsReceiptFromTheBranch)
                    {
                        o.Delivery_Address = null;
                        o.Delivery_CityId = null;
                        o.Delivery_CountryId = null;
                    }

                    //Update Order
                    db.Phot_Orders_Update(o.Id, o.ProductTypeId, o.ProductId, OldOrder.UserCreatedId, OptionAndItems, o.Delivery_IsReceiptFromTheBranch, o.Delivery_Address, o.Delivery_CountryId, o.Delivery_CityId);


                    /*
                     نقوم بجلب اخر الاسعار من اجل وصع الاسعار الاخير بحيث لا نعتمد على الاسعا القادمة مع الريكويست لانها ممكن انن تتغير اثناء انشاء هذا ااطلب
                     واذا كان الاوبشن مسجل من قبل فنضع السعر القديم 
                     */
                    var ServicePrices =
                        db.Phot_ProductsOptionsItems_SelectByIds(ItemsIds)
                        .Select(c => new OrderServicePriceVM
                        {
                            WordId = c.StaticFieldWordId,
                            Price =
                            OldOrder.ServicePrices.Any(s => s.WordId == c.StaticFieldWordId) ? OldOrder.ServicePrices.First(s => s.WordId == c.StaticFieldWordId).Price
                            : c.Price
                        }).ToList();

                    //Add Delvery Pric  
                    int WordDeliveryId = (int)WordsEnum.DeliveryService;
                    if (o.Delivery_IsReceiptFromTheBranch)
                    {
                        ServicePrices.Add(new OrderServicePriceVM
                        {
                            WordId = WordDeliveryId,
                            Price = 0
                        });
                    }
                    else
                    {
                        //Refrash City Price
                        var DeliveryCity = db.Cities_SelectById(o.Delivery_CityId).FirstOrDefault();
                        if (DeliveryCity == null)
                        {
                            tran.Rollback();
                            return ResponseVM.Error($"{Token.DeliveryCity} : {Token.NotFound}");
                        }
                        ServicePrices.Add(new OrderServicePriceVM
                        {
                            WordId = WordDeliveryId,
                            Price = OldOrder.ServicePrices.Any(s => s.WordId == WordDeliveryId) ?
                                    OldOrder.ServicePrices.First(s => s.WordId == WordDeliveryId).Price :
                            DeliveryCity.ShippingPrice
                        });
                    }

                    //Insert Order Prices
                    db.Phot_OrderServicePrices_Insert(o.Id, OldOrder.UserCreatedId, new JavaScriptSerializer().Serialize(ServicePrices));



                    //Uplaod Files To DropBox
                    //Delete Files
                    var DeleteFiles = o.Files.Where(c => c.State == StateEnum.Delete).ToList();
                    //New Files
                    var NewFiles = o.Files.Where(c => c.State == StateEnum.Create).ToList();
                    using (var Drbox = new DropboxService())
                    {
                        //Save New Files
                        if (NewFiles.Count > 0)
                            Drbox.UplaodFiles(NewFiles, OldOrder.DropboxFolderPath, false);

                        //Delete Files
                        if (DeleteFiles.Count > 0)
                            Drbox.DeleteFiles(DeleteFiles.Select(c => c.Path).ToList());
                    }


                    //Sen Notification
                    long UserId = this.AdminId;
                    string ReduirectUrl = $"/PhotoOrdersMangment/Details?id={o.Id}";
                    if (this.UserLoggad.IsAdmin)
                    {
                        //To Ownar
                        UserId = UserLoggad.Id;
                        ReduirectUrl = $"/PhotoOrders/Details?id={o.Id}";
                    }

                    //Save And Sent Notification
                    NotificationsBLL NotificationsBLL = new NotificationsBLL();
                    var Notify = new NotifyVM
                    {
                        TitleAr = string.Format("لقد تم تحديث الطلب رقم {0}", o.Id),
                        TitleEn = string.Format("order has been updated no {0}", o.Id),
                        DescriptionAr = "The administration has updated some of the information in your order.",
                        DescriptionEn = "",
                        DateTime = DateTime.Now,
                        TargetId = o.Id,
                        PageId = PagesEnum.PhotoOrdersMangment,
                        RedirectUrl = ReduirectUrl,
                    };

                    //Send Notification To Manger
                    NotificationsBLL.Add(Notify, UserId);
                    new NotificationHub().SendNotificationToSpcifcUsers(UserId, Notify);


                    tran.Commit();

                    //Return Success
                    if (NewFiles.Count > 0 && NewFiles.Any(c => c.IsUplaoded == false))
                        return ResponseVM.Success(Token.AddBuWeHaveSomFilesNotSaved, new OrdersBll().GetDropboxFiles(OldOrder.DropboxFolderPath));

                    return ResponseVM.Success(new OrdersBll().GetDropboxFiles(OldOrder.DropboxFolderPath));
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }

        private OrderVM GetOrderSimpleData(long id)
        {
            return db.Phot_Orders_SelectByIdV2(id).GroupBy(c => new
            {
                c.Id,
                c.IsActive,
                c.FKUserCreated,
                c.FKProduct_Id,
                c.FKProductType_Id,
                c.DropboxFolderPath,
                c.Delivery_IsReceiptFromTheBranch,
                c.Delivery_Address,
                c.Delivery_FKCity_Id,
                c.Delivery_FkCountry_Id,
                c.PaymentAcceptCount
            }).Select(c => new OrderVM
            {
                Id = c.Key.Id,
                IsActive = c.Key.IsActive,
                UserCreatedId = c.Key.FKUserCreated,
                Delivery_IsReceiptFromTheBranch = c.Key.Delivery_IsReceiptFromTheBranch,
                DropboxFolderPath = c.Key.DropboxFolderPath,
                Options = c.Select(v => new ProductOptionVM
                {
                    Id = v.FKProdutOption_Id,
                    ProductOptionItemSelectedId = v.FKProductOptionItem_Id,

                }).ToList(),
                ServicePrices = c.Select(b => new OrderPriceVM
                {
                    WordId = b.OrderService_WordId,
                    Price = b.OrderService_Price,
                }).ToList(),
                IsCanUpdate = c.Key.PaymentAcceptCount == 0
            }).FirstOrDefault();
        }


        public object Cancel(OrderVM order)
        {
            try
            {
                if (!this.UserLoggad.IsAdmin && db.Phot_Orders_CheckIfCanBeCancled(order.Id, this.UserLoggad.Id).Any(c => c.Value > 0))
                    return ResponseVM.Error($"{Token.Order} {Token.NotFound}");

                db.Phot_Orders_Cancel(order.Id, this.UserLoggad.Id);


                //ارسال اشعار للمدير 
                string RedirectUrl = $"/PhotoOrdersMangment/Details?id={order.Id}";
                long UserNotififyTragetId = this.AdminId;
                if (!this.UserLoggad.IsPhotographer)
                {
                    //ارسال اشعار لمنشىء الطلب
                }
                //Save And Sent Notification
                NotificationsBLL NotificationsBLL = new NotificationsBLL();
                var Notify = new NotifyVM
                {
                    TitleAr = string.Format("لقم تم الغاء لطلب رقم {0}", order.Id),
                    TitleEn = string.Format("order has been cancled no {0}", order.Id),
                    DescriptionAr = string.Format("لقد قام العميل {0} بانشاء طلب جديد ", this.UserLoggad.FullName),
                    DescriptionEn = string.Format("The customer {0} has xreated new order", this.UserLoggad.FullName),
                    DateTime = DateTime.Now,
                    TargetId = order.Id,
                    PageId = PagesEnum.PhotoOrdersMangment,
                    RedirectUrl = RedirectUrl,
                };

                //Send Notification To Manger
                NotificationsBLL.Add(Notify, UserNotififyTragetId);
                new NotificationHub().SendNotificationToSpcifcUsers(UserNotififyTragetId, Notify);

                return ResponseVM.Success(Token.Canceled);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen);
            }
        }

        public object GetPhotographerOrders(int skip, int take)
        {
            var Result = db.Phot_Orders_SelectByFilter(skip, take, this.UserLoggad.Id).Select(c => new OrderVM
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
                    return ResponseVM.Info(Token.NoResult);
                return ResponseVM.Info(Token.NoMoreResult);
            }

            return ResponseVM.Success(Result);
        }

        public object GetOrdeById(long id, bool isAdmin = false)
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

            }).Select(c => new OrderVM
            {
                Id = c.Key.Id,
                CreateDateTime = c.Key.CreateDateTime,
                IsActive = c.Key.IsActive,
                UserCreatedId = c.Key.FKUserCreated,
                ProductTypeId = c.Key.FKProductType_Id,
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
                Payments = new OrdersPaymentsBll().GetPaymentsByOrderId(c.Key.Id)
            }).FirstOrDefault();


            if (Order == null || (!isAdmin && Order.UserCreatedId != this.UserLoggad.Id))
                return ResponseVM.Error($"{Token.Order} : {Token.NotFound}");

            //Sum Total 
            Order.TotalPrices = Order.ServicePrices.Sum(c => c.Price);
            Order.TotalPayments = Order.Payments.Sum(c => c.Amount);
            Order.TotalPaymentsAccepted = Order.Payments.Where(c => c.IsAcceptFromManger.HasValue && c.IsAcceptFromManger.Value).Sum(c => c.Amount);

            return ResponseVM.Success(Order);
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

            }).Select(c => new OrderVM
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
                Payments = new OrdersPaymentsBll().GetPaymentsByOrderId(c.Key.Id),
                CancleRequests = db.Phot_OrderCancleRequests_SelectByOrderId(c.Key.Id).Select(v => new OrderCancleRequestVM
                {
                    CreateDateTime = v.CreateDateTime,
                    Customer_AcceptedDateTime = v.Customer_AcceptedDateTime,
                    Id = v.Id,
                    Customer_BankAccountName = v.Customer_BankAccountName,
                    Customer_BankAccountNumber = v.Customer_BankAccountNumber,
                    Customer_BankName = v.Customer_BankName,
                    Customer_IsAccepted = v.Customer_IsAccepted,
                    Customer_ReasonCanceling = v.Customer_ReasonCanceling,
                    Description = v.Description,
                    IsRemainingAmountsForCustomer = v.IsRemainingAmountsForCustomer,
                    RemainingAmounts = v.RemainingAmounts,
                    TransfaerAmpuntImage = v.TransfaerAmpuntImage
                }).ToList()
            }).FirstOrDefault();


            if (Order == null)
                return ResponseVM.Error($"{Token.Order} : {Token.NotFound}");

            //Sum Total 
            Order.TotalPrices = Order.ServicePrices.Sum(c => c.Price);
            Order.TotalPayments = Order.Payments.Sum(c => c.Amount);
            Order.TotalPaymentsAccepted = Order.Payments.Where(c => c.IsAcceptFromManger.HasValue && c.IsAcceptFromManger.Value).Sum(c => c.Amount);

            return ResponseVM.Success(Order);
        }

        public List<OrderFileVM> GetDropboxFiles(string dropboxFolderPath)
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
                        Path = c.Path
                    });
                });
            }
            return Files;
        }

    }//End Class
}

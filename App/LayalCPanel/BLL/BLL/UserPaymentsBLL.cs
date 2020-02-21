using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using DAL;
using Resources;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class UserPaymentsBLL : BasicBLL
    {
        public object SaveChange(UserPaymentVM c)
        {
            try
            {
                switch (c.State)
                {
                    case StateEnum.Create:
                        return Add(c);
                    case StateEnum.Update:
                        return Update(c);
                    default:
                        break;
                }
                return new ResponseVM(RequestTypeEnum.Error, Token.StateNotFound);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(UserPaymentVM c)
        {
            //Check If Not Closed
            if (db.UsersPrivileges_ChekcIfIsClosed(c.Id).First().Value > 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisPaymentIsClosed);

            var UserTo = db.Users_SelectByPk(c.UserToId).First();
            if (!UserTo.IsActive)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotPayUserAccountIsNotActive);

            //Save Payment Photo If Passed
            if (!SavePaymentImage(c))
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotSavePaymentPhoto);

            var OldPayment = db.UserPayments_SelectByPK(c.Id).FirstOrDefault();

            db.UserPayments_Update(c.Id, c.IsAcceptFromManger, c.Notes, c.IsBankTransfer, c.PaymentImage);

            //ارسال الاشعار فى حالة اذا كانت هذة عملية تعديل لـ قية الرفض او القبول 
            if (OldPayment.IsAcceptFromManger != c.IsAcceptFromManger)
            {

                NotificationsBLL NotificationsBLL = new NotificationsBLL();
                var Notify = new NotifyVM
                {
                    TitleAr = "عملية دفع مقبولة",
                    TitleEn = "New Payment Process Accepted",
                    DateTime = DateTime.Now,
                    TargetId = c.UserToId,
                    PageId = PagesEnum.UserPayments,
                    RedirectUrl = $"/UserPayments/Payments?id={c.UserToId}&notifyId=",
                };


                //ارسار اشعار اذا كانت هذة عملية موافقة 
                if (c.IsAcceptFromManger == true )
                {
                    //ارسال اشعار للموظف
                    {
                        if (c.IsBankTransfer == true)
                        {
                            Notify.DescriptionAr = $"لقد تم دفع لك دفعة مالية عن طريق تحويل لنكى وقبمتها { c.Amount} ريال ";
                            Notify.DescriptionEn = $"You have new payment by bank transfer and it is value { c.Amount} ";
                        }
                        else
                        {
                            Notify.DescriptionAr = $"لقد تم دفع لك دفعة مالية عن طريق دفع كاش وقبمتها { c.Amount} ريال ";
                            Notify.DescriptionEn = $"You have new payment by cash payment and it is value { c.Amount} ";
                        }
                        Notify.RedirectUrl = $"/UserPayments/MyPayments?notifyId=";
                        NotificationsBLL.Add(Notify, UserTo.Id);
                        new NotificationHub().SendNotificationToSpcifcUsers(UserTo.Id, Notify);
                    }


                    //ارسار اشعار لمدير الفرع
                    {
                        var BranchManger = db.Users_SelectByBranchId(UserTo.FKPranch_Id, (int)AccountTypeEnum.BranchManager).First();
                        //اذا هذة عملية دفع كاش ويجب ارسال اشعار للفرع من اجل اكمالى باقى الخطوات
                        if (c.IsBankTransfer == true)
                        {
                            Notify.DescriptionAr = $"لقد تمت الموافقة على الدفع بالتحويل البنكى لـ الموظف {  UserTo.UserName}";
                            Notify.DescriptionEn = $"has been accept for bank transfer payment for {  UserTo.UserName} employee";
                        }
                        else
                        {
                            Notify.DescriptionAr = $"لقد تمت الموافقة على الدفع الكاش لـ الموظف {  UserTo.UserName}";
                            Notify.DescriptionEn = $"has been accept for cash payment for {  UserTo.UserName} employee";
                        }
                        Notify.RedirectUrl = $"/UserPayments/MyPayments?notifyId=";

                        NotificationsBLL.Add(Notify, BranchManger.Id);
                        new NotificationHub().SendNotificationToSpcifcUsers(BranchManger.Id, Notify);
                    }
                }
                else
                {

                    Notify.TitleAr = "عملية دفع مرفوضة";
                    Notify.TitleEn = "Rejectd Payment Process";
                    //ارسار اشعار اذا كانت هذة عملية موافقة 
                    if (c.IsAcceptFromManger == true)
                    {
                        //ارسال اشعار للموظف
                        {
                            if (c.IsBankTransfer == true)
                            {
                                Notify.DescriptionAr = $"لقد تم رفض دفعة مالية عن طريق تحويل لنكى وقبمتها { c.Amount} ريال ";
                                Notify.DescriptionEn = $"You have new payment by bank transfer and it is value { c.Amount} ";
                            }
                            else
                            {
                                Notify.DescriptionAr = $"لقد تم رفض دفعة مالية عن طريق دفع كاش وقبمتها { c.Amount} ريال ";
                                Notify.DescriptionEn = $"You have new payment by cash payment and it is value { c.Amount} ";
                            }
                            Notify.RedirectUrl = $"/UserPayments/MyPayments?notifyId=";
                            NotificationsBLL.Add(Notify, UserTo.Id);
                            new NotificationHub().SendNotificationToSpcifcUsers(UserTo.Id, Notify);
                        }


                        //ارسار اشعار لمدير الفرع
                        {
                            var BranchManger = db.Users_SelectByBranchId(UserTo.FKPranch_Id, (int)AccountTypeEnum.BranchManager).First();
                            //اذا هذة عملية دفع كاش ويجب ارسال اشعار للفرع من اجل اكمالى باقى الخطوات
                            if (c.IsBankTransfer == true)
                            {
                                Notify.DescriptionAr = $"لقد تم رفض على الدفع بالتحويل البنكى لـ الموظف {  UserTo.UserName}";
                                Notify.DescriptionEn = $"has been accept for bank transfer payment for {  UserTo.UserName} employee";
                            }
                            else
                            {
                                Notify.DescriptionAr = $"لقد تم رفض على الدفع الكاش لـ الموظف {  UserTo.UserName}";
                                Notify.DescriptionEn = $"has been accept for cash payment for {  UserTo.UserName} employee";
                            }
                            Notify.RedirectUrl = $"/UserPayments/MyPayments?notifyId=";

                            NotificationsBLL.Add(Notify, BranchManger.Id);
                            new NotificationHub().SendNotificationToSpcifcUsers(BranchManger.Id, Notify);
                        }
                    }
                }
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
        }

        private bool CheckIfUserClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }
        private object Add(UserPaymentVM c)
        {
            var UserTo = db.Users_SelectByPk(c.UserToId).First();
            if (!UserTo.IsActive)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotPayUserAccountIsNotActive);

            c = GetPureObjectForAdd(c);

            //Save Payment Photo If Passed
            if (!SavePaymentImage(c))
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotSavePaymentPhoto);

            c.DateTime = DateTime.Now;
            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
            db.UserPayments_Insert(ID, c.Amount, c.DateTime, c.IsAcceptFromManger, c.UserToId, this.UserLoggad.Id, c.Notes, c.IsBankTransfer, c.PaymentImage);

            NotificationsBLL NotificationsBLL = new NotificationsBLL();
            var Notify = new NotifyVM
            {
                TitleAr = "عملية دفع جديدة",
                TitleEn = "New Payment Process",
                DateTime = DateTime.Now,
                TargetId = c.UserToId,
                PageId = PagesEnum.UserPayments,
                RedirectUrl = $"/UserPayments/Payments?id={c.UserToId}&notifyId=",
            };

            if (this.UserLoggad.IsBranchManager)
            {
                //ارسال اشعار للمدير
                Notify.DescriptionAr = $"لقد قام الموظف   {this.UserLoggad.FullName } باضافة عملية دفع لـ الموظف {  UserTo.UserName} وقيمتها { c.Amount}";
                Notify.DescriptionEn = $"{this.UserLoggad.FullName} Has been Add Payment Process Fro { UserTo.UserName} Employee And It Is Valaue { c.Amount}";
                NotificationsBLL.Add(Notify, this.AdminId);
                new NotificationHub().SendNotificationToSpcifcUsers(this.AdminId, Notify);
            }
            else if (c.IsAcceptFromManger == true && c.IsBankTransfer == false || !c.IsBankTransfer.HasValue)
            {
                var BranchManger = db.Users_SelectByBranchId(UserTo.FKPranch_Id, (int)AccountTypeEnum.BranchManager).First();
                //اذا هذة عملية دفع كاش ويجب ارسال اشعار للفرع من اجل اكمالى باقى الخطوات
                Notify.DescriptionAr = $"هناك عملية دفع للموظف {  UserTo.UserName} وقيمتها { c.Amount} ريال";
                Notify.DescriptionEn = $"you have new paymetn to {  UserTo.UserName} employee and it is value { c.Amount}  ";
                NotificationsBLL.Add(Notify, BranchManger.Id);
                new NotificationHub().SendNotificationToSpcifcUsers(BranchManger.Id, Notify);
            }
            else if (c.IsAcceptFromManger == true && c.IsBankTransfer == true && !string.IsNullOrEmpty(c.PaymentImage))
            {
                //اذا هذة عملية دفع مكتملة ويجب ارسال اشعر للمستخدم
                Notify.DescriptionAr = $"لقد تم دفع لك دفعة مالية عن طريق تحويل بنكى وقبمتها { c.Amount} ريال ";
                Notify.DescriptionEn = $"You have new payment by bank transfer and it is value { c.Amount} ";

                Notify.RedirectUrl = $"/UserPayments/MyPayments?notifyId=";

                NotificationsBLL.Add(Notify, c.UserToId);
                new NotificationHub().SendNotificationToSpcifcUsers(c.UserToId, Notify);
            }

            c.Id = (long)ID.Value;
            return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
        }

        private UserPaymentVM GetPureObjectForAdd(UserPaymentVM c)
        {
            if (c.IsAcceptFromManger == false)
            {
                c.PaymentImage = null;
                c.IsBankTransfer = null;
                c.Notes = null;
            }
            if (c.IsBankTransfer == false)
            {
                c.PaymentImage = null;
            }
            return c;
        }

        private bool SavePaymentImage(UserPaymentVM c)
        {
            if (string.IsNullOrEmpty(c.PaymentImage)) return true;
            var FileSave = FileService.SaveFile(new FileSaveVM
            {
                FileName = c.PaymentImageName,
                FileBase64 = c.PaymentImage,
                ServerPathSave = "/Files/Users/Payments/"
            });
            if (!FileSave.IsSaved)
                return false;

            c.PaymentImage = FileSave.SavedPath;
            return true;
        }

        public object GetPayments(long? userToId, int skip, int take)
        {
            /*
            //التحقق ا ذا كانت فارغة فمعنى ذالك ان هذة صفحة المستخدم الحالى
            وذالك لان صفحة المستخدم الحالى لا يوضع بها معرف المستخدم
             */
            Users_SelectByPk_Result UserTo = new Users_SelectByPk_Result();
            if (!userToId.HasValue)
                userToId = this.UserLoggad.Id;
            else
                UserTo = db.Users_SelectByPk(userToId.Value).First();
            var Payments = db.UserPayments_SelectByUserToId(userToId, skip, take).Select(c => new UserPaymentVM
            {
                Id = c.Id,
                Amount = c.Amount,
                DateTime = c.DateTime,
                IsAcceptFromManger = c.IsAcceptFromManger,
                UserToId = c.FKUserTo_Id,
                UserFromId = c.FKUserFrom_Id,
                UserFromName = c.UserName,
                IsClosed = c.IsClosed.Value,
                Notes = c.Notes,
                IsBankTransfer = c.IsBankTransfer,
                PaymentImage = c.PaymentImage,

            }).ToList();

            if (Payments.Count == 0)
            {
                if (skip > 0)
                    return new ResponseVM(RequestTypeEnum.Info, Token.NoMoreResult, new { UserName = UserTo.UserName, });
                return new ResponseVM(RequestTypeEnum.Info, Token.NoResult, new { UserName = UserTo.UserName, });
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, new { UserName = UserTo.UserName, PaymentsInformations = Payments });
        }



    }//end classs
}

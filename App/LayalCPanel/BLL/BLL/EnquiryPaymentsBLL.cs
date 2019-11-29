using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class EnquiryPaymentsBLL : BasicBLL
    {

        public long Add(EnquiryPaymentVM c, string imagePath)
        {

            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
            db.EnquiryPayments_Insert(ID, c.Amount, c.IsDeposit, c.IsBankTransfer, imagePath, c.IsAcceptFromManger, DateTime.Now, c.EnquiryId, this.UserLoggad.Id);

            NotificationsBLL NotificationsBLL = new NotificationsBLL();
            var Notify = new NotifyVM
            {

                TitleAr = "عملية دفع جديدة",
                TitleEn = "New Payment Process",
                DateTime = DateTime.Now,
                TargetId = c.EnquiryId,
                PageId = PagesEnum.EnquiryPayments,
                RedirectUrl = $"/EnquiryPayments/Payments?id={c.EnquiryId}&notifyId=",
            };

            //اذا كانت هذة حوالة بنكية فيجب اضافة اشعار للمدير من اجل ان يقوم بـ الموافقة عليها
            //وممكن ان المدير هوا نفسة الذى قام بـ الاضافة والتحقق فى نفس الوقت ففى هذة الحالة نذهب بـ الاشعار لـ البرانش
            if (c.IsBankTransfer)
            {
                //اذا هى حوالة بنكية 
                if (this.UserLoggad.IsAdmin)
                {
                    //ارسال اشعار للبرنش ولا داعى ارسل للمدير لان المدير هوا الذى قد ضافة 
                    Notify.DescriptionAr = $"لقد قام المدير  باضافة عملية دفع عن طريق حولة بنكية وقيمتها { c.Amount}";
                    Notify.DescriptionEn = $"Manger Has been Add Payment Process By Bank Transfer And It Is Valaue { c.Amount}";
                    var UserBrranchManger = db.Users_SelectByBranchId(c.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                    if (UserBrranchManger != null)
                    {
                        NotificationsBLL.Add(Notify, UserBrranchManger.Id);
                        new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserBrranchManger.Id.ToString() }, Notify);
                    }
                }
                else
                {
                    //ارسال اشعار للمدير
                    Notify.DescriptionAr = $"لقد قام الموظف   {this.UserLoggad.FullName } باضافة عملية دفع عن طريق حولة بنكية وقيمتها { c.Amount}";
                    Notify.DescriptionEn = $"{this.UserLoggad.FullName } Has been Add Payment Process By Bank Transfer And It Is Valaue { c.Amount}";
                    NotificationsBLL.Add(Notify, this.AdminId);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);
                }
            }
            else
            {
                //اذا هى دفع كاش
                if (this.UserLoggad.IsAdmin)
                {
                    //ارسال اشعار للبرانش من اجل اعلامة ان المدير قام باضفة عملة دفع كاش
                    Notify.DescriptionAr = $"لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها { c.Amount}";
                    Notify.DescriptionEn = $"Manger Has been Add Payment Process By Cash Payment And It Is Valaue { c.Amount}";
                    var UserBrranchManger = db.Users_SelectByBranchId(c.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                    if (UserBrranchManger != null)
                    {
                        NotificationsBLL.Add(Notify, UserBrranchManger.Id);
                        new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserBrranchManger.Id.ToString() }, Notify);
                    }
                }
                else
                {
                    //ارسال اشعار لـ المدير لاعالمة ان البرانش قامت بعمل عملية دفع كاش
                    Notify.DescriptionAr = $"لقد قام الموظف   {this.UserLoggad.FullName } باضافة عملية دفع عن طريق دفع نقدا وقيمتها { c.Amount}";
                    Notify.DescriptionEn = $"{this.UserLoggad.FullName} Has been Add Payment Process By Cash Payment And It Is Valaue { c.Amount}";
                    NotificationsBLL.Add(Notify, this.AdminId);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);
                }
            }
            return (long)ID.Value;
        }

        public object SaveChange(EnquiryPaymentVM c)
        {
            try
            {
                switch (c.State)
                {
                    case StateEnum.Create:
                        return Add(c);
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
        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }
        private object Add(EnquiryPaymentVM c)
        {
            //check if closed
            if (CheckIfEnquiryClosed(c.EnquiryId))
                return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

            //يجب قبل اضافة اى دفعة التاكد ان المستخدم قد دفع عربون اولا
            if (c.IsDeposit = false && !db.EnquiryPayments_CheckIfPaymentedDeposit(c.EnquiryId).Any(b => b.Value))
                return ResponseVM.Error(Token.EnquiryNotHaveDeposit);
            if (c.IsBankTransfer)
            {

                //اذا هى عملية حجز عن طريق حوالة بنكية
                string ImagePath = null;
                var FileSave = FileService.SaveFile(new FileSaveVM
                {
                    FileName = c.BankTransferImageName,
                    FileBase64 = c.BankTransferImage,
                    ServerPathSave = "/Files/Enquiries/Payments/"
                });
                if (!FileSave.IsSaved)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotSaveBankTransferPhoto);
                ImagePath = FileSave.SavedPath;
                c.Id = new EnquiryPaymentsBLL().Add(new EnquiryPaymentVM
                {
                    Amount = c.Amount,
                    IsDeposit = false,
                    IsBankTransfer = true,
                    EnquiryId = c.EnquiryId,
                    //المدير هوا الوحيد الذى يمكن ان يوكدالتحويل عند نزولة
                    IsAcceptFromManger = this.UserLoggad.Id == this.AdminId ? c.IsAcceptFromManger : false,
                    BranchId = c.BranchId

                }, ImagePath);
            }
            else
            {
                //اذا هى حوالة مباشرة
                c.Id = new EnquiryPaymentsBLL().Add(new EnquiryPaymentVM
                {
                    Amount = c.Amount,
                    IsDeposit = false,
                    IsBankTransfer = false,
                    EnquiryId = c.EnquiryId,
                    IsAcceptFromManger = false,
                    BranchId = c.BranchId
                }, null);
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
        }

        public object AcceptFromManger(EnquiryPaymentVM c)
        {
            try
            {
                db.EnquiryPayments_AcceptFromManger(c.Id, c.IsDeposit, c.EnquiryId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public object GetPaymentsByEnqiryId(int enquiryId)
        {
            var PaymentsInformations = GetPaymentsInformations(enquiryId);
            var Enquiry = new EnquiresBLL().GetInformation(enquiryId);
            var Event = new EventsBLL().GetEventInformation(Enquiry.Id);

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Enquiry == null || (this.UserLoggad.IsClinet && Enquiry.UserCreatedId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Enquiry} : {Token.NotFound}");

            if (PaymentsInformations.Count == 0)
                return new ResponseVM(RequestTypeEnum.Info, Token.NoResult);
            return new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Enquiry,
                PaymentsInformations,
                Event
            });
        }

        public List<EnquiryPaymentVM> GetPaymentsInformations(long enquiryId)
        {
            return db.EnquiryPayments_SelectByEnquiryId(enquiryId).Select(c => new EnquiryPaymentVM
            {
                Id = c.Id,
                Amount = c.Amount,
                DateTime = c.DateTime,
                EnquiryId = c.FKEnquiry_Id,
                IsAcceptFromManger = c.IsAcceptFromManger,
                IsBankTransfer = c.IsBankTransfer,
                IsDeposit = c.IsDeposit,
                BankTransferImage = c.TransferImage,
                UserCreatedId = c.FKUserCreated_Id,
                UserCreatedName = c.UserCreatedName,
            }).ToList();
        }

    }//end classs
}

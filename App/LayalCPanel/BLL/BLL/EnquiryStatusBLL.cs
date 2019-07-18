using BLL.BLL;
using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using Google.Apis.Calendar.v3.Data;
using Resources;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class EnquiryStatusBLL : BasicBLL
    {
        NotificationsBLL NotificationsBLL = new NotificationsBLL();
        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }

        public object AddNewStatus(EnquiryStatusVM c)
        {
            try
            {

                //check if closed
                if (CheckIfEnquiryClosed(c.EnquiryId))
                    return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

                c = GetEnquiyStatusPure(c);

                /*
                 
                اذا كانت هناك عملية  حجز بـحوالة بنكية فيجب حفظ صورة الحوالة   
                نقوم بـ حفظ عملية لدفع بدام هناك عملية حجز بعربون
                 */
                var ObjReturn = AddNewPayment(c);
                if (ObjReturn != null) return ObjReturn;



                db.EnquiryStatus_Insert(c.Notes, c.DateTime, c.EnquiryId, (int)c.StatusId, c.ScheduleVisitDateTime, this.UserLoggad.Id, c.IsWithBranch, c.EnquiryPaymentId);

                //هنا يتم اتمام العمليات المعتمدة على ذالك  بـ الاضافة الى الاشعارات
                if (this.UserLoggad.AccountTypeId == (int)AccountTypeEnum.BranchManager)
                {
                    SendAndSaveNotification(c.StatusId, this.AdminId, false, c.EnquiryId);
                }
                else
                {
                    var UserMangerBranch = db.Users_SelectByBranchId(c.EnquiryBranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                    SendAndSaveNotification(c.StatusId, UserMangerBranch.Id, true, c.EnquiryId);

                }

                //اتخاذ قرار ما بناء على كل  حالة
                MakeDecision(c);



                return new ResponseVM(RequestTypeEnum.Success, Token.Success);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        /// <summary>
        /// اضافة عملية دفع جديدة اذا كان قد دفع عربون
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        private object AddNewPayment(EnquiryStatusVM c)
        {
            if (c.StatusId == EnquiryStatusTypesEnum.BankTransferDeposit || c.IsBankTransferDeposit)
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
                c.EnquiryPaymentId = new EnquiryPaymentsBLL().Add(new EnquiryPaymentVM
                {
                    Amount = c.Amount,
                    IsDeposit = true,
                    IsBankTransfer = true,
                    EnquiryId = c.EnquiryId,
                    IsAcceptFromManger = false,
                    BranchId=c.EnquiryBranchId
                }, ImagePath);

            }
            else if (c.StatusId == EnquiryStatusTypesEnum.DesireToBook)
            {
                c.EnquiryPaymentId = new EnquiryPaymentsBLL().Add(new EnquiryPaymentVM
                {
                    Amount = c.Amount,
                    IsDeposit = true,
                    IsBankTransfer = false,
                    EnquiryId = c.EnquiryId,
                    IsAcceptFromManger = false,
                    BranchId = c.EnquiryBranchId

                }, null);
            }
            return null;
        }

        private void MakeDecision(EnquiryStatusVM c)
        {
            switch (c.StatusId)
            {
                case EnquiryStatusTypesEnum.NotAnswer:
                case EnquiryStatusTypesEnum.CustomerContacted:
                case EnquiryStatusTypesEnum.FullApproval:
                    break;
                case EnquiryStatusTypesEnum.RejectService:
                    {
                        db.Enquires_Closed(c.EnquiryId, DateTime.Now).Select(v => new
                        {
                            v.Enquiry_ClendarEventId,
                            v.Event_ClendarEventId
                        }).ToList().ForEach(v =>
                        {
                            GoggelApiCalendarService.DeleteEvent(v.Enquiry_ClendarEventId);
                            GoggelApiCalendarService.DeleteEvent(v.Event_ClendarEventId);
                        });
                    }
                    break;
                case EnquiryStatusTypesEnum.ScheduleVisit:
                    {
                        string Title, Description, ClinetName = c.ClinetName;
                        if (this.IsEn)
                        {
                            Title = "Schedule Visit";
                            Description = $"Today's visit is scheduled for the client: {ClinetName}";
                        }
                        else
                        {
                            Title = "تحديد موعد زيارة ";
                            Description = $"تم تحديد موعد زيارة اليوم لـ العميل : {ClinetName}";
                        }

                        Event Even = GoggelApiCalendarService.AddEvent(Title, Description, c.ScheduleVisitDateTime.Value, "Egypt Pyramids Tours, Ad Doqi, Giza District, Giza Governorate 12411, Egypt");
                        db.Enquiries_UpdateCalendarEventId(c.EnquiryId, Even.Id);
                    }
                    break;
                case EnquiryStatusTypesEnum.NeedsToThink:
                case EnquiryStatusTypesEnum.DesireToBook:
                case EnquiryStatusTypesEnum.BankTransferDeposit:
                    break;
            }
        }

        /// <summary>
        /// هذ الدالة هى لعمل فيلتر لـ البيانات القادمة من المستخدم 
        /// لان كل حالة ولها حقول اضافية
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        private EnquiryStatusVM GetEnquiyStatusPure(EnquiryStatusVM c)
        {
            EnquiryStatusVM ObjectReturn = new EnquiryStatusVM
            {
                //هنا نضع المتغيرات  الاساسبة 
                EnquiryId = c.EnquiryId,
                StatusId = c.StatusId,
                Notes = c.Notes,
                EnquiryBranchId = c.EnquiryBranchId,
                DateTime = DateTime.Now,
                IsWithBranch = true
            };
            switch (c.StatusId)
            {
                case EnquiryStatusTypesEnum.NotAnswer:
                    {
                        //يجب ان يتحول الى الآدارة 
                        ObjectReturn.IsWithBranch = true;
                    }
                    break;
                case EnquiryStatusTypesEnum.CustomerContacted:
                    {
                        ObjectReturn.IsWithBranch = false;
                    }
                    break;
                case EnquiryStatusTypesEnum.RejectService:
                    {
                        //اغلاق الطلب اذا يريد ذالك
                        ObjectReturn.IsWithBranch = false;
                    }
                    break;
                case EnquiryStatusTypesEnum.FullApproval:
                    break;
                case EnquiryStatusTypesEnum.ScheduleVisit:
                    {
                        ObjectReturn.ScheduleVisitDateTime = c.ScheduleVisitDateTime;
                    }
                    break;
                case EnquiryStatusTypesEnum.NeedsToThink:
                    break;
                case EnquiryStatusTypesEnum.DesireToBook:
                    {
                        ObjectReturn.Amount = c.Amount;
                    }
                    break;
                case EnquiryStatusTypesEnum.BankTransferDeposit:
                    {
                        ObjectReturn.Amount = c.Amount;
                        ObjectReturn.BankTransferImageName = c.BankTransferImageName;
                        ObjectReturn.BankTransferImage = c.BankTransferImage;
                        ObjectReturn.IsBankTransferDeposit = true;
                    }
                    break;
            }
            return ObjectReturn;
        }

        public void SendAndSaveNotification(EnquiryStatusTypesEnum enquiryType, Int64 userTargetId, bool isToBranch, long targetId)
        {
            string UserName = "";
            //التحقق لان الادرة لها نص معين والفرع لة نص معين
            if (isToBranch)
                UserName = this.IsEn ? "Manger" : "المدير";
            else
                UserName = this.UserLoggad.UserName;

            var Notify = new NotifyVM
            {
                TitleAr = "اضافة حالة جديدة على استفسار ما",
                TitleEn = "Add New Status On Some Enquiry",
                DescriptionAr = $"لقد قام { UserName} بـ وضع حالة جديد   ",
                DescriptionEn = $"{ UserName} Has Been Add New Status",
                DateTime = DateTime.Now,
                TargetId = targetId,
                PageId = (int)PagesEnum.Enquires,
                RedirectUrl = $"/Enquires/EnquiryInformation?id={targetId}&notifyId=",
            };


            NotificationsBLL.Add(Notify, userTargetId);
            new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { userTargetId.ToString() }, Notify);
        }

    }//end class
}

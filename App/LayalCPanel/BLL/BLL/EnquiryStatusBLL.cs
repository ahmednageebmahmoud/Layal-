using BLL.BLL;
using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using DAL;
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

        public async Task<object> AddNewStatus(EnquiryStatusVM c)
        {
            try
            {
                var Enquiry = db.Enquires_SelectByPk(c.EnquiryId).FirstOrDefault();

                if (Enquiry==null)
                    return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsNotFound);

                if (Enquiry.IsClosed==true)
                    return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

                //check if create event 
                if (Enquiry.IsCreatedEvent)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDoAnyThingBecuseThisEnquiryConvertedToEvent);

                //Check From Date Time
                if (c.DateTime.HasValue && c.DateTime.Value < DateTime.Now)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotInsertDateLessThanCurrentDate);

                //check if with admin
                if(this.UserLoggad.IsBranchManager&&!Enquiry.IsWithBranch)
                    return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryWithAdmin);

                //Check If Current Employee in The same enquiry
                if (this.AdminId != this.UserLoggad.Id && c.BranchId != this.UserLoggad.BrId)
                    return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEnquiry);

             

                c = GetEnquiyStatusPure(c);

                /*
                اذا كانت هناك عملية  حجز بـحوالة بنكية فيجب حفظ صورة الحوالة   
                نقوم بـ حفظ عملية لدفع بدام هناك عملية حجز بعربون
                 */
                var ObjReturn = AddNewPayment(c);
                if (ObjReturn != null) return ObjReturn;



                db.EnquiryStatus_Insert(c.Notes, c.DateTime, c.EnquiryId, (int)c.StatusId, c.ScheduleVisitDateTime, this.UserLoggad.Id, c.IsWithBranch, c.EnquiryPaymentId);

                //هنا يتم اتمام العمليات المعتمدة على ذالك  بـ الاضافة الى الاشعارات
                if (this.UserLoggad.AccountTypeId == AccountTypeEnum.BranchManager)
                {
                    SendAndSaveNotification(Enquiry,c.StatusId, this.AdminId, false, c.EnquiryId);
                }
                else
                {
                    var UserMangerBranch = db.Users_SelectByBranchId(c.EnquiryBranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                    if (UserMangerBranch != null)
                        SendAndSaveNotification(Enquiry,c.StatusId, UserMangerBranch.Id, true, c.EnquiryId);
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
            if (c.StatusId == EnquiryStatusTypesEnum.BookByBankTransfer || c.IsBookByBankTransfer)
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
                    BranchId = c.EnquiryBranchId
                }, ImagePath);

            }
            else if (c.StatusId == EnquiryStatusTypesEnum.BookByCash)
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
                    {
                        //ارا

                        break;
                    }
                case EnquiryStatusTypesEnum.CustomerContacted:
                case EnquiryStatusTypesEnum.FullApproval:
                    break;
                case EnquiryStatusTypesEnum.RejectService:
                    {
                        db.Enquires_Closed(c.EnquiryId, DateTime.Now).Select(v => new
                        {
                            v.ScheduleVisitDateClendarEventId,
                            v.VistToCoordinationClendarEventId,
                            v.Event_ClendarEventId
                        }).ToList().ForEach(v =>
                        {
                            GoggelApiCalendarService.DeleteEvent(v.ScheduleVisitDateClendarEventId);
                            GoggelApiCalendarService.DeleteEvent(v.VistToCoordinationClendarEventId);
                            GoggelApiCalendarService.DeleteEvent(v.Event_ClendarEventId);
                        });

                        //Update Befor (ScheduleVisitDateClendarEventId) To Null
                        db.EnquiryStatus_ResetClendersIdsToNull(c.EnquiryId);
                    }
                    break;
                case EnquiryStatusTypesEnum.ScheduleVisit:
                    {
                        var Enquiry = db.Enquires_SelectByPk(c.EnquiryId).First();
                        string Title, Description;


                        if (this.IsEn)
                        {
                            Title = "Schedule Visit";
                            Description = $"Today's visit is scheduled for the client {Enquiry.FirstName} /n and city {Enquiry.CityNameEn} /n and phone number {Enquiry.PhoneIsoCode}{Enquiry.PhoneNo}";
                        }
                        else
                        {
                            Title = "تحديد موعد زيارة ";
                            Description = $"تم تحديد موعد زيارة اليوم لـ العميل لـ {Enquiry.FirstName} /n والمدينة {Enquiry.CityNameAr} /n ورقم الهاتف {Enquiry.PhoneIsoCode}{Enquiry.PhoneNo} ";
                        }

                        //جلب معرفات الزيارات السابقة وحذفهم
                        db.EnquiryStatus_SelectByFilter(c.EnquiryId, (int)EnquiryStatusTypesEnum.ScheduleVisit).ToList().ForEach(v =>
                        {
                            GoggelApiCalendarService.DeleteEvent(v.ScheduleVisitDateClendarEventId);
                        });
                        Event Even = GoggelApiCalendarService.AddEvent(Title, Description, c.ScheduleVisitDateTime.Value, "Egypt Pyramids Tours, Ad Doqi, Giza District, Giza Governorate 12411, Egypt");
                        db.EnquiryStatus_Update(c.Id, Even.Id);
                    }
                    break;
                case EnquiryStatusTypesEnum.NeedsToThink:
                case EnquiryStatusTypesEnum.BookByCash:
                case EnquiryStatusTypesEnum.BookByBankTransfer:
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
                        ObjectReturn.IsWithBranch = false;
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
                case EnquiryStatusTypesEnum.BookByCash:
                    {
                        ObjectReturn.Amount = c.Amount;
                    }
                    break;
                case EnquiryStatusTypesEnum.BookByBankTransfer:
                    {
                        ObjectReturn.Amount = c.Amount;
                        ObjectReturn.BankTransferImageName = c.BankTransferImageName;
                        ObjectReturn.BankTransferImage = c.BankTransferImage;
                        ObjectReturn.IsBookByBankTransfer = true;
                    }
                    break;
            }
            return ObjectReturn;
        }

        public void SendAndSaveNotification(Enquires_SelectByPk_Result enq, EnquiryStatusTypesEnum enquiryType, Int64 userTargetId, bool isToBranch, long targetId)
        {
            var Status = db.EnquiryStatusTypes_SelectByPK((int)enquiryType).First();
            var Notify = new NotifyVM()
            {
                DateTime = DateTime.Now,
                TargetId = targetId,
                PageId = (int)PagesEnum.Enquires,
                RedirectUrl = $"/Enquires/EnquiryInformation?id={targetId}&notifyId=",
            };

            Notify.TitleAr = "اضافة حالة جديدة على استفسار ما";
            Notify.TitleEn = "Add New Status On Some Enquiry";
            Notify.DescriptionAr = string.Format("لقد تم اضافة حالة {0} على استفسار {1} {2}", Status.Ar, enq.FirstName, enq.LastName);
            Notify.DescriptionEn = string.Format("Ahmed has been adde status {0} on enquiry {1} {2}", Status.En, enq.FirstName, enq.LastName);
            NotificationsBLL.Add(Notify, userTargetId);
            new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { userTargetId.ToString() }, Notify);
        }

    }//end class
}

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
    public class EventsBLL : BasicBLL
    {

        NotificationsBLL NotificationsBLL = new NotificationsBLL();
        public object GetEvents(EventVM even)
        {
            bool? IsWithBranch = null;
            //اذا كان الميتخدم الحالى هوا مدير فرع فـ يجب عرض الاستفسارات التى تخصة فقط
            if (this.UserLoggad.AccountTypeId == AccountTypeEnum.BranchManager)
            {
                even.BranchId = this.UserLoggad.BrId;
                IsWithBranch = true;
            }

            var Events = db.Events_SelectByFilter
                (even.Skip, even.Take, even.IsClinetCustomLogo,
                even.IsNamesAr, even.NameGroom, even.NameBride, even.EventDateTo, even.EventDateFrom, even.CreateDateTo,
                even.CreateDateFrom, even.PackageId, even.PrintNameTypeId, even.BranchId, null, null)
                .Select(c => new EventVM
                {
                    Id = c.Id,
                    IsClinetCustomLogo = c.IsClinetCustomLogo,
                    LogoFilePath = c.LogoFilePath,
                    IsNamesAr = c.IsNamesAr,
                    NameGroom = c.NameGroom,
                    NameBride = c.NameBride,
                    EventDateTime = c.EventDateTime,
                    CreateDateTime = c.CreateDateTime,
                    PackageId = c.FKPackage_Id,
                    PrintNameTypeId = c.FKPrintNameType_Id,
                    ClinetId = c.FKClinet_Id,
                    Notes = c.Notes,
                    UserCreaedId = c.FKUserCreaed_Id,
                    BranchId = c.FKBranch_Id,
                    IsClosed = c.IsClosed,
                    EnquiryName = c.EnquiryName,
                    ClendarEventId = c.ClendarEventId,
                    PackagePrice = c.PackagePrice,
                    TotalPaymentsActivated = c.TotalPaymentsActivated,
                    PackageNamsArExtraPrice = c.PackageNamsArExtraPrice,
                    Package = new PackageVM
                    {
                        NameAr = c.Package_NameAr,
                        NameEn = c.Package_NameEn,
                    },
                    PrintNameType = new PrintNamesTypeVM
                    {
                        NameAr = c.WordPrintNamesType_NameAr,
                        NameEn = c.WordPrintNamesType_NameEn
                    },
                    Branch = new BranchVM
                    {
                        NameAr = c.Branch_NameAr,
                        NameEn = c.Branch_NameEn
                    }
                }).ToList();
            if (Events.Count == 0)
            {
                if (even.Skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Events);
        }

        public object GetEventPhotographers(long eventId)
        {
            var EventUsers = db.EventPhotographers_SelectAllUsers(eventId)
                .Select(c => new EventPhotographerVM
                {
                    Id = c.EveId,
                    UserFullName = string.IsNullOrEmpty(c.FullName) ? c.UserName : c.FullName,
                    DateTime = c.EveCreateDateTime,
                    EventId = eventId,
                    UserId = c.Id,
                    IsSelected = c.EveId.HasValue
                }).ToList();

            if (EventUsers.Count == 0)
            {
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoPhotographersFound);
            }
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventUsers);

        }

        public object GetEventForCurrretnEmployee(long eventId)
        {
            return new ResponseVM(RequestTypeEnum.Success, Token.Success, GetEventInformation(eventId));
        }

        public object GetEventsForCurrretnEmployee(EventVM even, int workTypeId)
        {
            var Events = new List<EventVM>();
            if (this.UserLoggad.IsPhotographerOrHelper)
            {
                /*
             بما ان هذا حساب مصور فيجب جلب المناسبات الذى فى جدول مصورين المناسبات    
             */

                Events = db.EventPhotographers_SelectEventsByFilter
                    (even.Skip, even.Take, even.IsClinetCustomLogo,
                    even.IsNamesAr, even.NameGroom, even.NameBride, even.EventDateTo, even.EventDateFrom, even.PackageId, this.UserLoggad.Id)
                    .Select(c => new EventVM
                    {
                        Id = c.Id,
                        IsClinetCustomLogo = c.IsClinetCustomLogo,
                        NameGroom = c.NameGroom,
                        NameBride = c.NameBride,
                        IsClosed = c.IsClosed,
                        WorkTypeId = workTypeId,
                        Package = new PackageVM
                        {
                            NameAr = c.Package_NameAr,
                            NameEn = c.Package_NameEn,
                        },
                        PrintNameType = new PrintNamesTypeVM
                        {
                            NameAr = c.WordPrintNamesType_NameAr,
                            NameEn = c.WordPrintNamesType_NameEn
                        },
                        CurrentWorkStatus = db.EventTaskStatusHistories_SelectLast(c.Id, workTypeId).Select(v => new EventWorkStatusVM
                        {
                            FinshedUserName = v.UserName,
                            DateTime = v.DateTime,
                            IsFinshed = v.IsFinshed
                        }).FirstOrDefault(),
                        EventWorkStatusIsFinshed = new EventWorksStatusIsFinshedVM
                        {
                            Booking = c.Booking,
                            DataPerfection = c.DataPerfection,
                            Coordination = c.Coordination,
                            Implementation = c.Implementation,
                            ArchivingAndSaveing = c.ArchivingAndSaveing,
                            ProductProcessing = c.ProcessingProducts,
                            Chooseing = c.Choosing,
                            DigitalProcessing = c.DigitalProcessing,
                            PreparingForPrinting = c.PreparingForPrinting,
                            Manufacturing = c.Manufacturing,
                            QualityAndReview = c.QualityAndReview,
                            Packaging = c.Packaging,
                            TransmissionAndDelivery = c.TransmissionAndDelivery,
                            Archiving = c.Archiving,
                        }
                    }).ToList();
            }
            else
            {
                //غير ذالك نقوم بجلب المناسبات العادية الذى فى جدول توزيع اوامر العمل على الموظفين
                Events = db.Events_SelectByFilterForEmployee
                (even.Skip, even.Take, even.IsClinetCustomLogo,
                even.IsNamesAr, even.NameGroom, even.NameBride, even.EventDateTo, even.EventDateFrom, even.PackageId, even.PrintNameTypeId, workTypeId, this.UserLoggad.Id, even.IsFinshed)
                .Select(c => new EventVM
                {
                    Id = c.Id,
                    IsClinetCustomLogo = c.IsClinetCustomLogo,
                    NameGroom = c.NameGroom,
                    NameBride = c.NameBride,
                    IsClosed = c.IsClosed,
                    WorkTypeId = workTypeId,

                    Package = new PackageVM
                    {
                        NameAr = c.Package_NameAr,
                        NameEn = c.Package_NameEn,
                    },
                    PrintNameType = new PrintNamesTypeVM
                    {
                        NameAr = c.WordPrintNamesType_NameAr,
                        NameEn = c.WordPrintNamesType_NameEn
                    },
                    CurrentWorkStatus = db.EventTaskStatusHistories_SelectLast(c.Id, workTypeId).Select(v => new EventWorkStatusVM
                    {
                        FinshedUserName = v.UserName,
                        DateTime = v.DateTime,
                        IsFinshed = v.IsFinshed
                    }).FirstOrDefault(),
                    EventWorkStatusIsFinshed = new EventWorksStatusIsFinshedVM
                    {
                        Booking = c.Booking,
                        DataPerfection = c.DataPerfection,
                        Coordination = c.Coordination,
                        Implementation = c.Implementation,
                        ArchivingAndSaveing = c.ArchivingAndSaveing,
                        ProductProcessing = c.ProcessingProducts,
                        Chooseing = c.Choosing,
                        DigitalProcessing = c.DigitalProcessing,
                        PreparingForPrinting = c.PreparingForPrinting,
                        Manufacturing = c.Manufacturing,
                        QualityAndReview = c.QualityAndReview,
                        Packaging = c.Packaging,
                        TransmissionAndDelivery = c.TransmissionAndDelivery,
                        Archiving = c.Archiving,
                    }
                }).ToList();
            }

            if (Events.Count == 0)
            {
                if (even.Skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Events);
        }

        public object UpdateEventPhotographers(List<EventPhotographerVM> dis)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {

                    db.EventPhotographers_Delete(dis[0].EventId);
                    dis.Where(v => v.IsSelected).ToList().ForEach(c =>
                     {
                         ObjectParameter Id = new ObjectParameter("Id", typeof(Int64));
                         db.EventPhotographers_Insert(Id, c.EventId, c.UserId, DateTime.Now);
                     });

                    tranc.Commit();
                    return new ResponseVM(RequestTypeEnum.Success, Token.Updated);
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return new ResponseVM(RequestTypeEnum.Success, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        public EventVM GetEventInformation(long? eventId)
        {
            if (!eventId.HasValue) return null;
            var EventWorkStatus = db.EventTaskStatusHistories_SelectByEventId(eventId).Select(c => new EventWorkStatusVM
            {
                IsFinshed = c.IsFinshed,
                WorkTypeId = (WorksTypesEnum)c.FKWorkType_Id,
                DateTime = c.DateTime,
                UserId = c.FKUsre_Id,
                FinshedUserName = c.FullName,
                FinshedAccountTypeNameAr = c.AccountTypeAr,
                FinshedAccountTypeNameEn = c.AccountTypeEn
            }).ToList();

            return db.Events_SelectInformation(eventId).Select(c => new EventVM
            {
                Id = c.Id,
                IsClinetCustomLogo = c.IsClinetCustomLogo,
                LogoFilePath = c.LogoFilePath,
                IsNamesAr = c.IsNamesAr,
                NameGroom = c.NameGroom,
                NameBride = c.NameBride,
                EventDateTime = c.EventDateTime,
                CreateDateTime = c.CreateDateTime,
                PackageId = c.FKPackage_Id,
                PrintNameTypeId = c.FKPrintNameType_Id,
                ClinetId = c.FKClinet_Id,
                Notes = c.Notes,
                UserCreaedId = c.FKUserCreaed_Id,
                BranchId = c.FKBranch_Id,
                IsClosed = c.IsClosed,
                ClinetUserName = c.Clinet_UserName,
                UserCreatedUserName = c.UserCreated_UserName,
                PackageNamsArExtraPrice = c.PackageNamsArExtraPrice,
                PackagePrice = c.PackagePrice,
                TotalPayments = c.TotalPayments,
                TotalPaymentsActivated = c.TotalPaymentsActivated,
                VistToCoordinationDateTime = c.VistToCoordinationDateTime,
                EventWorksStatus = EventWorkStatus,
                EventWorkStatusIsFinshed = new EventWorksStatusIsFinshedVM
                {
                    Booking = c.Booking,
                    DataPerfection = c.DataPerfection,
                    Coordination = c.Coordination,
                    Implementation = c.Implementation,
                    ArchivingAndSaveing = c.ArchivingAndSaveing,
                    ProductProcessing = c.ProcessingProducts,
                    Chooseing = c.Choosing,
                    DigitalProcessing = c.DigitalProcessing,
                    PreparingForPrinting = c.PreparingForPrinting,
                    Manufacturing = c.Manufacturing,
                    QualityAndReview = c.QualityAndReview,
                    Packaging = c.Packaging,
                    TransmissionAndDelivery = c.TransmissionAndDelivery,
                    Archiving = c.Archiving,
                },



                Package = new PackageVM
                {
                    NameAr = c.Package_NameAr,
                    NameEn = c.Package_NameEn,
                    IsPrintNamesFree = c.Package_IsPrintNamesFree
                },
                PrintNameType = new PrintNamesTypeVM
                {
                    NameAr = c.PrintNameType_NameAr,
                    NameEn = c.PrintNameType_NameEn
                },

            }).FirstOrDefault();

        }
        /// <summary>
        /// الحقق من ان الستخد قام بـ دفع كامل المستخقات
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        private bool CheckIsPayment(long eventId)
        {
            return db.EnquiryPayments_CheckIfPaymentedDeposit(eventId).First().Value;
        }

        public object SaveChange(EventVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    //التحقق ان الاستفسار لم يغلق بعد
                    if (CheckIfEnquiryClosed(c.Id))
                        return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = Add(c);
                            break;
                        case StateEnum.Update:
                            ObjectReturn = Update(c);
                            break;
                        case StateEnum.Delete:
                            ObjectReturn = Delete(c); break;
                            break;
                        default:
                            return new ResponseVM(RequestTypeEnum.Error, Token.StateNotFound);
                    }
                    tranc.Commit();
                    return ObjectReturn;
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    FileService.RemoveFile(c.LogoFilePath);
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }

        private object Delete(EventVM c)
        {
            //db.Events_Delete(c.Id);
            // GoggelApiCalendarService.DeleteEvent(c.ClendarEventId);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Update(EventVM c)
        {

            //check if closed
            if (CheckIfEnquiryClosed(c.Id))
                return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

            c = GetPureEvent(c);

            //Save Image Now And Return Path
            if (!string.IsNullOrEmpty(c.CustomLogo))
            {
                var FileSave = FileService.SaveFile(new FileSaveVM
                {
                    FileName = c.LogoFileName,
                    FileBase64 = c.CustomLogo,
                    ServerPathSave = "/Files/Events/CustomLogos/"
                });

                if (!FileSave.IsSaved)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotsAveCustomLogo);

                c.LogoFilePath = FileSave.SavedPath;
            }

            //تحديث الاسعار
            var OldEvent = db.Events_SelectByPK(c.Id).First();
            var Package = db.Packages_SelectByPK(c.PackageId).First();
            if (OldEvent.FKPackage_Id != c.PackageId)
            {
                //اذا هناك تغيرات فى الاسعار فيجب الاحتساب مجددا
                c.PackagePrice = Package.Price;
                if (OldEvent.IsNamesAr != c.IsNamesAr)
                {
                    if (c.IsNamesAr == true)
                        c.PackageNamsArExtraPrice = Package.NamsArExtraPrice;
                    else
                        c.PackageNamsArExtraPrice = 0;
                }
            }
            else if (OldEvent.IsNamesAr != c.IsNamesAr)
            {
                if (c.IsNamesAr == true)
                    c.PackageNamsArExtraPrice = Package.NamsArExtraPrice;

                else
                    c.PackageNamsArExtraPrice = 0;
            }
            //اضافة سعر الحفر اذا كان ليس مجانى فى هذة الباكج 
            if (Package.IsPrintNamesFree)
                c.NamesPrintingPrice = 0;
            else if (c.PrintNameTypeId.HasValue && c.PrintNameTypeId.Value > 0)
                c.NamesPrintingPrice = db.PrintNameTypes_SelectByPK(c.PrintNameTypeId).First().Price;


            db.Events_Update(c.Id, c.IsClinetCustomLogo, c.LogoFilePath, c.IsNamesAr, c.NameGroom, c.NameBride, c.EventDateTime,
                c.Package.Id, c.PrintNameTypeId, c.Notes, c.PackagePrice, c.PackageNamsArExtraPrice, c.VistToCoordinationDateTime, c.NamesPrintingPrice);

            //التفريغ بحيث اذا حدث خطاء ما لا يتم حذفة من السيرفر
            c.LogoFilePath = null;

            GoggelApiCalendarService.DeleteEvent(c.ClendarEventId);
            GoggelApiCalendarService.DeleteEvent(c.VistToCoordinationClendarEventId);
            AddGoogelEvent(c);

            //نقوم بتوزيع اومر العمل على الموظفين
            this.DistributionWorkOrderToDefaultEmployees(c.Id, c.BranchId.Value);

            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        /// <summary>
        /// توزيع اومر العمل على الموظفن الافترضيين الذين وضع بشكل مباشر فى اعدادت البرانش
        /// </summary>
        public void DistributionWorkOrderToDefaultEmployees(long eventId, int branchId)
        {
            //جلب الموظفين الافتراضيين
            var Branch = db.Branches_SelectByPk(branchId).FirstOrDefault();

            //موظف التنسيق
            if (Branch.FKCoordinationEmployee_Id.HasValue&&db.EmployeeDistributionTasks_CheckIfInserted((int)WorksTypesEnum.Coordination, eventId, branchId,false).First().Value == 0)
                db.EmployeeDistributionTasks_Insert(new ObjectParameter("id", typeof(int)), (int)WorksTypesEnum.Coordination, Branch.FKCoordinationEmployee_Id, eventId, false, branchId).First();

            //موظف التنفيذ
            if (Branch.FKImplementationEmployeeId_Id.HasValue && db.EmployeeDistributionTasks_CheckIfInserted((int)WorksTypesEnum.Implementation, eventId, branchId, false).First().Value == 0)
                db.EmployeeDistributionTasks_Insert(new ObjectParameter("id", typeof(int)), (int)WorksTypesEnum.Implementation, Branch.FKImplementationEmployeeId_Id, eventId, false, branchId).First();

            //موظف الارشفة
            if (Branch.FKArchivingAndSaveingEmployee_Id.HasValue && db.EmployeeDistributionTasks_CheckIfInserted((int)WorksTypesEnum.ArchivingAndSaveing, eventId, branchId, false).First().Value == 0)
                db.EmployeeDistributionTasks_Insert(new ObjectParameter("id", typeof(int)), (int)WorksTypesEnum.ArchivingAndSaveing, Branch.FKArchivingAndSaveingEmployee_Id, eventId, false, branchId).First();

            //موظف الارشفة من الفرع الاخر
            if (Branch.FKArchivingAndSaveingAnotherBranch_Id.HasValue && db.EmployeeDistributionTasks_CheckIfInserted((int)WorksTypesEnum.ArchivingAndSaveing, eventId, branchId, true).First().Value == 0)
            {
                var AnotherBranch = db.Branches_SelectByPk(Branch.FKArchivingAndSaveingAnotherBranch_Id).FirstOrDefault();
                if(AnotherBranch.FKArchivingAndSaveingEmployee_Id.HasValue)
                db.EmployeeDistributionTasks_Insert(new ObjectParameter("id", typeof(int)), (int)WorksTypesEnum.ArchivingAndSaveing, AnotherBranch.FKArchivingAndSaveingEmployee_Id.Value, eventId, true, AnotherBranch.Id).First();
            }

        }


        private object Add(EventVM c)
        {
            //نقوم بملىء معرلف العميل
            var Enquiry = db.Enquires_SelectByPk_SimpleData(c.Id).First();
            if (Enquiry.IsCreatedEvent)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDuplicateEventWithOneEnquiry);

            c.ClinetId = Enquiry.FkClinet_Id.Value;
            c.BranchId = Enquiry.FKBranch_Id;
            c = GetPureEvent(c);

            //Save Image Now And Return Path
            if (!string.IsNullOrEmpty(c.CustomLogo))
            {
                var FileSave = FileService.SaveFile(new FileSaveVM
                {
                    FileName = c.LogoFileName,
                    FileBase64 = c.CustomLogo,
                    ServerPathSave = "/Files/Events/CustomLogos/"
                });

                if (!FileSave.IsSaved)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotsAveCustomLogo);
                c.LogoFilePath = FileSave.SavedPath;
            }

            //اضافة اخر الاسعار
            var Package = db.Packages_SelectByPK(c.PackageId).First();
            //سعر الباكج
            c.PackagePrice = Package.Price;
            //سعر طباعة الاسماء بـ العربى الاضافة 
            if (c.IsNamesAr == true)
                c.PackageNamsArExtraPrice = Package.NamsArExtraPrice;
            else
                c.PackageNamsArExtraPrice = 0;

            //اضافة سعر الحفر اذا كان ليس مجانى فى هذة الباكج 
            if (Package.IsPrintNamesFree)
                c.NamesPrintingPrice = 0;
            else if (c.PrintNameTypeId.HasValue && c.PrintNameTypeId.Value > 0)
                c.NamesPrintingPrice = db.PrintNameTypes_SelectByPK(c.PrintNameTypeId).First().Price;

            //اضاقة الحدث
            db.Events_Insert(c.Id, c.IsClinetCustomLogo, c.LogoFilePath, c.IsNamesAr, c.NameGroom, c.NameBride, c.EventDateTime, DateTime.Now,
                c.Package.Id, c.PrintNameTypeId, c.ClinetId, c.Notes,
                this.UserLoggad.Id, c.BranchId, c.PackagePrice, c.PackageNamsArExtraPrice, c.VistToCoordinationDateTime, c.NamesPrintingPrice);

            //تحديث فلاج انشاء المناسبة 
            db.Enquiries_ChangeCreateEventState(c.Id, true);

            //اضافة الحالة الافترضية وهى انشاء المناسبة
            db.EnquiryStatus_Insert(null, DateTime.Now, c.Id, (int)EnquiryStatusTypesEnum.CreateEvent, null, this.UserLoggad.Id, null, null);

            //التفريغ بحيث اذا حدث خطاء ما لا يتم حذفة من السيرفر
            c.LogoFilePath = null;

            AddGoogelEvent(c);
            BranchVM Branch = db.Branches_SelectByPk(c.BranchId).Select(v => new BranchVM
            {
                NameAr = v.BrancheNameAr,
                NameEn = v.BrancheNameEn
            }).FirstOrDefault();

            //ارسال اشعار للـ الادمين اذا كان الشخص الحالى هو عميل 
            if (this.UserLoggad.AccountTypeId == AccountTypeEnum.BranchManager)
            {
                var Notify = new NotifyVM
                {
                    TitleAr = "لقج تم انشاء حدث جديد",
                    TitleEn = "Created New Event",
                    DescriptionAr = $"لقد قام مدير فرع {Branch.NameAr} بـ انشاء حدث جديد ",
                    DescriptionEn = $"{Branch.NameEn} Branch Manger Has Been Created New Event",
                    DateTime = DateTime.Now,
                    TargetId = c.Id,
                    PageId = (int)PagesEnum.Events,
                    RedirectUrl = $"/Enquires/EnquiryInformation?id={c.Id}&notifyId=",
                };
                NotificationsBLL.Add(Notify, this.AdminId);

                //نقوم بتوزيع اومر العمل على الموظفين
                this.DistributionWorkOrderToDefaultEmployees(c.Id, c.BranchId.Value);

                new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

        private EventVM GetPureEvent(EventVM c)
        {
            if (!c.IsClinetCustomLogo.HasValue || !c.IsClinetCustomLogo.Value)
            {
                c.CustomLogo = null;
            }
            return c;
        }

        public object SelectById(long id)
        {


            var Event = db.Events_SelectByPK(id).Select(c => new EventVM
            {
                Id = c.Id,
                IsClinetCustomLogo = c.IsClinetCustomLogo,
                LogoFilePath = c.LogoFilePath,
                IsNamesAr = c.IsNamesAr,
                NameGroom = c.NameGroom,
                NameBride = c.NameBride,
                EventDateTime = c.EventDateTime,
                CreateDateTime = c.CreateDateTime,
                PackageId = c.FKPackage_Id,
                PrintNameTypeId = c.FKPrintNameType_Id,
                ClinetId = c.FKClinet_Id,
                Notes = c.Notes,
                UserCreaedId = c.FKUserCreaed_Id,
                BranchId = c.FKBranch_Id,
                PackageNamsArExtraPrice = c.PackageNamsArExtraPrice,
                PackagePrice = c.PackagePrice,
                TotalPayments = c.TotalPayments,
                TotalPaymentsActivated = c.TotalPaymentsActivated,
                VistToCoordinationClendarEventId = c.VistToCoordinationClendarEventId,
                VistToCoordinationDateTime = c.VistToCoordinationDateTime,
            }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Event == null || (this.UserLoggad.IsClinet && Event.ClinetId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Event} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Event);
        }

        async void AddGoogelEvent(EventVM c)
        {

            string Title, Description, TitleVist, DescriptionVist;
            var Enquiry = db.Enquires_SelectByPk(c.Id).First();




            if (this.IsEn)
            {
                Title = "Event";
                TitleVist = "Vist Branch To Coordination";
                DescriptionVist = $"Today's visit is scheduled for the client {Enquiry.FirstName} /n and city {Enquiry.CityNameEn} /n and phone number {Enquiry.PhoneIsoCode}{Enquiry.PhoneNo}";
                Description = $"Today's new event with package : {c.Package.NameEn}";
            }
            else
            {
                Title = "مناسبة ";
                TitleVist = "زيارة الفرع للاعداد والتنسيق للمقابلة";

                DescriptionVist = $"تم تحديد موعد زيارة اليوم لـ العميل لـ {Enquiry.FirstName} /n والمدينة {Enquiry.CityNameAr} /n ورقم الهاتف {Enquiry.PhoneIsoCode}{Enquiry.PhoneNo} ";
                Description = $"مناسبة جديدة اليوم مع حزمة: {c.Package.NameAr}";
            }

            Event Even1 = GoggelApiCalendarService.AddEvent(Title, Description, c.EventDateTime, "Egypt Pyramids Tours, Ad Doqi, Giza District, Giza Governorate 12411, Egypt");
            Event EvenVist = GoggelApiCalendarService.AddEvent(TitleVist, DescriptionVist, c.VistToCoordinationDateTime, "Egypt Pyramids Tours, Ad Doqi, Giza District, Giza Governorate 12411, Egypt");

            db.Events_UpdateCalendarEventId(c.Id, Even1.Id, EvenVist.Id, true, true);
        }



    }//end class
}

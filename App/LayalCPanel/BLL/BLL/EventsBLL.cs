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
            if (this.UserLoggad.AccountTypeId == (int)AccountTypeEnum.BranchManager)
            {
                even.BranchId = this.UserLoggad.BranchId;
                IsWithBranch = true;
            }

            var Events = db.Events_SelectByFilter
                (even.Skip, even.Take, even.IsClinetCustomLogo, even.IsLogoAr,
                even.IsNamesAr, even.NameGroom, even.NameBride, even.EventDateTo,even.EventDateFrom, even.CreateDateTo,
                even.CreateDateFrom, even.PackageId, even.PrintNameTypeId, even.BranchId, even.IsActive, null, null)
                .Select(c => new EventVM
                {
                    Id = c.Id,
                    IsClinetCustomLogo = c.IsClinetCustomLogo,
                    IsLogoAr = c.IsLogoAr,
                    LogoFilePath = c.LogoFilePath,
                    IsNamesAr = c.IsNamesAr,
                    NameGroom = c.NameGroom,
                    NameBride = c.NameBride,
                    EventDateTime = c.EventDateTime,
                    CreateDateTime = c.CreateDateTime,
                    EnquiryId = c.FkEnquiryForm_Id,
                    PackageId = c.FKPackage_Id,
                    PrintNameTypeId = c.FKPrintNameType_Id,
                    ClinetId = c.FKClinet_Id,
                    Notes = c.Notes,
                    UserCreaedId = c.FKUserCreaed_Id,
                    BranchId = c.FKBranch_Id,
                    IsActive = c.IsActive,
                    IsCanNotUpdate = c.IsCanNotUpdate,
                    EnquiryName = c.EnquiryName,
                    ClendarEventId=c.ClendarEventId,
                    EnquiryIsClosed = c.EnquiryIsClosed,

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

        public object SelectInformation(long id)
        {
            var Event = db.Events_SelectInformation(id).Select(c => new EventVM
            {
                Id = c.Id,
                IsClinetCustomLogo = c.IsClinetCustomLogo,
                IsLogoAr = c.IsLogoAr,
                LogoFilePath = c.LogoFilePath,
                IsNamesAr = c.IsNamesAr,
                NameGroom = c.NameGroom,
                NameBride = c.NameBride,
                EventDateTime = c.EventDateTime,
                CreateDateTime = c.CreateDateTime,
                EnquiryId = c.FkEnquiryForm_Id,
                PackageId = c.FKPackage_Id,
                PrintNameTypeId = c.FKPrintNameType_Id,
                ClinetId = c.FKClinet_Id,
                Notes = c.Notes,
                UserCreaedId = c.FKUserCreaed_Id,
                BranchId = c.FKBranch_Id,
                IsActive = c.IsActive,
                IsCanNotUpdate = c.IsCanNotUpdate,
                ClinetUserName=c.Clinet_UserName,
                UserCreatedUserName=c.UserCreated_UserName,
                EnquiryIsClosed=c.EnquiryIsClosed,
                Branch =new BranchVM
                {
                    NameAr=c.Branch_NameAr,
                    NameEn=c.Branch_NameEn
                },
                Package = new PackageVM
                {
                    NameAr = c.Package_NameAr,
                    NameEn = c.Package_NameEn,
                    IsAllowPrintNames = c.Package_IsAllowPrintNames
                },
                PrintNameType = new PrintNamesTypeVM
                {
                    NameAr = c.PrintNameType_NameAr,
                    NameEn = c.PrintNameType_NameEn
                }
            }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Event == null || (this.UserLoggad.IsClinet && Event.ClinetId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Event} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Event);

        }

        public object SaveChange(EventVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    //التحقق ان الاستفسار لم يغلق بعد
                    if (CheckIfEnquiryClosed(c.EnquiryId.Value))
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

        private object ChangeActive(EventVM c)
        {
            //التحقق ان الاستفسار لم يغلق بعد
            if (CheckIfEnquiryClosed(c.EnquiryId.Value))
                return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

            db.Events_ChangeActive(c.Id, c.IsActive);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Update(EventVM c)
        {

            if (c.IsCanNotUpdate)
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotUpdate);

            
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

            db.Events_Update(c.Id, c.IsClinetCustomLogo, c.IsLogoAr, c.LogoFilePath, c.IsNamesAr, c.NameGroom, c.NameBride, c.EventDateTime,
                c.Package.Id, c.PrintNameTypeId, c.Notes);


            GoggelApiCalendarService.DeleteEvent(c.ClendarEventId);
            AddGoogelEvent(c);

            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        private object Add(EventVM c)
        {
            //نقوم بملىء معرلف العميل
            var Enquiry = db.Enquires_SelectByPk_SimpleData(c.EnquiryId).First();
            if (Enquiry.IsCreatedEvent)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDuplicateEventWithOneEnquiry);

            c.ClinetId = Enquiry.FkClinet_Id.Value;
            c.BranchId = Enquiry.FKBranch_Id.Value;

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

            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
            db.Events_Insert(ID, c.IsClinetCustomLogo, c.IsLogoAr, c.LogoFilePath, c.IsNamesAr, c.NameGroom, c.NameBride, c.EventDateTime, DateTime.Now, c.EnquiryId,
                c.Package.Id, c.PrintNameTypeId, c.ClinetId, c.Notes, this.UserLoggad.Id, c.BranchId, true);

            db.Enquiries_ChangeCreateEventState(c.EnquiryId, true);
            c.Id = (long)ID.Value;

            AddGoogelEvent(c);

            BranchVM Branch = db.Branches_SelectByPk(c.BranchId).Select(v => new BranchVM
            {
                NameAr = v.BrancheNameAr,
                NameEn = v.BrancheNameEn
            }).FirstOrDefault();

            //ارسال اشعار للـ الادمين اذا كان الشخص الحالى هو عميل 
            if (this.UserLoggad.AccountTypeId == (int)AccountTypeEnum.BranchManager)
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
                    RedirectUrl = $"/Events/EventInformation?id={c.Id}&notifyId=",
                };
                NotificationsBLL.Add(Notify, this.AdminId);
                new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

        private EventVM GetPureEvent(EventVM c)
        {
            if (!c.IsClinetCustomLogo.HasValue || !c.IsClinetCustomLogo.Value)
            {
                c.IsLogoAr = null;
                c.CustomLogo = null;
            }
            if (!c.Package.IsAllowPrintNames)
            {
                c.PrintNameTypeId = null;
                c.IsNamesAr = null;
            }

            if ((!c.IsClinetCustomLogo.HasValue || !c.IsClinetCustomLogo.Value) && !c.Package.IsAllowPrintNames)
            {
                c.NameBride = null;
                c.NameGroom = null;
            }
            return c;
        }

        public object SelectById(long id)
        {
            var Event = db.Events_SelectByPK(id).Select(c => new EventVM
            {
                Id = c.Id,
                IsClinetCustomLogo = c.IsClinetCustomLogo,
                IsLogoAr = c.IsLogoAr,
                LogoFilePath = c.LogoFilePath,
                IsNamesAr = c.IsNamesAr,
                NameGroom = c.NameGroom,
                NameBride = c.NameBride,
                EventDateTime = c.EventDateTime,
                CreateDateTime = c.CreateDateTime,
                EnquiryId = c.FkEnquiryForm_Id,
                PackageId = c.FKPackage_Id,
                PrintNameTypeId = c.FKPrintNameType_Id,
                ClinetId = c.FKClinet_Id,
                Notes = c.Notes,
                UserCreaedId = c.FKUserCreaed_Id,
                BranchId = c.FKBranch_Id,
                IsActive = c.IsActive,
                IsCanNotUpdate = c.IsCanNotUpdate,
            }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Event == null || (this.UserLoggad.IsClinet && Event.ClinetId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Event} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Event);
        }

        void AddGoogelEvent(EventVM c)
        {

            string Title, Description;
            if (this.IsEn)
            {
                Title = "Event";
                Description = $"Today's new event with package : {c.Package.NameEn}";
            }
            else
            {
                Title = "مناسبة ";
                Description = $"مناسبة جديدة اليوم مع حزمة: {c.Package.NameAr}";
            }

            Event Even = GoggelApiCalendarService.AddEvent(Title, Description, c.EventDateTime, "Egypt Pyramids Tours, Ad Doqi, Giza District, Giza Governorate 12411, Egypt");
            db.Events_UpdateCalendarEventId(c.EnquiryId, Even.Id);

        }

    }//end class
}

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
    public class MyEventsBLL : BasicBLL
    {

        NotificationsBLL NotificationsBLL = new NotificationsBLL();
        public object GetEvents
       (int? skip, int? take, bool? isClinetCustomLogo, bool? isLogoAr, bool? isNamesAr, string nameGroom,
          string nameBride, DateTime? eventDateTimeTo, DateTime? eventDateTimeFrom, DateTime? createDateTimeTo,
           DateTime? createDateTimeFrom, int? packageId, int? printNameTypeId, int? branchId, bool? isActive)
        {
            bool? IsWithBranch = null;
            //اذا كان الميتخدم الحالى هوا مدير فرع فـ يجب عرض الاستفسارات التى تخصة فقط
            if (this.UserLoggad.AccountTypeId == (int)AccountTypeEnum.BranchManager)
            {
                branchId = this.UserLoggad.BranchId;
                IsWithBranch = true;
            }

            var Events = db.Events_SelectByFilter
                (skip, take, isClinetCustomLogo, isNamesAr, nameGroom, nameBride, eventDateTimeTo, eventDateTimeFrom, createDateTimeTo,
            createDateTimeFrom, packageId, printNameTypeId, branchId, true, this.UserLoggad.Id)
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
                    EnquiryId = c.FkEnquiryForm_Id,
                    PackageId = c.FKPackage_Id,
                    PrintNameTypeId = c.FKPrintNameType_Id,
                    ClinetId = c.FKClinet_Id,
                    Notes = c.Notes,
                    UserCreaedId = c.FKUserCreaed_Id,
                    BranchId = c.FKBranch_Id,
                    IsClosed = c.IsClosed,
                    EnquiryName = c.EnquiryName,
                    PackagePrice = c.PackagePrice,
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
                if (skip == 0)
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
                IsClosed = c.IsClosed,
                ClinetUserName = c.Clinet_UserName,
                UserCreatedUserName = c.UserCreated_UserName,
                PackagePrice = c.PackagePrice,
                PackageNamsArExtraPrice = c.PackageNamsArExtraPrice,
                Branch = new BranchVM
                {
                    NameAr = c.Branch_NameAr,
                    NameEn = c.Branch_NameEn
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

        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }
        private object Update(EventVM c)
        {
            //check if closed
            if (CheckIfEnquiryClosed(c.EnquiryId.Value))
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
            if (OldEvent.IsNamesAr != c.IsNamesAr)
            {
                if (c.IsNamesAr == true)
                    c.PackageNamsArExtraPrice = Package.NamsArExtraPrice;
                else
                    c.PackageNamsArExtraPrice = 0;
            }

            db.Events_Update2(c.Id, c.IsClinetCustomLogo, c.LogoFilePath, c.IsNamesAr, c.NameGroom, c.NameBride, c.PrintNameTypeId,  c.PackagePrice, c.PackageNamsArExtraPrice);

            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }
        public object SaveChange(EventVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Update:
                            ObjectReturn = Update(c);
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
                EnquiryId = c.FkEnquiryForm_Id,
                PackageId = c.FKPackage_Id,
                PrintNameTypeId = c.FKPrintNameType_Id,
                ClinetId = c.FKClinet_Id,
                Notes = c.Notes,
                UserCreaedId = c.FKUserCreaed_Id,
                BranchId = c.FKBranch_Id,
            }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Event == null || (this.UserLoggad.IsClinet && Event.ClinetId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Event} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Event);
        }

        private EventVM GetPureEvent(EventVM c)
        {
            if (!c.IsClinetCustomLogo.HasValue || !c.IsClinetCustomLogo.Value)
            {

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
    }//end class
}

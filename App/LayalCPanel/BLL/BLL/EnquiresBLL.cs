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
    public class EnquiresBLL : BasicBLL
    {
        NotificationsBLL NotificationsBLL = new NotificationsBLL();
        public object GetEnquires
       (int? skip, int? take, string firstName, string lastName, string phone,
            DateTime? eventDate, DateTime? createDateTimeFrom, DateTime? createDateTimeTo, int? countryId,
            int? cityId, int? enquiryId,
           int? day, int? month, int? year, int? branchId, bool? isLinkedClinet, bool isForCurrentUser = false)
        {
            bool? IsWithBranch = null;
            //اذا كان الميتخدم الحالى هوا مدير فرع فـ يجب عرض الاستفسارات التى تخصة فقط
            if (this.UserLoggad.AccountTypeId == (int)AccountTypeEnum.BranchManager)
            {
                branchId = this.UserLoggad.BranchId;
                IsWithBranch = true;
            }

            var Enquires = db.Enquires_SelectByFilter
                (skip, take, firstName, lastName, phone, day, month, year, createDateTimeFrom, createDateTimeTo,
                countryId, cityId, enquiryId, branchId, isForCurrentUser, this.UserLoggad.Id, isLinkedClinet, IsWithBranch)

                .Select(c => new EnquiyVM
                {
                    Id = c.Id,
                    FirstName = c.FirstName,
                    LastName = c.LastName,

                    PhoneNo = c.PhoneNo,
                    CreateDateTime = c.CreateDateTime,
                    Day = c.Day,
                    Month = c.Month,
                    Year = c.Year,
                    UserCreatedName = c.EnquiryCreatedUserName,
                    UserCreatedId = c.FKUserCreated_Id,
                    BranchId = c.FKBranch_Id,
                    IsClosed = c.IsClosed,
                    ClosedDateTime = c.ClosedDateTime,
                    ClendarEventId=c.ClendarEventId,
                    IsLinkedClinet=c.IsLinkedClinet,
                    IsPaymented=c.IsPaymented,
                    EventId=c.EventId,
                    IsCreatedEvent = c.IsCreatedEvent,

                    Branch = new BranchVM
                    {
                        NameAr = c.BranchNameAR,
                        NameEn = c.BranchNameEn
                    },
                    City = new CityVM
                    {
                        Id = c.FkCity_Id,
                        NameAr = c.CityNameAr,
                        NameEn = c.CityNameEn
                    },
                    Country = new CountryVM
                    {
                        Id = c.FkCountry_Id,
                        NameAr = c.CountryNameAr,
                        NameEn = c.CountryNameEn
                    },
                    EnquiryType = new EnquiryTypeVM
                    {
                        NameAr = c.EnquiryTypeNameAr,
                        NameEn = c.EnquiryTypeNameEn
                    },


                }).ToList();
            if (Enquires.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Enquires);
        }



        public object SaveChange(EnquiyVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
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
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        private object Delete(EnquiyVM c)
        {
            db.Enquires_Delete(c.Id);
            GoggelApiCalendarService.DeleteEvent(c.ClendarEventId);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Update(EnquiyVM c)
        {
            var OldBranchId = db.Enquires_SelectByPk(c.Id).First().FKBranch_Id;
            //نقوم بـ التحويل فقط فى اول مرة
            bool IsWithBranch = false;
            if (OldBranchId != c.BranchId)
                IsWithBranch = true;
            db.Enquires_Update(c.Id, c.FirstName, c.LastName, c.PhoneNo, c.Day, c.Month, c.Year, c.CountryId, c.CityId, c.EnquiryTypeId, c.Note, DateTime.Now, this.UserLoggad.Id, c.BranchId, IsWithBranch);

            if (OldBranchId != c.BranchId)
            {

                var Notify = new NotifyVM
                {
                    TitleAr = " استفسار جدبد",
                    TitleEn = "New Enquiry",
                    DescriptionAr = $"لقد قامت الآدارة تحويل استفسار جديد لك",
                    DescriptionEn = $"Manger Has been Convert New Enqiry For You",
                    DateTime = DateTime.Now,
                    TargetId = c.Id,
                    PageId = (int)PagesEnum.Enquires,
                    RedirectUrl = $"/Enquires/EnquiryInformation?id={c.Id}&notifyId=",
                };

                //ارسال اشعار لـ الفرع اذا قام المستخدم الحالى 
                var UserMangerBranch = db.Users_SelectByBranchId(c.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                if (UserMangerBranch != null)
                {
                    NotificationsBLL.Add(Notify, UserMangerBranch.Id);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserMangerBranch.Id.ToString() }, Notify);
                }
            }


            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        private object Add(EnquiyVM c)
        {
            bool IsWithBranch = false;
            //نقوم بـ التحويل فقط فى اول مرة... لان ممكن المدير قد حدد الفرع الذى سوف يذهب الية هذا الاستفسار
            if (c.BranchId.HasValue)
                IsWithBranch = true;

            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
            db.Enquires_Insert(ID, c.FirstName, c.LastName, c.PhoneNo, c.Day, c.Month, c.Year, c.CountryId, c.CityId, c.EnquiryTypeId, this.UserLoggad.Id, DateTime.Now, c.Note, c.BranchId, this.UserLoggad.IsClinet, IsWithBranch);
            c.Id = (long)ID.Value;




            //ارسال اشعار للـ الادمين اذا كان الشخص الحالى هو عميل 
            if (this.UserLoggad.IsClinet)
            {
                var Notify = new NotifyVM
                {
                    TitleAr = " استفسار جدبد",
                    TitleEn = "New Enquiry",
                    DescriptionAr = $"لقد قام العميل {this.UserLoggad.UserName}  بنشاء استفسار جديد",
                    DescriptionEn = $"{this.UserLoggad.UserName} Has been created new enqiry",
                    DateTime = DateTime.Now,
                    TargetId = c.Id,
                    PageId = (int)PagesEnum.Enquires,
                    RedirectUrl = $"/Enquires/EnquiryInformation?id={c.Id}&notifyId=",
                };
                NotificationsBLL.Add(Notify, this.AdminId);
                new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { this.AdminId.ToString() }, Notify);

            }
            else
            {
                var Notify = new NotifyVM
                {
                    TitleAr = " استفسار جدبد",
                    TitleEn = "New Enquiry",
                    DescriptionAr = $"لقد قام المدير بنشاء استفسار جديد",
                    DescriptionEn = $"Manger Has been created new enqiry",
                    DateTime = DateTime.Now,
                    TargetId = c.Id,
                    PageId = (int)PagesEnum.Enquires,
                    RedirectUrl = $"/Enquires/EnquiryInformation?id={c.Id}&notifyId=",
                };
                //ارسال اشعار لـ الفرع اذا قام المستخدم الحالى 
                var UserMangerBranch = db.Users_SelectByBranchId(c.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                if (UserMangerBranch != null)
                {

                    NotificationsBLL.Add(Notify, UserMangerBranch.Id);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserMangerBranch.Id.ToString() }, Notify);
                }
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

        public object SelectById(long id)
        {
            var Enquiy = db.Enquires_SelectByPk(id).GroupBy(c => new
            {
                c.Id,
                c.CityNameAr,
                c.CityNameEn,
                c.CountryNameAr,
                c.CountryNameEn,
                c.CreateDateTime,
                c.EnquiryTypeNameAr,
                c.EnquiryTypeNameEn,
                c.FirstName,
                c.Day,
                c.Month,
                c.Year,
                c.FkCity_Id,
                c.FkCountry_Id,
                c.FKEnquiryType_Id,
                c.FKUserCreated_Id,
                c.FKBranch_Id,
                c.LastName,
                c.PhoneNo,
                c.BranchNameAR,
                c.BranchNameEn,
                c.EnquiryCreatedUserName,
                c.ClendarEventId,
                c.IsLinkedClinet,
                c.IsPaymented,
                c.EventId,
                c.IsCreatedEvent
            })
                .Select(c => new EnquiyVM
                {
                    Id = c.Key.Id,
                    FirstName = c.Key.FirstName,
                    LastName = c.Key.LastName,

                    PhoneNo = c.Key.PhoneNo,
                    CreateDateTime = c.Key.CreateDateTime,
                    Day = c.Key.Day,
                    Month = c.Key.Month,
                    Year = c.Key.Year,
                    UserCreatedName = c.Key.EnquiryCreatedUserName,
                    UserCreatedId = c.Key.FKUserCreated_Id,
                    CountryId = c.Key.FkCountry_Id,
                    CityId = c.Key.FkCity_Id,
                    BranchId = c.Key.FKBranch_Id,
                    EnquiryTypeId = c.Key.FKEnquiryType_Id,
                    ClendarEventId=c.Key.ClendarEventId,
                    IsLinkedClinet = c.Key.IsLinkedClinet,
                    IsPaymented=c.Key.IsPaymented,
                    IsCreatedEvent = c.Key.IsCreatedEvent,
                    EventId = c.Key.EventId,

                    Branch = new BranchVM
                    {
                        NameAr = c.Key.BranchNameAR,
                        NameEn = c.Key.BranchNameEn
                    },
                    City = new CityVM
                    {
                        Id = c.Key.FkCity_Id,
                        NameAr = c.Key.CityNameAr,
                        NameEn = c.Key.CityNameEn
                    },
                    Country = new CountryVM
                    {
                        Id = c.Key.FkCountry_Id,
                        NameAr = c.Key.CountryNameAr,
                        NameEn = c.Key.CountryNameEn
                    },
                    EnquiryType = new EnquiryTypeVM
                    {
                        NameAr = c.Key.EnquiryTypeNameAr,
                        NameEn = c.Key.EnquiryTypeNameEn
                    },
                    Notes = c.Where(b => b.Notes_Id.HasValue).OrderByDescending(b => b.Id).Select(b => new NoteVM
                    {
                        Id = b.Notes_Id,
                        Notes = b.Notes_Notes,
                        CreateDateTime = b.Notes_CreateDateTime,
                        UserCreatedId = b.Notes_UserCreatedId,
                        UserCreatedName = b.Notes_CreatedUserName
                    }).ToList(),
                    Status = c.Where(b=> b.Status_Id.HasValue).OrderByDescending(b => b.Id).Select(b => new EnquiryStatusVM
                    {
                        Id = b.Status_Id,
                        Notes = b.Status_Notes,
                        DateTime = b.Status_CreateDateTime,
                        UserCreatedId = b.Status_UserCreatedId,
                        UserCreatedName = b.Status_CreatedUserName,
                        ScheduleVisitDateTime=b.Status_ScheduleVisitDateTime,
                        EnquiryType = new EnquiryTypeVM
                        {
                            NameAr = b.Status_NameAr,
                            NameEn = b.Status_NameEn,
                        }
                    }).ToList(),


                }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Enquiy == null || (this.UserLoggad.IsClinet && Enquiy.UserCreatedId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Enquiy} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Enquiy);
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

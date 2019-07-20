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
                    ClendarEventId = c.ClendarEventId,
                    IsLinkedClinet = c.IsLinkedClinet,
                    CountIsDepositPaymented = c.CountIsDepositPaymented.Value,
                    IsCreatedEvent = c.IsCreatedEvent,
                    CountryId=c.FkCountry_Id,
                    CityId=c.FkCity_Id,
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

        public object CloseEnquiry(long id)
        {
            try
            {
                //check if closed
                if (CheckIfEnquiryClosed(id))
                    return new ResponseVM(RequestTypeEnum.Success, Token.EnquiryIsClosed);

                db.Enquires_Closed(id, DateTime.Now).Select(v => new
                {
                    v.Enquiry_ClendarEventId,
                    v.Event_ClendarEventId
                }).ToList().ForEach(v =>
                {
                    GoggelApiCalendarService.DeleteEvent(v.Enquiry_ClendarEventId);
                    GoggelApiCalendarService.DeleteEvent(v.Event_ClendarEventId);
                });

                return new ResponseVM(RequestTypeEnum.Success, Token.EnquiryIsClosed);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        /// <summary>
        /// التحقق ان المسخدم الحالى هوا صاحب هذا الاستفسار
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool CheckIfMyEnquiry(long id)
        {
            var Enquiry = GetInformation(id);
            if (Enquiry == null)
                return false;

            return Enquiry.ClinetId == this.UserLoggad.Id;
        }

        public object GetFullEnquiyInformation(long id)
        {
            var Enquiry = GetInformation(id);
            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Enquiry == null || (this.UserLoggad.IsClinet && Enquiry.ClinetId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Event} : {Token.NotFound}");

            var Package = new PackageVM();
            var Event = new EventVM();

            //Fill Enquiry Payments
            var PaymentsInformations = new EnquiryPaymentsBLL().GetPaymentsInformations(id);

            //Fill Event And Package
                Event = new EventsBLL().GetEventInformation(Enquiry.Id);
                if (Event != null)
                    Package = new PackagesBLL().GetPackageInformation(Event.PackageId.Value);

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, new
            {
                Event,
                Enquiry,
                Package,
                PaymentsInformations
            });
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
        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }

        private object Update(EnquiyVM c)
        {
            //check if closed
            if (CheckIfEnquiryClosed(c.Id))
                return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);


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
                //ارسال الاشعار للفعر اذا اكان المستخدم الحالى هوا المدير
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
                var UserMangerBranch = db.Users_SelectByBranchId(c.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                if (UserMangerBranch != null)
                {

                    NotificationsBLL.Add(Notify, UserMangerBranch.Id);
                    new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserMangerBranch.Id.ToString() }, Notify);
                }
            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

        internal EnquiyVM GetInformation(long enquiryId)
        {
            return db.Enquires_SelectByPk(enquiryId)
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
                  CountryId = c.FkCountry_Id,
                  CityId = c.FkCity_Id,
                  BranchId = c.FKBranch_Id,
                  EnquiryTypeId = c.FKEnquiryType_Id,
                  ClendarEventId = c.ClendarEventId,
                  IsLinkedClinet = c.IsLinkedClinet,
                  CountIsDepositPaymented = c.CountIsDepositPaymented.Value,
                  IsCreatedEvent = c.IsCreatedEvent,
                  ClinetId = c.FkClinet_Id,
                  IsClosed=c.IsClosed,
                  ClosedDateTime=c.ClosedDateTime,

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
                  Notes = db.EnquiryNotes_SelectByEnquiryId(c.Id).Select(b => new NoteVM
                  {
                      Id = b.Id,
                      Notes = b.Notes,
                      CreateDateTime = b.CreateDateTime,
                      UserCreatedId = b.FKUserCreated_Id,
                      UserCreatedName = b.UserName
                  }).ToList(),
                  Status = db.EnquiryStatusTypes_SelectByEnquiryId(c.Id).Select(b => new EnquiryStatusVM
                  {
                      Id = b.Status_Id,
                      Notes = b.Status_Notes,
                      DateTime = b.Status_CreateDateTime,
                      UserCreatedId = b.Status_UserCreatedId,
                      UserCreatedName = b.Status_CreatedUserName,
                      ScheduleVisitDateTime = b.Status_ScheduleVisitDateTime,
                      EnquiryPaymentId = b.Status_EnquiryPaymentId,
                      Amount=b.Amount,
                      EnquiryType = new EnquiryTypeVM
                      {
                          NameAr = b.Status_NameAr,
                          NameEn = b.Status_NameEn,
                      }
                  }).ToList()

              }).FirstOrDefault();
        }

        public object SelectById(long id)
        {
            var EnquiryPayments = db.EnquiryPayments_SelectByEnquiryId(id).Select(c => new EnquiryPaymentVM
            {
                Amount = c.Amount,
                DateTime = c.DateTime,
                EnquiryId = c.FKEnquiry_Id,
                Id = c.Id,
                IsAcceptFromManger = c.IsAcceptFromManger,
                IsBankTransfer = c.IsBankTransfer,
                IsDeposit = c.IsDeposit,
                BankTransferImage = c.TransferImage,
                UserCreatedId = c.FKUserCreated_Id,
                UserCreatedName = c.UserCreatedName,
            }).ToList();

            var Enquiy = db.Enquires_SelectByPk(id)
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
                    CountryId = c.FkCountry_Id,
                    CityId = c.FkCity_Id,
                    BranchId = c.FKBranch_Id,
                    EnquiryTypeId = c.FKEnquiryType_Id,
                    ClendarEventId = c.ClendarEventId,
                    IsLinkedClinet = c.IsLinkedClinet,
                    CountIsDepositPaymented = c.CountIsDepositPaymented.Value,
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
                    Notes = db.EnquiryNotes_SelectByEnquiryId(c.Id).Select(b => new NoteVM
                    {
                        Id = b.Id,
                        Notes = b.Notes,
                        CreateDateTime = b.CreateDateTime,
                        UserCreatedId = b.FKUserCreated_Id,
                        UserCreatedName = b.UserName
                    }).ToList(),
                    Status = db.EnquiryStatusTypes_SelectByEnquiryId(c.Id).Select(b => new EnquiryStatusVM
                    {
                        Id = b.Status_Id,
                        Notes = b.Status_Notes,
                        DateTime = b.Status_CreateDateTime,
                        UserCreatedId = b.Status_UserCreatedId,
                        UserCreatedName = b.Status_CreatedUserName,
                        ScheduleVisitDateTime = b.Status_ScheduleVisitDateTime,
                        EnquiryPaymentId = b.Status_EnquiryPaymentId,
                        IsBankTransferDeposit = b.Status_EnquiryPaymentId.HasValue ? EnquiryPayments.Single(w => w.Id == b.Status_EnquiryPaymentId.Value).IsBankTransfer : false,
                        Amount = b.Status_EnquiryPaymentId.HasValue ? EnquiryPayments.Single(w => w.Id == b.Status_EnquiryPaymentId.Value).Amount : 0,
                        EnquiryType = new EnquiryTypeVM
                        {
                            NameAr = b.Status_NameAr,
                            NameEn = b.Status_NameEn,
                        }
                    }).ToList()


                }).FirstOrDefault();

            //اذا ان المستخدم الحالى عميل فيجب ان يكون هوا الذى قد انشاء تلك الاستفسار
            if (Enquiy == null || (this.UserLoggad.IsClinet && Enquiy.UserCreatedId != this.UserLoggad.Id))
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Enquiry} : {Token.NotFound}");

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

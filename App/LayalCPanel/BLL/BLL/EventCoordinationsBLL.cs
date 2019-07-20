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
    public class EventCoordinationsBLL : BasicBLL
    {

        NotificationsBLL NotificationsBLL = new NotificationsBLL();

        public object GetEventCoordinations(long eventId)
        {

            var EventCoordinations = db.EventCoordinations_SelectByEventId(eventId)
                .Select(c => new EventCoordinationVM
                {
                    Id = c.Id,
                    EndTime = c.EndTime,
                    EventId = c.FKEvent_Id,
                    Notes = c.Notes,
                    StartTime = c.StartTime,
                    Task = c.Task,
                    UserCreatedId = c.FKUserCreated_Id,
                    TaskNumber = c.TaskNumber,
                    CreatedUserName = c.UserName,

                }).ToList();
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventCoordinations);
        }


        /// <summary>
        /// التحقق ان الموظف الحالى يمكنة الوصول الى الصفحة
        /// </summary>
        /// <returns></returns>
        public bool ChakIfEmployeeAllowAccess()
        {
            if (this.UserLoggad.IsAdmin) return true;

            return db.EmployeesWorks_CheckIfInserted((int)WorksTypesEnum.Coordination, this.UserLoggad.Id).First().Value > 0;
        }

        public object SaveChange(EventCoordinationVM c)
        {
            if (!CheckAlloweAccess(c.EventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);

            if (db.EventWorksStatus_CheckIfFinshed(c.EventId).First().Value > 1)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisTaskIsFinshed);

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

        public object GetEventForCurrretnEmployee(long eventId)
        {
            if (!CheckAlloweAccess(eventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);

            return new EventsBLL().GetEventForCurrretnEmployee(eventId);
        }


        /// <summary>
        /// التحقق ان المستخدم الحالى يحق لة التغير فى الاعدادات
        /// </summary>
        /// <param name="evenId"></param>
        /// <returns></returns>
        public bool CheckAlloweAccess(long evenId)
        {
            return db.Employees_CheckAllowAccessToEventForUpdateWorks(this.UserLoggad.IsAdmin, this.UserLoggad.IsClinet, this.UserLoggad.IsEmployee, this.UserLoggad.IsBranchManager, evenId, (int)WorksTypesEnum.Coordination, this.UserLoggad.Id, this.UserLoggad.BranchId).First().Value > 0;

        }

        public object FinshedTask(long eventId)
        {
            try
            {
                db.EventWorksStatus_Insert(true, DateTime.Now, eventId, (int)WorksTypesEnum.Coordination, this.UserLoggad.Id, this.UserLoggad.AccountTypeId);


                //اذا كان الستخدم الحالى ليس هوا مدير الفرع فيجب ارسال اشعار لـ مدير الفرع
                if (!this.UserLoggad.IsBranchManager)
                {

                    var Notify = new NotifyVM
                    {
                        TitleAr = " الانتهاء من الاعداد والتنسيق",
                        TitleEn = "Coordinations Finshed",
                        DescriptionAr = $"لقد قام الموظف { this.UserLoggad.UserName } بـ انهاء مهام الاعداد والتنسيق للمناسبة ",
                        DescriptionEn = $"{ this.UserLoggad.UserName } Has been finshed coordinations for event",
                        DateTime = DateTime.Now,
                        TargetId = eventId,
                        PageId = (int)PagesEnum.Enquires,
                        RedirectUrl = $"/WorkFlow?id={eventId}&notifyId=",
                    };
                    var UserMangerBranch = db.Users_SelectByBranchId(this.UserLoggad.BranchId, (int)AccountTypeEnum.BranchManager).FirstOrDefault();
                    if (UserMangerBranch != null)
                    {
                        NotificationsBLL.Add(Notify, UserMangerBranch.Id);
                        new NotificationHub().SendNotificationToSpcifcUsers(new List<string> { UserMangerBranch.Id.ToString() }, Notify);
                    }
                }

                return new ResponseVM(RequestTypeEnum.Success, Token.Finshed);
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

        private object Delete(EventCoordinationVM c)
        {
            db.EventCoordinations_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }


        private object Add(EventCoordinationVM c)
        {
            //Get Task Number
            GetTaskNumber(c);

            db.EventCoordinations_Insert(c.TaskNumber, c.Task, c.StartTime, c.EndTime, c.Notes, c.EventId, this.UserLoggad.Id);

            return new ResponseVM(RequestTypeEnum.Success, $"{Token.AddedWithTaskumber} : {c.TaskNumber}",
                db.EventCoordinations_SelectByEventId(c.EventId)
                .Select(v => new EventCoordinationVM
                {
                    Id = v.Id,
                    EndTime = v.EndTime,
                    EventId = v.FKEvent_Id,
                    Notes = v.Notes,
                    StartTime = v.StartTime,
                    Task = v.Task,
                    UserCreatedId = v.FKUserCreated_Id,
                    TaskNumber = v.TaskNumber,
                    CreatedUserName=v.UserName,
                }).ToList());
        }

        void GetTaskNumber(EventCoordinationVM c)
        {
            int TaskNum = 1;
            db.EventCoordinations_SelectTasksNumber(c.EventId).OrderBy(v => v).Select(v => v.Value).ToList().ForEach(tn =>
            {
                if (tn == TaskNum)
                    TaskNum += 1;
            });

            c.TaskNumber = TaskNum;
        }


    }//end class
}

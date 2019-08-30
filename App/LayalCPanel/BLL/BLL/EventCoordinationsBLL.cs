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
            //التحقق من امكانية الوصول الى المناسبة
            if (!CheckAlloweAccess(c.EventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);

            //التحقق ان هذة المهمة لم تنتهى بعد
            if (!this.UserLoggad.IsBranchManager&& db.EventWorksStatusIsFinsed_CheckIfFinshed(c.EventId, (int)WorksTypesEnum.Coordination).First().Value)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisTaskIsFinshed);

            //التحقق لان المناسبة لم تغلق
            if (new EnquiresBLL(). CheckIfEnquiryClosed(c.EventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.EventIsClosed);

            //التحقق ان المناسبة لم تبداء فى حالة الاعداد والتنسيق فقط
            if ( db.Events_CheckFromDateEventIsFinshed(c.EventId, DateTime.Now).First().Value> 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisEventDateIsFinshed);


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
            return db.Employees_CheckAllowAccessToEventForUpdateWorks(
                this.UserLoggad.IsAdmin,
                this.UserLoggad.IsClinet,
                this.UserLoggad.IsBranchManager, 
                evenId,
                (int)WorksTypesEnum.Coordination,
                this.UserLoggad.Id,
                this.UserLoggad.BrId).First().Value > 0;

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

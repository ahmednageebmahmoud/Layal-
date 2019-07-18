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
                    EndTime=c.EndTime,
                    EventId=c.FKEvent_Id,
                    Notes=c.Notes,
                    StartTime=c.StartTime,
                    Task=c.Task,
                    UserCreatedId=c.FKUserCreated_Id,
                    TaskNumber=c.WorkNumber
                }).ToList();
            if (EventCoordinations.Count == 0)
            {
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventCoordinations);
        }

        /// <summary>
        /// التحقق ان الموظف الحالى يمكنة الوصول الى الصفحة
        /// </summary>
        /// <returns></returns>
        public bool ChakIfEmployeeAllowAccess(bool allowClinet)
        {
            if (this.UserLoggad.IsAdmin) return true;
            if (allowClinet && this.UserLoggad.IsClinet) return true;

            return db.EmployeesWorks_CheckIfInserted((int)WorksTypesEnum.Coordination,this.UserLoggad.Id).First().Value > 0;
        }

        public object SaveChange(EventCoordinationVM c)
        {
            if (db.Employees_CheckAllowAccessToEventByWorkTypeId(c.EventId, (int)WorksTypesEnum.Coordination, this.UserLoggad.Id).First().Value <= 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);


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
            db.EventCoordinations_Insert(c.TaskNumber,c.Task,c.StartTime,c.EndTime,c.Notes,c.EventId,this.UserLoggad.Id);

            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

    }//end class
}

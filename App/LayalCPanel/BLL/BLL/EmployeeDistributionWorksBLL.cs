using BLL.Enums;
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
    public class EmployeeDistributionWorksBLL : BasicBLL
    {
        public object GetByEventId(long eventId)
        {
            var Emps = db.EmployeeDistributionWorks_SelectByEventId(eventId).Select(c => new EmployeeDiributionWorkVM
            {
                Id = c.Id,
                EmployeeId = c.FKEmployee_Id,
                EventId = c.FKEvent_Id,
                WorkTypeId = c.FKWorkType_Id,
                IsFinshed = c.IsFinshed,
                UserName = c.UserName,
                UserAccountTypeId = c.FKAccountType_Id
            }).ToList();

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, Emps);
        }

        public object SaveChange(EmployeeDiributionWorkVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    //التحقق من انة تم الدفع
                    if (!CheckIsPayment(c.EventId))
                        return new ResponseVM(RequestTypeEnum.Error, Token.ClinetIsNotPayment);

                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = Add(c);
                            break;
                        case StateEnum.Delete:
                            ObjectReturn = Delete(c); break;
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

        /// <summary>
        /// الحقق من ان الستخد قام بـ دفع كامل المستخقات
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        private bool CheckIsPayment(long eventId)
        {
            return db.EnquiryPayments_CheckIfClinetPaymentEventPricing(eventId).First().Value;
        }

        private object Delete(EmployeeDiributionWorkVM c)
        {
            db.EmployeeDistributionWorks_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Add(EmployeeDiributionWorkVM c)
        {
            if (db.EmployeeDistributionWorks_CheckIfInserted(c.WorkTypeId, c.EmployeeId, c.EventId).First().Value > 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDuplicate);

            ObjectParameter ID = new ObjectParameter("Id", typeof(long));

            db.EmployeeDistributionWorks_Insert(ID, c.WorkTypeId, c.EmployeeId, c.EventId);
            c.Id = (long)ID.Value;
            return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
        }
    }
}

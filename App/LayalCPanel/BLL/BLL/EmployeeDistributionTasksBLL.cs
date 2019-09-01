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
    public class EmployeeDistributionTasksBLL : BasicBLL
    {
        public object GetByEventId(long eventId)
        {
            var Emps = db.EmployeeDistributionTasks_SelectByEventId(eventId).Select(c => new EmployeeDiributionTaskVM
            {
                Id = c.Id,
                EmployeeId = c.FKEmployee_Id,
                EventId = c.FKEvent_Id,
                WorkTypeId = c.FKWorkType_Id,
                IsFinshed = c.IsFinshed,
                UserName = c.UserName,
                UserAccountTypeId = c.FKAccountType_Id,
                 Branch = new BranchVM
                 {
                     NameAr = c.BranchNameAr,
                     NameEn = c.BranchNameEn,
                 }
            }).ToList();

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, Emps);
        }

        public object SaveChange(EmployeeDiributionTaskVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    //التحقق من انة تم الدفع
                    if (!CheckIsPayment(c.EventId))
                        return new ResponseVM(RequestTypeEnum.Error, Token.ClinetIsNotPayment);

                    //التحقق لان المناسبة لم تغلق
                    if (new EnquiresBLL().CheckIfEnquiryClosed(c.EventId))
                        return new ResponseVM(RequestTypeEnum.Error, Token.EventIsClosed);


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
        /// التحقق من انة تم دفع العربون
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        private bool CheckIsPayment(long eventId)
        {
            return db.EnquiryPayments_CheckIfPaymentedDeposit(eventId).First().Value;
        }

        private object Delete(EmployeeDiributionTaskVM c)
        {
            db.EmployeeDistributionTasks_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Add(EmployeeDiributionTaskVM c)
        {

            //Checck Dublicate
            if (db.EmployeeDistributionTasks_CheckIfInserted(c.WorkTypeId,  c.EventId, c.BranchId,c.IsBasicBranch).First().Value > 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDuplicate);


            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
          c=  db.EmployeeDistributionTasks_Insert(ID, c.WorkTypeId, c.EmployeeId, c.EventId,c.IsBasicBranch,c.BranchId).Select(v=> new EmployeeDiributionTaskVM
            {
                Id = v.Id,
                EmployeeId = v.FKEmployee_Id,
                EventId = v.FKEvent_Id,
                WorkTypeId = v.FKWorkType_Id,
                IsFinshed = false,
                UserName = v.UserName,
                UserAccountTypeId = v.FKAccountType_Id,
                Branch=new BranchVM
                {
                    NameAr=v.BranchNameAr,
                    NameEn=v.BranchNameEn,
                }
            }).FirstOrDefault();
            return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
        }
    }
}

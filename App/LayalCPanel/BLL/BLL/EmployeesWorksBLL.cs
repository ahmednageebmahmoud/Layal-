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
    public class EmployeesWorksBLL : BasicBLL
    {


        /// <summary>
        /// الحصول على الاعمال الخاصة بـ الموظف الحالى
        /// </summary>
        /// <returns></returns>
        public object SelectCurrentEmployeeWorks()
        {
            return db.Employees_SelectWorks(this.UserLoggad.Id).Select(c => new EmployeeWorkVM
            {
                Id = c.Id,
                WorksCount = c.WorksCount,
                WorkTypeId = c.FkWorkType_Id,
                WorkType = new WorkTypeVM
                {
                    NameAr = c.WorkNameAr,
                    NameEn = c.WorkNameEn,
                PageUrl=c.PageUrl
                }

            }).ToList();
        }


    }//end class
}

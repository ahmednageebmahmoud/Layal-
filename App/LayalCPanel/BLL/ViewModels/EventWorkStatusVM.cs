using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EventWorkStatusVM : BasicVM
    {

        public bool IsFinshed { get; set; }
        public WorksTypesEnum WorkTypeId { get; set; }
        public long UserId { get; set; }
        public DateTime DateTime { get; set; }
        public string DateTimeDisplay => DateService.GetDateTimeAr(this.DateTime);
        public string FinshedUserName { get; set; }
        public string FinshedAccountTypeNameEn { get;   set; }
        public string FinshedAccountTypeNameAr { get;   set; }
        public string FinshedAccountTypeName => this.IsEn ? this.FinshedAccountTypeNameEn : this.FinshedAccountTypeNameAr;
 
    }//           end class
}
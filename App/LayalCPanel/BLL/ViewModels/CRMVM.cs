using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class CRMVM : BasicVM
    {
        public DateTime DateTime { get;  set; }
        public string SmallDate => DateService.GetSmallDate(this.DateTime);
     //   public string DateTimeSince => DateService.GetDateTimeSince(this.DateTime);
        public string TimeDisplay=> DateService.GetTimeEn(this.DateTime);
        public string DateTimeDispaly => DateService.GetDateTimeAr(this.DateTime);
        public string IconClass { get;  set; }
        public string CircleColor { get;  set; }
       
        public long? UserCreatedId { get;  set; }
        public string UserCreatedName { get;  set; }
        public CRMTypeEum CRMType { get;  set; }
        public string DescriptionAr { get;   set; }
        public string DescriptionEn { get;   set; }
        public string Description => this.IsEn ? this.DescriptionEn : this.DescriptionAr;
    }
}

using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class NotifyVM : BasicVM
    {
        public Int64 Id{ get; set; }
        public string TitleAr { get; set; }
        public string TitleEn { get; set; }
        public string Title => this.IsEn ? this.TitleEn : this.TitleAr;
        public string DescriptionAr { get; set; }
        public string DescriptionEn { get; set; }
        public string Description => this.IsEn ? this.DescriptionEn : this.DescriptionAr;
        public DateTime DateTime { get; set; }
        public string DateTimeDisplay => DateService.GetDateTimeEn(this.DateTime);
        public string DateTimeSince => DateService.GetDateTimeSince(this.DateTime);
        public Int64? TargetId { get; set; }
        public int PageId { get; set; }
        public string RedirectUrl { get; set; }
        public string FullRedirectUrl => this.RedirectUrl + this.Id.ToString();
        public List<NotificationsUserVM> NotificationsUser { get; set; }
        public int? NotificationsCount { get; set; }

        public bool IsRead { get; set; }
    }
}

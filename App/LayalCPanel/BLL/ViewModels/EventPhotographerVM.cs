using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EventPhotographerVM : BasicVM
    {
        public long? Id { get; set; }
        public long? EventId { get; set; }
        public long UserId { get; set; }
        public string UserFullName { get; set; }
        public bool IsSelected { get; set; }
        public DateTime? DateTime { get; set; }
        public string DateTime_Display => DateService.GetDateTimeAr(this.DateTime);
    }
}

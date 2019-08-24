using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class EventArchivVM:BasicVM
    {
        public int Id { get; set; }
        public long EventId { get; set; }
        public string HardDiskNumber { get; set; }
        public string FolderName { get; set; }
        public string Notes { get; set; }
        public DateTime DateTime { get; set; }
        public string DateTime_Display => DateService.GetDateAr(this.DateTime);

        public long UserId { get;  set; }
        public List<EventArchivDetailVM> EventArchivDetails { get; set; }
    }//end class
}

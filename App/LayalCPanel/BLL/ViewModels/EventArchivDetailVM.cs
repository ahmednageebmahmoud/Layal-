using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class EventArchivDetailVM:BasicVM
    {
        public long? Id { get; set; }
        public long? EventId { get; set; }
        public int? EventArchivId { get; set; }
        public string MemoryId { get; set; }
        public string MemoryType { get; set; }
        public string PhotoStartName    { get; set; }
        public int? PhotoNumberFrom { get; set; }
        public int? PhotoNumberTo { get; set; }
        public string Notes { get; set; }
        public DateTime? DateTime { get; set; }
        public string DateTime_Display => DateService.GetDateAr(this.DateTime);

    }//end class
}

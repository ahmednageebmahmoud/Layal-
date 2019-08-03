using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class EventCoordinationVM:BasicVM
    {
        public long Id { get; set; }
        public long EventId { get; set; }
        public long UserCreatedId { get; set; }
        public int TaskNumber { get; set; }
        public string Task { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }

        public string StartTimeDisplay => DateService.GetTimeEn(StartTime);
        public string EndTimeDisplay => DateService.GetTimeEn(EndTime);

        public string Notes { get; set; }
        public string CreatedUserName { get;   set; }
        public EventWorksStatusIsFinshedVM EventWorkStatusIsFinshed { get;   set; }
    }//end class
}

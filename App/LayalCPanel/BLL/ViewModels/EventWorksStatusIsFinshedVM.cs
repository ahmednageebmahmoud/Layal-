using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
  public  class EventWorksStatusIsFinshedVM:BasicVM
    {
        public long EventId { get; set; }
        public bool? Booking { get; set; }
        public bool? DataPerfection { get; set; }
        public bool? Coordination { get; set; }
        public bool? Implementation { get; set; }
        public bool? ArchivingAndSaveing { get; set; }
        public bool? ProductProcessing { get; set; }
        public bool? Chooseing { get; set; }
        public bool? DigitalProcessing { get; set; }
        public bool? PreparingForPrinting { get; set; }
        public bool? Manufacturing { get; set; }
        public bool? QualityAndReview { get; set; }
        public bool? Packaging { get; set; }
        public bool? TransmissionAndDelivery { get; set; }
        public bool? Archiving { get; set; }


    }//End class
}

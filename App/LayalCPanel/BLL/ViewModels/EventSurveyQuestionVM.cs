using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
  public  class EventSurveyQuestionVM:BasicVM
    {

        public long Id { get; set; }
        public bool? IsDefault { get; set; }
        public bool? IsActive { get; set; }
        public int SurveyQuestionTypeId { get; set; }
        public long? EventId { get; set; }
        public string Answerer { get; set; }
        public EventSurveyQuestionTypeVM SurveyQuestion { get; set; }
        public bool IsSelected { get;   set; }
    }//End Class
}

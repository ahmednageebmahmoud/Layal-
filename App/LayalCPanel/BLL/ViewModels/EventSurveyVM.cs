using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
   public class EventSurveyVM:BasicVM
    {
        public long Id { get; set; }
        public bool IsSatisfied { get; set; }
        public long EventId { get; set; }
        public long SurveyQuestionId { get; set; }
        public List<EventSurveyQuestionVM> SurveyQuestions { get; set; } = new List<EventSurveyQuestionVM>();
        public DateTime EventDateTime { get;   set; }
        public int? CountIsSatisfied { get;   set; }
    }//end classs 
}

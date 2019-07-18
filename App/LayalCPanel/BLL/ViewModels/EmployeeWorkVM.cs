using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EmployeeWorkVM : BasicVM
    {
        public long Id { get; set; }
        public int WorkTypeId { get; set; }
        public long UserId { get; set; }
        public WorkTypeVM WorkType { get;   set; }
        public int? WorksCount { get;   set; }
    }//end class
}

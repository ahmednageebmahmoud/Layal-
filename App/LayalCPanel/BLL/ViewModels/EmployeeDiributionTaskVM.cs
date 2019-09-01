using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
public    class EmployeeDiributionTaskVM:BasicVM
    {
        public long Id { get; set; }
        public long EventId { get; set; }
        public long EmployeeId { get; set; }
        public int WorkTypeId { get; set; }
        public bool IsFinshed { get;  set; }
        public string UserName { get;   set; }
        public bool IsBasicBranch { get; set; }
        public int UserAccountTypeId { get;   set; }
        public int BranchId { get; set; }
        public BranchVM Branch { get;   set; }
    }//End Class
}

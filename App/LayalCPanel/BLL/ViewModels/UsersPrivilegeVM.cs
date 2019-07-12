using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class UsersPrivilegeVM : BasicVM
    {
        public int Id { get; set; }
        public bool CanAdd { get; set; }
        public bool CanDelete { get; set; }
        public bool CanDisplay { get; set; }
        public bool CanEdit { get; set; }
        public bool IfSelected { get; set; }
        public PageVM Page { get; set; }
        public int PageId { get; set; }
        public long UserId { get; set; }
        public bool _IfSelected => this.CanAdd || this.CanDelete || this.CanDisplay || this.CanEdit;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class PageVM:BasicVM
    {
        public int Id { get;   set; }
        public int MenuId { get;    set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public int OrderByNumber { get;   set; }
        public string PageName => this.IsEn ? this.NameEn : this.NameAr;
        public string Url { get;   set; }
    }
}

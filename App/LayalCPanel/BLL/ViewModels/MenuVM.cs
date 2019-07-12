using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class MenuVM:BasicVM
    {
        public string CssClass { get;  set; }
        public int Id { get;  set; }
        public string MenuName => this.IsEn?this.NameEn:this.NameAr;
        public int OrderByNumber { get;  set; }
        public int? ParentId { get;  set; }
        public List<PageVM> Pages { get;   set; }
        public List<MenuVM> SubMenus { get; set; }
        public string NameEn { get;   set; }
        public string NameAr { get;   set; }
    }
}

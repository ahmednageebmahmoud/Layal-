using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
public    class WorkTypeVM:BasicVM
    {
        public int Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string WorkTypeName => this.IsEn ? this.NameEn : this.NameAr;
        public bool Selected { get; set; }
        public string PageUrl { get; set; }

    }//end class
}

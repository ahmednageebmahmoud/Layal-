using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class StaticFieldVM : BasicVM
    {
        public int Id { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string StaticFieldName => this.IsEn ? this.NameEn : this.NameAr;
        public long WordId { get;   set; }
    }
}

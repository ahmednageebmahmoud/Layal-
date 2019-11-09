using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
    public class ProductTypeVM : BasicVM
    {
        public long Id { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string ProductTypeName => this.IsEn ? this.NameEn : this.NameAr;
        public long WordId { get;   set; }
        public HttpPostedFileBase Image { get; set; }
        public string ImageUrl { get; set; }
    }
}

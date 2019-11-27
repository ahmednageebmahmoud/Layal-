using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
    public class ProductImageVM : BasicVM
    {
        public long Id { get; set; }
        public string ImageUrl { get; set; }
        public HttpPostedFileBase File { get; set; }
    }//End Class
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
   public class AlbumFileVM:BasicVM
    {
        public long Id { get; set; }
        public HttpPostedFileBase File { get; set; }
        public string FileUrl { get; set; }
    }
}

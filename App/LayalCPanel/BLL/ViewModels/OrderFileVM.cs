using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
  public  class OrderFileVM:BasicVM
    {
        /// <summary>
        /// File To Uplaod
        /// </summary>

        public HttpPostedFileBase File { get; set; }
        /// <summary>
        /// True If File Upaloded
        /// </summary>

        public bool IsUplaoded { get; set; }
        /// <summary>
        /// Dropbox File Upaloded Id
        /// </summary>
        public string DropboxFileId { get; set; }
        /// <summary>
        /// Dropbox File Upaloded Path
        /// </summary>
        public string DropboxThumbnailPath { get;   set; }
    }//End CLass
}

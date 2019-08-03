using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class FilesReceivedTypeVM : BasicVM
    {
        public int? Id { get; set; }
        public string PrintNamesTypeName => this.IsEn ? this.NameEn : this.NameAr;
        public long? WordId { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }

         
    }//end class
}

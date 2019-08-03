using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class SocialAccountTypeVM : BasicVM
    {
        public int Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string SocialAccountTypeName => this.IsEn ? this.NameEn : this.NameAr;
        public long WordId { get; set; }
    }//end class
}

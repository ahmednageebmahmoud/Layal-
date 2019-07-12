using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class AccountTypeVM : BasicVM
    {

        public int Id { get; set; }
        public string AccountTypeName => this.IsEn ? this.NameEn : this.NameAr;

        public string NameAr { get; set; }
        public string NameEn { get; set; }

    }//end class
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class BranchVM : BasicVM
    {
        public int? Id { get; set; }
        public string BranchName => this.IsEn ? this.NameEn : this.NameAr;
        public long? WordId { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string PhoneNo { get;   set; }
        public string Address { get;   set; }
        public CityVM City { get;   set; }
        public CountryVM Country { get;   set; }
        public int CityId { get;   set; }
        public int CountryId { get; set; }
        
    }//end class
}

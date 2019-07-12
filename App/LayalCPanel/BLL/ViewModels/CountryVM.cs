using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class CountryVM : BasicVM
    {

        public int? Id { get; set; }
        public string CountryName => this.IsEn ? this.NameEn : this.NameAr;

        public string IsoCode { get; set; }
        public long WordId { get; set; }
        public List<CityVM> Cities { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }


    }//end class
}

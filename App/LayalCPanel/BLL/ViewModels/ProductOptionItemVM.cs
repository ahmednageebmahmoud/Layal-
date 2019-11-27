using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class ProductOptionItemVM : BasicVM
    {
        public long Id { get; set; }
        public string ValueAr { get; set; }
        public string ValueEn { get; set; }
        public string Value => this.IsEn ? this.ValueEn : this.ValueAr;
        public decimal Price { get; set; }
        public long WordValueId { get; set; }
    }//End Class
}

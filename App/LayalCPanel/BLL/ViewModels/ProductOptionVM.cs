using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class ProductOptionVM : BasicVM
    {
        public long Id { get; set; }
        public int StaticFieldId { get; set; }
        public List<ProductOptionItemVM> Items { get; set; } = new List<ProductOptionItemVM>();
        public StaticFieldVM StaticField { get; internal set; }

        public long? ProductOptionItemSelectedId { get;   set; }
        public ProductOptionItemVM ItemSelected { get; internal set; }
    }//End Class
}

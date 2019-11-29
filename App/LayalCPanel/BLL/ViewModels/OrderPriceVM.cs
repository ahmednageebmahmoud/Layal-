using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class OrderPriceVM : BasicVM
    {

        public long WordId { get; set; }
        public decimal Price { get; set; }
        public DateTime CreateDateTime { get; set; }
        public string CreateDateTime_Display => DateService.GetDateTimeAr(this.CreateDateTime);
        public string ServiceNameEn { get; set; }
        public string ServiceNameAr { get; set; }
        public string ServiceName => this.IsEn ? this.ServiceNameEn : this.ServiceNameAr;
    }//End Classs
}

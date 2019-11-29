using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
    public class OrderPaymentVM : BasicVM
    {
        public long? Id { get; set; }
        public long OrderId { get; set; }
        public decimal Amount { get; set; }
        public string TransferImageUrl { get; set; }
        public bool IsBankTransfer { get; set; }
        public bool IsAcceptFromManger { get; set; }
        public DateTime CreateDateTime { get; set; }
        public string CreateDateTime_Display => DateService.GetDateTimeAr(this.CreateDateTime);
        public HttpPostedFileBase File { get;   set; }
    }//End Class
}

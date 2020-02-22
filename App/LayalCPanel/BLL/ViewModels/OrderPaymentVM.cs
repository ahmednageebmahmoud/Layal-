using BLL.Enums;
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
        public long UsereCreatedId { get; set; }
        public decimal Amount { get; set; }
        public string TransferImageUrl { get; set; }
        public bool IsBankTransfer => this.PaymentTypeId == (int)PaymentTypeEnum.BankTransfer;
        public bool? IsAcceptFromManger { get; set; }
        public DateTime CreateDateTime { get; set; }
        public string CreateDateTime_Display => DateService.GetDateTimeAr(this.CreateDateTime);
        public HttpPostedFileBase File { get;   set; }
        public string AcceptNotes { get; set; }
        public DateTime? AcceptDateTime { get; set; }
        public string AcceptDateTime_Display => DateService.GetDateTimeAr(this.AcceptDateTime);
        public PaymentTypeVM PaymentType { get;   set; }
        public int PaymentTypeId { get;   set; }
        public decimal RecivedAmount { get;   set; }
    }//End Class
}

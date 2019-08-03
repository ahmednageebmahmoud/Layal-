using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class UserPaymentVM : BasicVM
    {
        public long Id { get; set; }
        public decimal Amount { get; set; }
        public DateTime DateTime { get; set; }
        public string DateTimeDisplay => DateService.GetDateTimeEn(DateTime );
        public bool? IsAcceptFromManger { get; set; }
        public long UserToId { get; set; }
        public long UserFromId { get; set; }
        public string UserFromName { get;   set; }
        public string Notes { get; set; }
        public string PaymentImageName { get; set; }
        public bool? IsBankTransfer { get; set; }
        public string PaymentImage { get;   set; }
        public bool IsClosed { get; set; }
    }//end cass
}

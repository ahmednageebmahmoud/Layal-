using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class EnquiryPaymentVM:BasicVM
    {
        public long Id { get; set; }
        public decimal? Amount { get; set; }
        public bool IsDeposit { get; set; }
        public bool IsBankTransfer { get; set; }
        public bool? IsAcceptFromManger { get; set; }
        public string BankTransferImage { get; set; }
        public string BankTransferImageName { get; set; }
        public string UserCreatedName { get; set; }
        public DateTime DateTime { get; set; }
        public string DateTimeDisplay => DateService.GetDateTimeAr(DateTime);
        public long EnquiryId { get; set; }
        public long UserCreatedId { get; set; }
        public int BranchId { get; set; }

    }//end lass
}

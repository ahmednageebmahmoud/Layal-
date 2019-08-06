using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EnquiryStatusVM : BasicVM
    {
        public Int64 EnquiryId { get; set; }
        public DateTime? ScheduleVisitDateTime { get; set; }
        public DateTime? DateTime { get; set; }
        public string ScheduleVisitDateTimeDisplay => DateService.GetDateTimeAr(this.ScheduleVisitDateTime);
        public string DateTimeDisplay => DateService.GetDateTimeAr(this.DateTime);
        public string Notes { get; set; }
        public EnquiryStatusTypesEnum StatusId { get; set; }
        public int EnquiryBranchId { get; set; }
        public long? UserCreatedId { get; set; }
        public string UserCreatedName { get; set; }
        public EnquiryTypeVM EnquiryType { get; set; }
        public long? Id { get; internal set; }
        public bool IsBankTransferDeposit { get; set; }
        public decimal? Amount { get; set; }
        public bool IsWithBranch { get; set; }
        public string ClinetName { get; set; }
        public string BankTransferImage { get;  set; }
        public string BankTransferImageName { get;   set; }
        public long? EnquiryPaymentId { get;   set; }
    }
}

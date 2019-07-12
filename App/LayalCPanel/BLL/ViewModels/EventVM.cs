using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EventVM : BasicVM
    {

        public long Id { get; set; }
        public bool? IsClinetCustomLogo { get; set; }
        public bool? IsLogoAr { get; set; }
        public bool? IsNamesAr { get; set; }
        public string LogoFilePath { get; set; }
        public string NameGroom { get; set; }
        public string NameBride { get; set; }
        public DateTime EventDateTime { get; set; }
        public DateTime CreateDateTime { get; set; }

        public string EventDateTimeDisplay => DateService.GetDateTimeEn(this.EventDateTime);
        public string CreateDateTimeDisplay => DateService.GetDateTimeEn(this.CreateDateTime);
        public long? EnquiryId { get; set; }
        public int? PackageId { get; set; }
        public int? PrintNameTypeId { get; set; }
        public long ClinetId { get; set; }
        public string Notes { get; set; }
        public long UserCreaedId { get; set; }
        public int? BranchId { get; set; }
        public bool? IsActive { get; set; }
        public string UserNameCreatedId { get; set; }
        public string UserNameClinetId { get; set; }
        public EnquiyVM Enquiry { get; set; }
        public bool IsCanNotUpdate { get; set; }
        public string EnquiryName { get; set; }
        public string UserCreatedUserName { get; set; }
        public string ClinetUserName { get; set; }
        public string CustomLogo { get; set; }
        public PackageVM Package { get; set; }
        public BranchVM Branch { get; set; }
        public PrintNamesTypeVM PrintNameType { get; set; }
        public string LogoFileName { get;   set; }
        public string ClendarEventId { get; set; }



        public int Skip { get; set; }
        public int Take { get; set; }






        public DateTime? EventDateTo { get; set; }
        public DateTime? EventDateFrom { get; set; }
        public DateTime? CreateDateFrom { get; set; }
        public DateTime? CreateDateTo { get; set; }
        public bool? EnquiryIsClosed { get;   set; }
    }//end class
}

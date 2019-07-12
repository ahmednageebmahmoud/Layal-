using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bll.ViewModels;
using BLL.Enums;

namespace BLL.ViewModels
{
    public class UserVM:BasicVM
    {
       

        public long Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string PhoneNo { get; set; }
        public string Address { get; set; }
        public string Password { get; set; }
        public string ActiveCode { get; set; }
        public int AccountTypeId { get; set; }
        public int? CountryId { get; set; }
        public int? CityId { get; set; }
        public int LanguageId { get; set; }
        public bool _IsRemmeberMe { get;  set; }
        public DateTime? DateOfBirth { get; set; }
        public LanguageEnum _Language { get; set; }
        public int BranchId { get; set; }
        public Int64? EnquiryId { get; set; }
        public AccountTypeVM AccountType { get; set; }
        public CountryVM Country { get; set; }
        public CityVM City { get; set; }
    }//endclass
}

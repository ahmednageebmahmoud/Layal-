using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.Enums;
using BLL.Services;

namespace BLL.ViewModels
{
    public class UserCookieVM
    {
        public long Id { get;   set; }
        public string ReturnUrl { get;   set; }
        public string Email { get; set; }

        public bool IsActiveEmail { get;   set; }
        public bool _IsRemmeberMe { get;   set; }
        public LanguageEnum _Language { get;   set; }
        public int AccountTypeId { get;   set; }
        public bool IsClinet => this.AccountTypeId == (int)AccountTypeEnum.Clinet;
        public bool IsAdmin => this.Id ==WebConfigService.AdminId;
        public bool IsEmployee=> this.AccountTypeId==(int)AccountTypeEnum.Employee;
        public bool IsBranchManager => this.AccountTypeId == (int)AccountTypeEnum.BranchManager;
        public bool IsHelper => this.AccountTypeId == (int)AccountTypeEnum.Helper;
        public bool IsAnonymous { get; set; }
        public string UserName { get;   set; }
        public int BrId { get; set; }
        public bool IsActive { get;   set; }
        public int? CountryId { get;   set; }
        public int? CityId { get;   set; }
    }
}

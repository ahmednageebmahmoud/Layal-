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
        public bool IsBasicBranch { get; set; }
        public bool IsActiveEmail { get;   set; }
        public bool _IsRemmeberMe { get;   set; }
        public LanguageEnum _Language { get;   set; }
        public AccountTypeEnum AccountTypeId { get;   set; }
        public bool IsClinet => this.AccountTypeId ==AccountTypeEnum.Clinet;
        public bool IsAdmin => this.Id ==WebConfigService.AdminId;
        public bool IsEmployee=> this.AccountTypeId==AccountTypeEnum.Employee;
        public bool IsBranchManager => this.AccountTypeId == AccountTypeEnum.BranchManager;
        public bool IsHelper => this.AccountTypeId == AccountTypeEnum.Helper;
        public bool IsAnonymous { get; set; }
        public string UserName { get;   set; }
        public int BrId { get; set; }
        public bool IsActive { get;   set; }
        public bool IsPhotographerOrHelper =>
           CookieService.UserInfo.AccountTypeId == AccountTypeEnum.Photographer || CookieService.UserInfo.AccountTypeId == AccountTypeEnum.Helper;

        //  public int? CountryId { get;   set; }
        //    public int? CityId { get;   set; }
    }
}

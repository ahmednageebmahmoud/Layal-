using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class LoginBLL : BasicBLL
    {

        public object Login(string userName, string password, bool isRemmber)
        {
            UserCookieVM User = db.Users_SelectByUserNameAndPassword(userName, password).Select(c => new UserCookieVM
            {
                Id = c.Id,
                UserName = c.UserName,
                AccountTypeId = c.FKAccountType_Id,
                _Language = (LanguageEnum)c.FKLanguage_Id,
                _IsRemmeberMe = isRemmber,
                BranchId = c.FKPranch_Id.HasValue ? c.FKPranch_Id.Value : 0,
                IsActiveEmail = c.IsActiveEmail,
                Email = c.Email
            }).FirstOrDefault();

            if (User == null)
                return new ResponseVM(Enums.RequestTypeEnum.Error, Token.InvalidUserNameOrPassword);

            //Set User In Cookie
            CookieService.SetUserInCookie(User);

            if (!User.IsActiveEmail && User.AccountTypeId == (int)AccountTypeEnum.Clinet)
                User.ReturnUrl = $"/Users/ActiveEmail?id={User.Id}&email={User.Email}&userName={User.UserName}";
            User.Id = 0;
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, User);
        }

    }//end class
}

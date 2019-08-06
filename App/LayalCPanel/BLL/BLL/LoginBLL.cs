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
                BrId = c.FKPranch_Id.HasValue ? c.FKPranch_Id.Value : 0,
                IsActiveEmail = c.IsActiveEmail,
                Email = c.Email,
                IsActive = c.IsActive,
                CountryId=c.FkCountry_Id,
                CityId=c.FkCity_Id
            }).FirstOrDefault();

            if (User == null)
                return new ResponseVM(Enums.RequestTypeEnum.Error, Token.InvalidUserNameOrPassword);

            if (!User.IsActive)
                return new ResponseVM(Enums.RequestTypeEnum.Error, Token.YourAccountIsNotActive);


            //Set User In Cookie
            CookieService.SetUserInCookie(User);

            if (!User.IsActiveEmail && User.AccountTypeId == (int)AccountTypeEnum.Clinet)
                User.ReturnUrl = $"/Users/ActiveEmail?id={User.Id}&email={User.Email}&userName={User.UserName}";

            //اذا كان احد الحسابات التالية ولم يقوم لـ اضافة معلومات حسابة بشكل كامل فيجب توجية الى صفحة تعديل الحساب
            if(User.Id!=this.AdminId)
            if (db.Users_CheckCompeleteAccountInformation(User.Id, User.AccountTypeId).First().Value == 1)
                User.ReturnUrl = $"/Users/ProfileUpdate";


            User.Id = 0;
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, User);
        }

    }//end class
}

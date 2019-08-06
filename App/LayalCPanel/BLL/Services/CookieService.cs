using BLL.Enums;
using BLL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;

namespace BLL.Services
{
    public class CookieService
    {
        public static UserCookieVM UserInfo => GetUser();
        static UserCookieVM GetUser()
        {
            if(HttpContext.Current!=null)
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                HttpCookie UserCook = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

                if (UserCook == null)
                    return new UserCookieVM() {
                        _Language=LanguageEnum.Arabic
                    };

                FormsAuthenticationTicket Ticek = FormsAuthentication.Decrypt(UserCook.Value);
                JavaScriptSerializer js = new JavaScriptSerializer();
                return js.Deserialize<UserCookieVM>(Ticek.UserData);
            }

            return new UserCookieVM() { IsAnonymous=true };
        }


        public static void SetUserInCookie(UserCookieVM user)
        {
            HttpContext.Current.Request.Cookies.Remove(FormsAuthentication.FormsCookieName);

            JavaScriptSerializer js = new JavaScriptSerializer();
            string userObjectSerialize = js.Serialize(user);
            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, user.UserName, DateTime.Now, DateTime.Now.AddMonths(4), user._IsRemmeberMe, userObjectSerialize);
            string authTicketEncrypt = FormsAuthentication.Encrypt(authTicket);
            var Cook = new HttpCookie(FormsAuthentication.FormsCookieName, authTicketEncrypt);
            HttpContext.Current.Response.Cookies.Add(Cook);
        }

    }
}

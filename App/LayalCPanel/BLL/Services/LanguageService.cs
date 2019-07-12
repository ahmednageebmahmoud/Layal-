using BLL.Enums;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace BLL.Services
{
    public class LanguageService
    {
        public static string DefaultLang => "ar";

        public static bool IsEn => IsEnglish();

        public static void SetCulture()
        {
            var CurrentCulture = new CultureInfo(DefaultLang);
            if (HttpContext.Current.User.Identity.IsAuthenticated)
                CurrentCulture = new CultureInfo(CookieService.UserInfo._Language==LanguageEnum.English?"en":"ar");

            Thread.CurrentThread.CurrentCulture = CurrentCulture;
            Thread.CurrentThread.CurrentUICulture = CurrentCulture;
        }

        public static bool IsEnglish()
        {
            return
            Thread.CurrentThread.CurrentCulture.Name == "en";
        }

        



    }//end class
}

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading.Tasks;

namespace Resources.Services
{
 public   class TokenService
    {
        private static string GetTokenAr(string tokenName)
        {
            ResourceManager Rm = new ResourceManager("Resources.Token", Assembly.GetExecutingAssembly());
            return Rm.GetString(tokenName, new CultureInfo("ar"));
        }
        private static string GetTokenEn(string tokenName)
        {
            ResourceManager Rm = new ResourceManager("Resources.Token", Assembly.GetExecutingAssembly());
            return Rm.GetString(tokenName, new CultureInfo("en"));
        }
       

        public static string GetToken(string tokenName, bool iaEnglish)
        {
            if (iaEnglish)
                return GetTokenEn(tokenName);
            else
                return GetTokenAr(tokenName);
        }

    }
}

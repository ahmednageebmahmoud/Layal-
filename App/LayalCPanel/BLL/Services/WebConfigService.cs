using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace BLL.Services
{
 public   class WebConfigService
    {
        public static int AdminId => Convert.ToInt32(GetValue("AdminId")); 

        public static string Email => GetValue("Email");
        public static string Password => GetValue("Password");
        public static string     Smtp => GetValue("Smtp");

        internal static string GetValue(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
    }
}

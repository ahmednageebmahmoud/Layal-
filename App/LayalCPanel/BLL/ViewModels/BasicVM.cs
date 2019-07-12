using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class BasicVM
    {
        public UserCookieVM UserLoggad => CookieService.UserInfo;
        public StateEnum State { get; set; }
        public bool IsEn
        {
            get
            {
                return LanguageService.IsEn;
            }
        }



    }
}

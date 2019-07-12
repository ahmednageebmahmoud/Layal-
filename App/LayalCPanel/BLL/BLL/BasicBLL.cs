using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.Services;
using DAL;
using BLL.ViewModels;

namespace BLL.BLL
{
    public class BasicBLL
    {
        public LayanEntities db;
        public List<string> RemoveFiles_API = new List<string>();
        public List<string> RemoveFiles = new List<string>();
        public UserCookieVM UserLoggad => CookieService.UserInfo;
        public long AdminId => WebConfigService.AdminId;

        public bool IsEn
        {
            get
            {
                return LanguageService.IsEn;
            }
        }


        public BasicBLL()
        {
            this.db = new LayanEntities();
        }

    }// end class
}

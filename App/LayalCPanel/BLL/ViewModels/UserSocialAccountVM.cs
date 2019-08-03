using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class UserSocialAccountVM:BasicVM
    {
        public long Id { get; set; }
        public int AccountTypeId { get; set; }
        public string Link { get; set; }
        public SocialAccountTypeVM SocialAccountType { get;   set; }
    }//end class
}

using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LayalCPanel.Models
{
    //صفح او اكشن مخصصة لـ الادمين فقط
    public class PageForUserTypeAttribute: ActionFilterAttribute
    {
        public AccountTypeEnum AccountType { get; set; }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if(CookieService.UserInfo.AccountTypeId==AccountType)
                filterContext.Result = new HttpNotFoundResult();
    }

        public PageForUserTypeAttribute(AccountTypeEnum a)
        {
            this.AccountType = a;
        }

    }//End Class
}
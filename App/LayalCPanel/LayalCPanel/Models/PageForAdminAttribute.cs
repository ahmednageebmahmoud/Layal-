using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LayalCPanel.Models
{
    //صفح او اكشن مخصصة لـ الادمين فقط
    public class PageForAdminAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            if(CookieService.UserInfo.Id!=WebConfigService.AdminId)
                filterContext.Result = new HttpNotFoundResult();

    }
    }
}
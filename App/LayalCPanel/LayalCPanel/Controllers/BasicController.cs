using BLL.BLL;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UI.Controllers
{
    public class BasicController : Controller
    {
   public     FillItemsBLL FillItems = new FillItemsBLL();
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            LanguageService.SetCulture();
        }
    }//end clsass
}
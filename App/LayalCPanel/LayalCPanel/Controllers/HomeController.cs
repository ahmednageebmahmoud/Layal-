using BLL.BLL;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UI.Controllers
{
    [Authorize]
    public class HomeController : BasicController
    {

        public ActionResult Index()
        {

            return View();
        }

        public ActionResult GetMenus()
        {
            return Json(FillItems.GetMenusWithPages(),JsonRequestBehavior.AllowGet);
        }


        public JsonResult ChangeLanguage(int langId)
        {
            return Json(new UsersBLL().ChangeLanguage(langId), JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetNotifications( int take)
        {
            return Json(new NotificationsBLL().GetNotifications(0,take,null,false), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadNotification(Int64 notifyId)
        {
            return Json(new NotificationsBLL().ReadNotification(notifyId), JsonRequestBehavior.AllowGet);
        }
        

    }//end class 
}
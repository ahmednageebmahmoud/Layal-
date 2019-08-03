using BLL.BLL;
using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using Resources;
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
            return Json(FillItems.GetMenusWithPages(), JsonRequestBehavior.AllowGet);
        }


        public JsonResult ChangeLanguage(int langId)
        {
            return Json(new UsersBLL().ChangeLanguage(langId), JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetNotifications(int take)
        {
            return Json(new NotificationsBLL().GetNotifications(0, take, null, false), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ReadNotification(Int64 notifyId)
        {
            return Json(new NotificationsBLL().ReadNotification(notifyId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEmployeeItems()
        {
            EmployeesWorksBLL EmployeesWorksBLL = new EmployeesWorksBLL();

            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                EmployeeWorks = EmployeesWorksBLL.SelectCurrentEmployeeWorks()
            }), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAdminItems()
        {

            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                EventSurveiesChart = FillItems.GetEventSurveiesChart(DateTime.Now.Year)
            }), JsonRequestBehavior.AllowGet);
        }

        

    }//end class 
}
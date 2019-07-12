using BLL.BLL;
using BLL.Enums;
using BLL.ViewModels;
using Resources;
using UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL.Services;

namespace UI.Controllers
{
    [Authorize]
    public class NotificationsController : BasicController
    {
        NotificationsBLL NotificationsBLL = new NotificationsBLL();

        public ActionResult Index()
        {
            return View();
        }
   
        public JsonResult GetNotifications(int skip, int take,int? pageId , bool?iIsRead)
        {
            return Json(NotificationsBLL.GetNotifications(skip, take, pageId, iIsRead), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success,Token.Success,new 
            {
                Pages=FillItems.GetUserPages(CookieService.UserInfo.Id)
                
            }), JsonRequestBehavior.AllowGet);
        }
        
    }//end class
}
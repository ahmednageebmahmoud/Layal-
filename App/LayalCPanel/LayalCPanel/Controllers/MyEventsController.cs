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

namespace UI.Controllers
{
    [Authorize]
    [PagePrivilege(true)]
    public class MyEventsController : BasicController
    {
        MyEventsBLL EventsBLL = new MyEventsBLL();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EventInformation()
        {
            return View();
        }

        public ActionResult GetEventInformation(long id)
        {
            return Json(EventsBLL.SelectInformation(id), JsonRequestBehavior.AllowGet);
        }




        [HttpPost]
        public JsonResult SaveChange(EventVM enquiryType)
        {
            return Json(EventsBLL.SaveChange(enquiryType), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Packages = FillItems.GetPackages(),
                PrintNameTypes = FillItems.GetPrintNameTypes(),

            }), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEvent(long id)
        {
            return Json(EventsBLL.SelectById(id), JsonRequestBehavior.AllowGet);
        }

     
    }//end class
}
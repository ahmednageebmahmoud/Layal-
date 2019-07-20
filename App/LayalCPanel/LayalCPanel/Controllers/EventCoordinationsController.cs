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
    public class EventCoordinationsController : BasicController
    {
        EventCoordinationsBLL EventCoordinationsBLL = new EventCoordinationsBLL();
        EventsBLL EventsBLL = new EventsBLL();
        public ActionResult Index()
        {
            if (!EventCoordinationsBLL.ChakIfEmployeeAllowAccess())
                return HttpNotFound();
            return View();
        }

        public ActionResult AddAndUpdate(long id)
        {
            if (!EventCoordinationsBLL.CheckAlloweAccess(id))
                return HttpNotFound();
            return View();
        }
        
        public ActionResult EventCoordinationsInformation()
        {
            return View();
        }

        public ActionResult GetItems(bool? isForFilter)
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Packages = FillItems.GetPackages(),
                PrintNameTypes = FillItems.GetPrintNameTypes(),
                Branches= isForFilter.HasValue&&isForFilter.Value?FillItems.GetBranches():null

            }), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDistributionOfWorkItems(int branchId)
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
              Employees= FillItems.UsersWithCurrentBranchWithWorkTypes(branchId,AccountTypeEnum.Employee),

            }), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEventCoordinations(EventCoordinationVM even)
        {
            return Json(EventCoordinationsBLL.GetEventCoordinations(even.Id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEvents(EventVM even)
        {
            return Json(EventsBLL.GetEventsForCurrretnEmployee(even,WorksTypesEnum.Coordination), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetEvent(long eventId)
        {
            return Json(EventCoordinationsBLL.GetEventForCurrretnEmployee(eventId), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetTaks(long eventId)
        {
            return Json(EventCoordinationsBLL.GetEventCoordinations(eventId), JsonRequestBehavior.AllowGet);
        }
        public ActionResult FinshedTask(long eventId)
        {
            return Json(EventCoordinationsBLL.FinshedTask(eventId), JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        public JsonResult SaveChange(EventCoordinationVM enquiryType)
        {
            return Json(EventCoordinationsBLL.SaveChange(enquiryType), JsonRequestBehavior.AllowGet);
        }

    }//end class
}
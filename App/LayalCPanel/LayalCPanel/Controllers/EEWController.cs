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
    ///Event Employee Works
    public class EEWController : BasicController
    {
        EEWBLL EEWBLL = new EEWBLL();
        //Coordinations
        public ActionResult Coordinations()
        {
            if (!EEWBLL.ChakIfEmployeeAllowAccess(WorksTypesEnum.Coordination))
                return HttpNotFound();
            return View();
        }
        //CoordinationsAddAndUpdates
        public ActionResult AddAndUpdateCoordinations(long id)
        {
            if (!EEWBLL.CheckAlloweAccess(id, WorksTypesEnum.Coordination))
            return HttpNotFound();
            return View();
        }

        //Implementations
        public ActionResult Implementations()
        {
            if (!EEWBLL.ChakIfEmployeeAllowAccess(WorksTypesEnum.Implementation))
                return HttpNotFound();
            return View();
        }
        
        public ActionResult GetItems(bool? isForFilter)
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Packages = FillItems.GetPackages(),
                PrintNameTypes = FillItems.GetPrintNameTypes(),
            }), JsonRequestBehavior.AllowGet);
        }

    

        public ActionResult GetEventCoordinations(EventCoordinationVM even)
        {
            return Json(EEWBLL.GetEventCoordinations(even.Id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEvents(EventVM even,int workTypeId)
        {
            return Json(new EventsBLL().GetEventsForCurrretnEmployee(even, workTypeId), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetEvent(long eventId,WorksTypesEnum workTypeId)
        {
            return Json(EEWBLL.GetEventForCurrretnEmployee(eventId, workTypeId), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetTaks(long eventId)
        {
            return Json(new EventCoordinationsBLL().GetEventCoordinations(eventId), JsonRequestBehavior.AllowGet);
        }
       
        [HttpPost]
        public JsonResult saveChangeCoordination(EventCoordinationVM enquiryType)
        {
            return Json(new EventCoordinationsBLL().SaveChange(enquiryType), JsonRequestBehavior.AllowGet);
        }
        public ActionResult TaskFinsh(long eventId,WorksTypesEnum workTypeId)
        {
            return Json(EEWBLL.TaskFinsh(eventId, workTypeId), JsonRequestBehavior.AllowGet);
        }
    }//end class
}
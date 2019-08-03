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
    public class EventSurveyQuestionTypesController : BasicController
    {
        EventSurveyQuestionTypesBLL EventSurveyQuestionTypesBLL = new EventSurveyQuestionTypesBLL();
      
        [PagePrivilege(PagesEnum.EventSurveyQuestionTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.EventSurveyQuestionTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetEventSurveyQuestionTypes(int? skip, int? take)
        {
            return Json(EventSurveyQuestionTypesBLL.GetEventSurveyQuestionTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(EventSurveyQuestionTypeVM c)
        {
            return Json(EventSurveyQuestionTypesBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
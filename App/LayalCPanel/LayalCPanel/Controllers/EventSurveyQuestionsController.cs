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
    public class EventSurveyQuestionsController : BasicController
    {
        EventSurveyQuestionsBLL EventSurveyQuestionsBLL = new EventSurveyQuestionsBLL();

        [PagePrivilege(PagesEnum.EventSurveyQuestions, true, true, true, true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.EventSurveyQuestions, false, false, true, true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        public ActionResult Survey(long eventId)
        {
            //check allow access
            if (!CookieService.UserInfo.IsAdmin&& !EventSurveyQuestionsBLL.CheckAllowAccessToEventSurvey(eventId))
                return HttpNotFound();

            return View();
        }

        

        public ActionResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                EventSurveyQuestionTypes= FillItems.GetEventSurveyQuestionTypes()

            }), JsonRequestBehavior.AllowGet);
        }

          public ActionResult GetEvent(long eventId)
        {
            return Json(new EventsBLL().GetEventForCurrretnEmployee(eventId), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEventSurvey(long id)
        {
            return Json(EventSurveyQuestionsBLL.GetEventSurvey(id), JsonRequestBehavior.AllowGet);
        }

        
        public JsonResult GetDefaultQuestions()
        {
            return Json(EventSurveyQuestionsBLL.GetDefaultQuestions(), JsonRequestBehavior.AllowGet);
        }





        [HttpPost]
        public JsonResult SaveChange(EventSurveyQuestionVM c)
        {
            return Json(EventSurveyQuestionsBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult SaveChangeEventSurveyAnswerer(EventSurveyVM eventSure)
        {
            return Json(EventSurveyQuestionsBLL.SaveChangeSurveyAnswerer(eventSure), JsonRequestBehavior.AllowGet);
        }

        



    }//end class
}
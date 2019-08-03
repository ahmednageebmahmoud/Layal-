using BLL.BLL;
using BLL.Enums;
using BLL.ViewModels;
using LayalCPanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UI.Models;

namespace UI.Controllers
{
    public class UserPaymentsController : BasicController
    {
        UserPaymentsBLL UserPaymentsBLL = new UserPaymentsBLL();

        // GET: UserPayments
        public ActionResult Index()
        {
            return View();
        }

        [PagePrivilege(PagesEnum.UserPayments, true, false, true, true)]

        public ActionResult Payments()
        {
            return View();
        }

        public ActionResult MyPayments()
        {
            return View();
        }



        public JsonResult GetUserPayments(long? userToId, int skip, int take)
        {
            return Json(UserPaymentsBLL.GetPayments(userToId, skip, take), JsonRequestBehavior.AllowGet);
        }


     
        [HttpPost]
        public ActionResult SaveChange(UserPaymentVM c)
        {
            return Json(UserPaymentsBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }
        

    }//end clsaa
}
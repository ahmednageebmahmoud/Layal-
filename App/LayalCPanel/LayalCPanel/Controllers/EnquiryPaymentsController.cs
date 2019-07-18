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
    public class EnquiryPaymentsController : BasicController
    {
        EnquiryPaymentsBLL EnquiryPaymentsBLL = new EnquiryPaymentsBLL();

        // GET: EnquiryPayments
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Payments()
        {
            return View();
        }


        public ActionResult GetPaymentsInformations(int enquiryId)
        {
            return Json(EnquiryPaymentsBLL.GetPaymentsByEnqiryId(enquiryId), JsonRequestBehavior.AllowGet);
        }
        [PageForAdmin()]
        [HttpPost]
        public ActionResult AcceptFromManger(EnquiryPaymentVM c)
        {
            return Json(EnquiryPaymentsBLL.AcceptFromManger(c), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveChange(EnquiryPaymentVM c)
        {
            return Json(EnquiryPaymentsBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }
        

    }//end clsaa
}
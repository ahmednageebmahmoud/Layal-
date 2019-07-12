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
    public class EnquiryTypesController : BasicController
    {
        EnquiryTypesBLL EnquiryTypesBLL = new EnquiryTypesBLL();
        CitiesBLL CitiesBLL = new CitiesBLL();

        [PagePrivilege(PagesEnum.EnquiryTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.EnquiryTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetEnquiryTypes(int? skip, int? take)
        {
            return Json(EnquiryTypesBLL.GetEnquiryTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(EnquiryTypeVM enquiryType)
        {
            return Json(EnquiryTypesBLL.SaveChange(enquiryType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
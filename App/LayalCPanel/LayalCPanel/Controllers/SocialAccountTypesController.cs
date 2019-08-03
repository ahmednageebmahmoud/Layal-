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
    public class SocialAccountTypesController : BasicController
    {
        SocialAccountTypesBLL SocialAccountTypesBLL = new SocialAccountTypesBLL();
      
        [PagePrivilege(PagesEnum.SocialAccountTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.SocialAccountTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetSocialAccountTypes(int? skip, int? take)
        {
            return Json(SocialAccountTypesBLL.GetSocialAccountTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(SocialAccountTypeVM socialAccountType)
        {
            return Json(SocialAccountTypesBLL.SaveChange(socialAccountType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
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
    public class PackageInputTypesController : BasicController
    {
        PackageInputTypesBLL PackageInputTypesBLL = new PackageInputTypesBLL();
      
        [PagePrivilege(PagesEnum.PackageInputTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.PackageInputTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetPackageInputTypes(int? skip, int? take)
        {
            return Json(PackageInputTypesBLL.GetPackageInputTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(PackageInputTypeVM packageInputType)
        {
            return Json(PackageInputTypesBLL.SaveChange(packageInputType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
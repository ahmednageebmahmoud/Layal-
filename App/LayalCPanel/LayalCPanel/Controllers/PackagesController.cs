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
    public class PackagesController : BasicController
    {
        PackagesBLL PackageBLL = new PackagesBLL();
        PackageDetailesBLL PackageDetailesBLL = new PackageDetailesBLL();
         
        [PagePrivilege(PagesEnum.Packages, true, false)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.Packages, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        public ActionResult PackageInformtion()
        {
            return View();
        }
        

        public ActionResult GetPackageById(int packageId)
        {
            return Json(PackageBLL.SelectById(packageId), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                AlbumsTypes = FillItems.GetAlbumsTypes(),
                PackageInputTypes=FillItems.GetStaticFields()
            }), JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetPackages(int? skip, int? take)
        {
            return Json(PackageBLL.GetPackages(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(PackageVM c)
        {
            return Json(PackageBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SaveChangePackageDeail(PackageDetailVM c)
        {
            return Json(PackageDetailesBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }

        
    }//end class
}
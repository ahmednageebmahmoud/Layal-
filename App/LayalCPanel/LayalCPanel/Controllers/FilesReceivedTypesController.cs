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
    public class FilesReceivedTypesController : BasicController
    {
        FilesReceivedTypesBLL FilesReceivedTypesBLL = new FilesReceivedTypesBLL();
      
        [PagePrivilege(PagesEnum.FilesReceivedTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.FilesReceivedTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetFilesReceivedTypes(int? skip, int? take)
        {
            return Json(FilesReceivedTypesBLL.GetFilesReceivedTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(FilesReceivedTypeVM printNamesType)
        {
            return Json(FilesReceivedTypesBLL.SaveChange(printNamesType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
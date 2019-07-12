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
    public class PrintNamesTypesController : BasicController
    {
        PrintNamesTypesBLL PrintNamesTypesBLL = new PrintNamesTypesBLL();
      
        [PagePrivilege(PagesEnum.PrintNamesTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.PrintNamesTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetPrintNamesTypes(int? skip, int? take)
        {
            return Json(PrintNamesTypesBLL.GetPrintNamesTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(PrintNamesTypeVM printNamesType)
        {
            return Json(PrintNamesTypesBLL.SaveChange(printNamesType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
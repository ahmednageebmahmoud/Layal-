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
    public class StaticFieldsController : BasicController
    {
        StaticFieldsBLL StaticFieldsBLL = new StaticFieldsBLL();
      
        [PagePrivilege(PagesEnum.StaticFields, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.StaticFields, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetStaticFields(int? skip, int? take)
        {
            return Json(StaticFieldsBLL.GetStaticFields(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(StaticFieldVM staticField)
        {
            return Json(StaticFieldsBLL.SaveChange(staticField), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
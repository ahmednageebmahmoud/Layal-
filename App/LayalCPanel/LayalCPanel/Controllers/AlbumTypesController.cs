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
    public class AlbumTypesController : BasicController
    {
        AlbumTypesBLL AlbumTypesBLL = new AlbumTypesBLL();
      
        [PagePrivilege(PagesEnum.AlbumTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.AlbumTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetAlbumTypes(int? skip, int? take)
        {
            return Json(AlbumTypesBLL.GetAlbumTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(AlbumTypeVM albumType)
        {
            return Json(AlbumTypesBLL.SaveChange(albumType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
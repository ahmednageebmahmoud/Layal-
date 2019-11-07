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
    public class AlbumsController : BasicController
    {
        AlbumsBLL AlbumTypesBLL = new AlbumsBLL();
      
        [PagePrivilege(PagesEnum.Albums, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.Albums, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetAlbums(int? skip, int? take)
        {
            return Json(AlbumTypesBLL.GetAlbums(skip, take), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAlbumById(int id)
        {
            return Json(AlbumTypesBLL.GetAlbumById(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(AlbumVM album)
        {
            return Json(AlbumTypesBLL.SaveChange(album), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
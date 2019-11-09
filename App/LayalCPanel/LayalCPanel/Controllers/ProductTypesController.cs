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
    public class ProductTypesController : BasicController
    {
        ProductTypesBLL ProductTypeTypesBLL = new ProductTypesBLL();
      
        [PagePrivilege(PagesEnum.ProductTypes, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.ProductTypes, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }
        
        public JsonResult GetProductTypes(int? skip, int? take)
        {
            return Json(ProductTypeTypesBLL.GetProductTypes(skip, take), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductTypeById(int id)
        {
            return Json(ProductTypeTypesBLL.GetProductTypeById(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(ProductTypeVM productType)
        {
            return Json(ProductTypeTypesBLL.SaveChange(productType), JsonRequestBehavior.AllowGet);
        }



    }//end class
}
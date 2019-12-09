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
    public class ProductsController : BasicController
    {
        ProductsBLL ProductTypesBLL = new ProductsBLL();
      
        [PagePrivilege(PagesEnum.Products, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }

        [PagePrivilege(PagesEnum.Products, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        public JsonResult GetProducts(int? skip, int? take)
        {
            return Json(ProductTypesBLL.GetProducts(skip, take), JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetProductById(long id)
        {
            return Json(ProductTypesBLL.GetProductById(id), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetItems()
        {
            return Json(ResponseVM.Success(new {
                StaticFields = FillItems.GetStaticFields(),
                ProductTypes = FillItems.GetProductTypes(),
        }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(ProductVM product)
        {
            return Json(ProductTypesBLL.SaveChange(product), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        [PagePrivilege(PagesEnum.Products, false, false, false, true)]
        public JsonResult ProductDisactive(long id,bool isActive)
        {
            return Json(ProductTypesBLL.ProductDisactive(id, isActive), JsonRequestBehavior.AllowGet);
        }
        

    }//end class
}
using BLL.BLL;
using BLL.Enums;
using BLL.ViewModels;
using LayalCPanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UI.Controllers;

namespace LayalCPanel.Controllers
{
    [Authorize]
    public class OrdersphotographersController : BasicController
    {
        OrdersphotographerBll Bll = new OrdersphotographerBll();

        // GET: Orders Photographers
        public ActionResult Index()
        {
            return View();
        }

        //Create Request By Photographer
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public ActionResult Create()
        {
            return View();
        }

        //Create Request By Photographer
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public ActionResult Update(long id)
        {

            return View();
        }
        
        //Photographer Orders
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public ActionResult MyOrders()
        {
            return View();
        }

        //Get Photographer Orders
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public ActionResult GetMyOrders(int skip,int take)
        {
            return Json(Bll.GetPhotographerOrders(skip,take), JsonRequestBehavior.AllowGet);
        }

        

        public JsonResult GetItems()
        {
            return Json(ResponseVM.Success(new {
                ProductTypes=FillItems.GetProductTypes(),
                Countries = FillItems.GetCountries()
            }), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCities(int countryId)
        {
            return Json(ResponseVM.Success(new
            {
                Cities = FillItems.GetCities(countryId)
            }), JsonRequestBehavior.AllowGet);
        }
        
        public JsonResult GetProductsByProductTypeId(int productTypeId)
        {
            return Json(ResponseVM.Success(new
            {
                Products = FillItems.GetProductsByProductTypeId(productTypeId)
            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductDetails(int productId)
        {
            ProductsBLL Pro = new ProductsBLL();
            return Json(Pro.GetProductById(productId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(OrderphotographerVM order)
        {
            return Json(Bll.Add(order), JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public JsonResult GetOrderById(long id)
        {
            return Json(Bll.GetOrdeById(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
        public JsonResult AddPaymentByClinet(OrderPaymentVM o)
        {
            return Json(new OrdersphotographerPaymentsBll().AddPaymentByClinet(o), JsonRequestBehavior.AllowGet);
        }
        

    }//End Class
}
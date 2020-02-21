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
    /// <summary>
    /// For Photographer Only
    /// </summary>
    [Authorize]
        [PageForUserTypeAttribute(AccountTypeEnum.Photographer)]
    public class PhotoOrdersController : BasicController
    {
        OrdersBll Bll = new OrdersBll();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult Update(long id)
        {
            return View();
        }

        public ActionResult Details(long id)
        {
            return View();
        }
        
        public ActionResult MyOrders()
        {
            return View();
        }

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
                Products = FillItems.GetProductsByProductTypeId(productTypeId,null)
            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductDetails(int productId)
        {
            ProductsBLL Pro = new ProductsBLL();
            return Json(Pro.GetProductById(productId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(OrderVM order)
        {
            return Json(Bll.SaveChange(order), JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult GetOrderById(long id)
        {
            return Json(Bll.GetOrdeById(id), JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetOrderFullDetailsById(long id)
        {
            return Json(Bll.GetOrderFullDetailsById(id), JsonRequestBehavior.AllowGet);
        }
        

        [HttpPost]
        public JsonResult AddPayment(OrderPaymentVM o)
        {
            return Json(new OrdersPaymentsBll().AddPaymentByClinet(o), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult CancleRequestDecision(OrderCancleRequestVM o)
        {
            return Json(Bll.CancleRequestDecision(o), JsonRequestBehavior.AllowGet);
        }

        

    }//End Class
}
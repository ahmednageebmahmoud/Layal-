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
using UI.Models;

namespace LayalCPanel.Controllers
{
    /// <summary>
    /// For Admin
    /// </summary>
    [Authorize]
    public class PhotoOrdersMangmentController : BasicController
    {
        OrdersMangmentBll Bll = new OrdersMangmentBll();
        OrdersBll ClinetBll = new OrdersBll();

        [PagePrivilege(PagesEnum.PhotoOrdersMangment, true, true, false, true)]
        public ActionResult Index()
        {
            return View();
        }

        [PagePrivilege(PagesEnum.PhotoOrdersMangment, true, false, false, true)]

        public ActionResult Details(long id)
        {
            return View();
        }
        public ActionResult Update(long id)
        {
            return View();
        }



        public ActionResult GetOrders(int skip, int take,int? productTypeId, long? productId,
            long? userCreatedId,DateTime? createDateFrom,DateTime? createDateTo,bool? isActive)
        {
            return Json(Bll.GetPhotographerOrders(skip, take, productTypeId, productId, userCreatedId, createDateFrom,  createDateTo, isActive), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetItems()
        {
            return Json(ResponseVM.Success(new
            {
                ProductTypes = FillItems.GetProductTypes(),
                Photographers = FillItems.GetUsers(AccountTypeEnum.Photographer),
            }), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetItemsV2()
        {
            return Json(ResponseVM.Success(new
            {
                ProductTypes = FillItems.GetProductTypes(),
                Countries = FillItems.GetCountries()
            }), JsonRequestBehavior.AllowGet);
        }
        

        public JsonResult GetProductsByProductTypeId(int productTypeId)
        {
            return Json(ResponseVM.Success(new
            {
                Products = FillItems.GetProductsByProductTypeId(productTypeId,true)
            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProductDetails(int productId)
        {
            ProductsBLL Pro = new ProductsBLL();
            return Json(Pro.GetProductById(productId), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetOrderFullDetailsById(long id)
        {
            return Json(Bll.GetOrderFullDetailsById(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [PageForUserType(AccountTypeEnum.ProjectManager)]
        public JsonResult AcceptTransfare(OrderPaymentVM payment)
        {
            return Json(new OrdersPaymentsBll(). AcceptTransfare(payment), JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult GetOrderById(long id)
        {
            return Json(Bll.GetOrdeById(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(OrderVM order)
        {
            return Json(ClinetBll.SaveChange(order), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddPayment(OrderPaymentVM o)
        {
            return Json(new OrdersPaymentsBll().AddPaymentByAdmin(o), JsonRequestBehavior.AllowGet);
        }

        




    }//End Class
}
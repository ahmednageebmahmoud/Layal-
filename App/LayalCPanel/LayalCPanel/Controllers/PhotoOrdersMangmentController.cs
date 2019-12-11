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
    [Authorize]
    public class PhotoOrdersMangmentController : BasicController
    {
        PhotoOrdersMangmentBll Bll = new PhotoOrdersMangmentBll();

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

        public JsonResult GetProductsByProductTypeId(int productTypeId)
        {
            return Json(ResponseVM.Success(new
            {
                Products = FillItems.GetProductsByProductTypeId(productTypeId)
            }), JsonRequestBehavior.AllowGet);
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
            return Json(new PhotoOrdersPaymentsBll(). AcceptTransfare(payment), JsonRequestBehavior.AllowGet);
        }
        


        public JsonResult Cancel(long id)
        {
            return Json(Bll.Cancel(id), JsonRequestBehavior.AllowGet);
        }


    }//End Class
}
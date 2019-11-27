using BLL.BLL;
using BLL.Enums;
using BLL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UI.Controllers;
using UI.Models;

namespace LayalCPanel.Controllers
{
    public class ShippingCategoriesController : BasicController
    {
        CitiesBLL Bll = new CitiesBLL(); 
      
        
        // GET: ShippingCategories
        [PagePrivilege(PagesEnum.ShippingCategories, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetItems(){

            return Json(ResponseVM.Success(new {
                Countires=FillItems.GetCountries() 
            }),JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCities(int countyId)
        {
            return Json(ResponseVM.Success(FillItems.GetCities(countyId)), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveChange(List<CityVM> cities)
        {
            return Json(Bll.SavePrices(cities), JsonRequestBehavior.AllowGet);
        }


    }//End CLass
}
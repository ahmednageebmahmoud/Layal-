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
    public class CountriesController : BasicController
    {
        CountriesBLL CountriesBLL = new CountriesBLL();
        CitiesBLL CitiesBLL = new CitiesBLL();

        [PagePrivilege(PagesEnum.Countries, true, true,true,true)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.Countries, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        
        public JsonResult GetCountryById(int countryId)
        {
            return Json(CountriesBLL.SelectById(countryId), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCountries(int? skip, int? take)
        {
            return Json(CountriesBLL.GetCountries(skip, take), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(CountryVM country)
        {
            return Json(CountriesBLL.SaveChange(country), JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public JsonResult SaveChangeCity(CityVM city)
        {
            return Json(CitiesBLL.SaveChange(city), JsonRequestBehavior.AllowGet);
        }
    }//end class
}
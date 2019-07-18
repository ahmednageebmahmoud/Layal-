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
    [PagePrivilege(true)]
    public class MyEnquiresController : BasicController
    {
        EnquiresBLL EnquiyBLL = new EnquiresBLL();


        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        public ActionResult EnquiryInformation(long id)
        {
            if (!EnquiyBLL.CheckIfMyEnquiry(id))
                return HttpNotFound();

            return View();
        }



        public ActionResult GetEnquiy(int id)
        {
            return Json(EnquiyBLL.SelectById(id), JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Countries = FillItems.GetCountries(),
                Cities = FillItems.GetCities(),
                EnquiryTypes=FillItems.GetEnquiryTypes(),
                Branches = FillItems.GetBranches()


            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEnquires(int? skip, int? take, string firstName, string lastName, string phone, DateTime? eventDate, DateTime? createDateTimeFrom, DateTime? createDateTimeTo, int? countryId, int? cityId, int? enquiryId,
           int? day,int? month,int? year,int? branchId)
        {
            return Json(EnquiyBLL.GetEnquires(skip, take, firstName, lastName, phone, eventDate, createDateTimeFrom, createDateTimeTo, countryId, cityId, enquiryId,day,month,year, branchId,null,true), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(EnquiyVM c)
        {
            return Json(EnquiyBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }

    }//end class
}
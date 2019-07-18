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
    public class EnquiresController : BasicController
    {
        EnquiresBLL EnquiyBLL = new EnquiresBLL();
        EnquiryStatusBLL EnquiryStatusBLL = new EnquiryStatusBLL();

        [PagePrivilege(PagesEnum.Enquires, true, false)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.Enquires, false,false, true,true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        [PagePrivilege(PagesEnum.Enquires, true, true, true, true)]
        public ActionResult EnquiryInformation()
        {
            return View();
        }



        
                 public ActionResult GetFullEnquiy(long id)
        {
            return Json(EnquiyBLL.GetFullEnquiyInformation(id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEnquiy(long id)
   
     {
            return Json(EnquiyBLL.SelectById(id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult CloseEnquiry(long id)

        {
            return Json(EnquiyBLL.CloseEnquiry(id), JsonRequestBehavior.AllowGet);
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
           int? day,int? month,int? year,int? branchId,bool? isLinkedClinet)
            

        {
            
            return Json(EnquiyBLL.GetEnquires(skip, take, firstName, lastName, phone, eventDate, createDateTimeFrom, createDateTimeTo, countryId, cityId, enquiryId,day,month,year, branchId, isLinkedClinet), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(EnquiyVM c)
        {
            return Json(EnquiyBLL.SaveChange(c), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddNewStatus(EnquiryStatusVM c)
        {
            return Json(EnquiryStatusBLL.AddNewStatus(c), JsonRequestBehavior.AllowGet);
        }
        
    }//end class
}
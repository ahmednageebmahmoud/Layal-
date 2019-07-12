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
    public class UsersController : BasicController
    {
        UsersBLL UserBLL = new UsersBLL();

        [PagePrivilege(PagesEnum.Users, true, false)]
        public ActionResult Index()
        {
            return View();
        }
        [PagePrivilege(PagesEnum.Users, false, true, true)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }

        [PagePrivilege(PagesEnum.UserInformation, true)]
        public ActionResult UserInformation()
        {
            return View();
        }

        [CheckIsEmilActived]
        public ActionResult ActiveEmail()
        {
            return View();
        }

        
               public ActionResult ProfileUpdate()
        {
            return View();
        }
        public ActionResult GetUser(int id)
        {
            return Json(UserBLL.SelectById(id), JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetUserProfileData()
        {
            return Json(UserBLL.SelectById(null), JsonRequestBehavior.AllowGet);
        }
        

        public JsonResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Countries = FillItems.GetCountries(),
                Cities = FillItems.GetCities(),
                Branches = FillItems.GetBranches()

            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUsers(int? skip, int? take, string userName, string email, string phoneNumber, string adddress,
            DateTime? createDateTo, DateTime? createDateFrom, int? countryId, int? cityId, int? accountTypeId, int? languageId)
        {
            return Json(UserBLL.GetUsers(skip, take, userName, email, phoneNumber, adddress,
            createDateTo, createDateFrom, countryId, cityId, accountTypeId, languageId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(UserVM user)
        {
            return Json(UserBLL.SaveChange(user), JsonRequestBehavior.AllowGet);
        }


        public JsonResult SendActiveCodeToEmail(Int64 id,string email,string userName)
        {
            return Json(UserBLL.SendActiveCodeToEmail(id,email,userName), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ActiveEmailByActiveCode(Int64 id, string activeCode)
        {
            return Json(UserBLL.ActiveEmail(id, activeCode), JsonRequestBehavior.AllowGet);
        }

        
    }//end class
}
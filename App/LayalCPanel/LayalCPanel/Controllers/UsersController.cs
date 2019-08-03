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
using BLL.Services;

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


        public JsonResult GetItems(bool userInformaiton = false)
        {
            return Json(userInformaiton ? null : new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Countries = FillItems.GetCountries(),
                Cities = FillItems.GetCities(),
                Branches = FillItems.GetBranches(),
                SaocialAccountTypes = FillItems.GetSocialAccountTypes()

            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUsers(UserVM user)
        {
            return Json(UserBLL.GetUsers(user), JsonRequestBehavior.AllowGet);
        }

        
        [HttpPost]
        public JsonResult SaveChange(UserVM user)
        {
            return Json(UserBLL.SaveChange(user), JsonRequestBehavior.AllowGet);
        }

  


        [HttpPost]
        public JsonResult AddSocialAccount(UserSocialAccountVM user)
        {
            return Json(UserBLL.SaveChangeSocialAccount(user), JsonRequestBehavior.AllowGet);
        }


        public JsonResult SendActiveCodeToEmail(Int64 id, string email, string userName)
        {
            return Json(UserBLL.SendActiveCodeToEmail(id, email, userName), JsonRequestBehavior.AllowGet);
        }

        public JsonResult ActiveEmailByActiveCode(Int64 id, string activeCode)
        {
            return Json(UserBLL.ActiveEmail(id, activeCode), JsonRequestBehavior.AllowGet);
        }


    }//end class
}
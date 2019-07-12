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
    public class UsersPrivilegesController : BasicController
    {
        UsersPrivilegesBLL UsersPrivilegesBLL = new UsersPrivilegesBLL();

        [PagePrivilege(PagesEnum.UsersPrivileges, true, false, false, true)]
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetItems()
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Menus = FillItems.GetMenus(),
                Employees = FillItems.GetEmployees()
            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetUsersPagesPrivileges(int menuId, long userId)
        {
            return Json(UsersPrivilegesBLL.SelectALL(menuId, userId), JsonRequestBehavior.AllowGet);
        }


        public JsonResult SaveChange(List<UsersPrivilegeVM> userPriv)
        {
            return Json(UsersPrivilegesBLL.SaveChange(userPriv), JsonRequestBehavior.AllowGet);
        }


    }//end class
}
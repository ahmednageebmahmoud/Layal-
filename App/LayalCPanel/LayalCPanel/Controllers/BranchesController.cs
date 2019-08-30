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
    public class BranchesController : BasicController
    {
        BranchesBLL BranchBLL = new BranchesBLL();

        [PagePrivilege(PagesEnum.Branches, true, false)]
        public ActionResult Index()
        {
            return View();
        }
        //[PagePrivilege(PagesEnum.Branches, false,false, true,)]
        public ActionResult AddAndUpdate()
        {
            return View();
        }


        public ActionResult GetBranch(int id)
        {
            return Json(BranchBLL.SelectById(id), JsonRequestBehavior.AllowGet);
        }


        public JsonResult GetItems(int? branchId)
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Countries = FillItems.GetCountries(),
                Cities = FillItems.GetCities(),
                Branches = FillItems.GetBranches(branchId)

            }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetItemsByBranchId(int branchId)
        {
            return Json(new ResponseVM(RequestTypeEnum.Success, Token.Success, new
            {
                Employees = FillItems.UsersWithCurrentBranchWithWorkTypes(branchId)

            }), JsonRequestBehavior.AllowGet);
        }

        


        public JsonResult GetBranches(int? skip, int? take, string branchName, string email, string phoneNumber, string adddress,
            DateTime? createDateTo, DateTime? createDateFrom, int? countryId, int? cityId, int? accountTypeId, int? languageId)
        {
            return Json(BranchBLL.GetBranches(skip, take, branchName, email, phoneNumber, adddress,
            createDateTo, createDateFrom, countryId, cityId, accountTypeId, languageId), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SaveChange(BranchVM branch)
        {
            return Json(BranchBLL.SaveChange(branch), JsonRequestBehavior.AllowGet);
        }

    }//end class
}
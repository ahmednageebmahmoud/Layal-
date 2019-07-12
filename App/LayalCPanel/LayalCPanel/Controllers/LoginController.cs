using BLL.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UI.Controllers
{
    public class LoginController : BasicController
    {
        LoginBLL LoginBLl = new LoginBLL();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(string userName,string password,bool rememberMe)
        {
            return Json(LoginBLl.Login(userName, password, rememberMe), JsonRequestBehavior.AllowGet);
        }

    }//end clsass
}
using BLL.Enums;
using LayalCPanel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UI.Controllers;

namespace UI.Controllers
{
    public class PhotographersRequestsController : BasicController
    {
        // GET: PhotographersRequests
        public ActionResult Index() => View();

        //Request For  Photographer Only
        [PageForUserType(AccountTypeEnum.Photographer)]
        public ActionResult Request()=>View();

     

    }//End Class
}
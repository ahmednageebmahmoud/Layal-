using BLL.BLL;
using BLL.Services;
using BLL.ViewModels;
using Newtonsoft.Json;
using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Net;
namespace UI.Controllers
{
    public class BasicController : Controller
    {
        public FillItemsBLL FillItems = new FillItemsBLL();
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            /*
             * يفضل وضعها فى الصفحة الرئيسية افضل شىء وتنفذ كل 12 ساعة مش كل ريكويست
             هنا النواقص العامة التى سوف تنشاء فيما بعد
             1: ترحيل الاستفسارات التى هيا عند البرنش الى الادمين اذا مر عليها 7 ايام بدون حدوث  اى حالة عليها 
             2: اضافة استبيان تلقائى بـ الراضا التام للمناسبة بعد تنفيذها بـ شهر  ولم يقوم المستخدم بعمل لها استبيان
             3:
             4:
             5:

             */




            LanguageService.SetCulture();


            //Check User Is Not Blocked
            if (User.Identity.IsAuthenticated)
            {

                var PagesActions = new string[]
                {
                "Index","AddAndUpdate","EnquiryInformation","Payments",
                "EventCoordinationsInformation","DistributionOfWork","EventsInformation","PackageInformtion",
                "UserInformation","ActiveEmail","ProfileUpdate"
                };

                var Action = filterContext.RouteData.Values["action"].ToString().ToLower();

                if (!new UsersBLL().CheckIsBlocked())
                {
                    //Check If Current Page Is Index 
                    if (PagesActions.Any(c => c.ToLower().Contains(Action)))
                    {
                        filterContext.Result = Redirect("/LogOut");
                    }
                    else
                    {
                        var ResponseObject = new ResponseVM(BLL.Enums.RequestTypeEnum.Error, Token.YourAccountIsNotActive);
                        filterContext.Result = Json(ResponseObject, JsonRequestBehavior.AllowGet);
                    }
                }
            }



        }
    }//end clsass
}
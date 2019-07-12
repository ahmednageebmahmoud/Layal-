using BLL.BLL;
using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace UI.Models
{
    /// <summary>
    /// ANageeb : 
    /// Using For Check User If Can Be Acces To This Page ..
    /// Using Only With Method .. 
    /// and not allow multiple indicates .. 
    /// and not allow multiple inherited .. 
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, Inherited = false, AllowMultiple = false)]
    public class CheckIsEmilActivedAttribute : ActionFilterAttribute
    {
        UsersPrivilegesBLL UsersPagesBLL = new UsersPrivilegesBLL();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
 

            if (UsersPagesBLL.CheckIfEmailActivated())

                filterContext.Result = new HttpNotFoundResult();
        }

    }
}
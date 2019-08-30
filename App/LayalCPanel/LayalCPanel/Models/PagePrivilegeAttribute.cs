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
    public class PagePrivilegeAttribute : ActionFilterAttribute
    {
        UsersPrivilegesBLL UsersPagesBLL = new UsersPrivilegesBLL();
        private PagesEnum Page { get; set; }
        private bool IsPageDispaly { get; set; }
        private bool IsPageAdd { get; set; }
        private bool IsPageEdit { get; set; }
        private bool IsPageDelete { get; set; }

        /// <summary>
        /// يمكن ان يكون هنا التحقق بناء على نوع المستخدم فقط 
        /// </summary>
        public bool CheckIfAnormalUser { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            //if user not allow access return 404

           if(this.CheckIfAnormalUser)
            {
                
                if(CookieService.UserInfo.AccountTypeId!=AccountTypeEnum.Clinet)
                    //معنى ذالك ان المستخدم الحالى ليس مستخدم عادى ويجب توجية الى صفحة الخطاء
                    filterContext.Result = new HttpNotFoundResult();
                return;
            }

            UsersPrivilegeVM UserPriv = UsersPagesBLL.SelectByUserId(this.Page);

            if (!(

                UserPriv.CanDisplay && this.IsPageDispaly ||
                UserPriv.CanDelete && this.IsPageDelete ||
                UserPriv.CanAdd && this.IsPageAdd ||
                UserPriv.CanEdit && this.IsPageEdit
                ))

                filterContext.Result = new HttpNotFoundResult();
        }

        /// <summary>
        /// chek user can be access to this page
        /// </summary>
        /// <param name="page">Page Enum</param>
        /// <param name="isPageDispaly">if current page for dispaly</param>
        /// <param name="isPageAdd">if current page for added</param>
        /// <param name="isPageEdit">if curretn page for edit</param>
        /// <param name="isPageDelete">if current page for delete</param>
        public PagePrivilegeAttribute(PagesEnum page, bool isPageDispaly = false,bool isPageDelete = false, bool isPageAdd = false, bool isPageEdit = false)
        {
            //this.UserId = CultureHelper.LoggedUserID;
            this.Page = page;

            this.IsPageDispaly = isPageDispaly;
            this.IsPageAdd = isPageAdd;
            this.IsPageEdit = isPageEdit;
            this.IsPageDelete = isPageDelete;
        }
        public PagePrivilegeAttribute(bool checkIfAnormalUser)
        {
            this.CheckIfAnormalUser = checkIfAnormalUser;
        }

    }
}
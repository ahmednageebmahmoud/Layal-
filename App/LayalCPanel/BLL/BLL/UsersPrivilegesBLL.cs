using BLL.Enums;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class UsersPrivilegesBLL : BasicBLL
    {
        public object SelectALL(int menuId, long UserId)
        {
            try
            {
                var Result = db.UsersPrivileges_SelectByMenuId(menuId, UserId).Select(c => new UsersPrivilegeVM
                {
                    UserId = UserId,//نقوم احنا بـ اضافتة بشكل يدوى لانة من مالممكن ان يرجع بيقة فارغة وحينها سوف يحدث خطاء عند الحفظ
                    PageId = c.Page_Id,
                    CanAdd = c.UsersPrivileges_CanAdd.HasValue ? c.UsersPrivileges_CanAdd.Value : false,
                    CanEdit = c.UsersPrivileges_CanEdit.HasValue ? c.UsersPrivileges_CanEdit.Value : false,
                    CanDelete = c.UsersPrivileges_CanDelete.HasValue ? c.UsersPrivileges_CanDelete.Value : false,
                    CanDisplay = c.UsersPrivileges_CanEdit.HasValue ? c.UsersPrivileges_CanDisplay.Value : false,

                    Page = new PageVM
                    {
                        Id = c.Page_Id,
                        NameAr = c.Pages_NameAr,
                        NameEn = c.Pages_NameEn,
                        OrderByNumber = c.Pages_OrderByNumber,
                        Url = c.Pages_Url,
                        MenuId = menuId,
                    }
                }).OrderBy(c=> c.Page.OrderByNumber).ToList();

                return new ResponseVM(RequestTypeEnum.Success, Token.Success, Result);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public UsersPrivilegeVM SelectByUserId(PagesEnum page)
        {
            
            if (this.UserLoggad.Id == this.AdminId)
                return new UsersPrivilegeVM
                {
                    CanAdd = true,
                    CanDelete = true,
                    CanDisplay = true,
                    CanEdit = true,

                };

            UsersPrivilegeVM Result= db.UserPrivileges_SelectByUserId((int)page, this.UserLoggad.Id)
                .Select(c => new
             UsersPrivilegeVM
            {
                CanAdd = c.CanAdd,
                CanDelete = c.CanDelete,
                CanDisplay = c.CanDisplay,
                CanEdit = c.CanEdit
            }).SingleOrDefault();

            if (Result == null)
                return new UsersPrivilegeVM();
            return Result;
        }



        /// <summary>
        /// حفظ التغيرات التى قام بها المدير من اجل امتيازات المستخدمين
        /// </summary>
        /// <param name="userPages"></param>
        /// <returns></returns>
        public object SaveChange(List<UsersPrivilegeVM> userPages)
        {
            using (var Trans = db.Database.BeginTransaction())
            {
                try
                {

                    //1: Delete All Previous PagesPrivileges
                    db.UserPrivileges_RemoveByMenuIdAndUserId(userPages.First().Page.MenuId, userPages.First().UserId);


                    //2:Add New Only Is Selected
                    userPages.Where(c => c._IfSelected).ToList().ForEach(c =>
                     {

                         db.UserPrivileges_Insert(c.Page.Id, c.UserId, c.CanAdd, c.CanEdit, c.CanDelete, c.CanDisplay);
                     });

                    Trans.Commit();
                    return new ResponseVM(RequestTypeEnum.Success, Token.Updated);
                }
                catch (Exception ex)
                {
                    Trans.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }

        }

        public bool CheckIfEmailActivated()
        {
            return db.Users_CheckIfEmailActivated(this.UserLoggad.Id).Single().Value;
        }

    }//end class
}

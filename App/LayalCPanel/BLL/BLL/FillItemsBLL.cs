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
    public class FillItemsBLL : BasicBLL
    {
        /// <summary>
        /// هذة السيرفيس تقوم بـ ارجاع المنيو والمنيو الفرعية 
        /// </summary>
        /// <param name="allMeus"></param>
        /// <param name="currentMenu"></param>
        /// <returns></returns>

        MenuVM GetMeue(List<MenuVM> allMeus, MenuVM currentMenu)
        {
            var SubMenus = allMeus.Where(c => c.ParentId == currentMenu.Id).Select(m => GetMeue(allMeus, m)).ToList();
            return new MenuVM
            {
                Id = currentMenu.Id,
                NameAr = currentMenu.NameAr,
                NameEn = currentMenu.NameEn,
                CssClass = currentMenu.CssClass,
                OrderByNumber = currentMenu.OrderByNumber,
                ParentId = currentMenu.ParentId,
                Pages = currentMenu.Pages,
                SubMenus = SubMenus,
            };
        }

        public object GetPackageInputTypes()
        {
            var Result = db.PackageInputTypes_SelectAll().Select(c => new PackageInputTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
            });
            return Result;
        }

        public object GetAlbumsTypes()
        {
            var Result = db.AlbumTypes_SelectAll().Select(c => new AlbumTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
            });
            return Result;
        }

        public object GetPrintNameTypes()
        {
            var Result = db.PrintNameTypes_SelectAll().Select(c => new PrintNamesTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
            });
            return Result;
        }

        public object GetPackages()
        {
            var Result = db.Packages_SelectAll().Select(c => new PackageVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                IsAllowPrintNames=c.IsAllowPrintNames
            });
            return Result;
        }

        public List<PageVM> GetUserPages(Int64 UserId)
        {
            if (this.UserLoggad.Id==AdminId)
                UserId = 0;
      return      db.Pages_SelectAllForUserCanBeAccess(UserId, this.UserLoggad.IsClinet)
                    .Select(c => new PageVM
                    {
                        Id = c.Id,
                        MenuId = c.FkMenu_Id,
                        NameAr = c.PageNameAr,
                        NameEn = c.PageNameEn,
                        OrderByNumber = c.OrderByNumber,
                        Url = c.Url
                    }).ToList();
        }

        public object GetMenusWithPages()
        {
            try
            {
                var UserId = this.UserLoggad.Id;
                List<MenuVM> Result = new List<MenuVM>();

                if (this.AdminId == this.UserLoggad.Id)
                    UserId = 0;

                var Pages = GetUserPages(UserId);

                var Menus = db.Menus_SelectAllForUserCanBeAccess(UserId, this.UserLoggad.IsClinet).OrderBy(c => c.OrderByNumber).Select(c => new MenuVM
                {
                    Id = c.Id,
                    NameAr = c.MenuNameAr,
                    NameEn = c.MenuNameEn,
                    OrderByNumber = c.OrderByNumber,
                    ParentId = c.Parent_Id,
                    CssClass = c.CssClass,
                    Pages = Pages.Where(b => b.MenuId == c.Id).ToList()
                }).ToList();

                Menus.Where(c => !c.ParentId.HasValue).ToList().ForEach(c =>
                {
                    Result.Add(GetMeue(Menus, c));
                });
                return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Menus);

            }
            catch (Exception ex)
            {
                return new ResponseVM(Enums.RequestTypeEnum.Error, Token.Success, ex);
            }

        }
        public object GetMenus()
        {
            var Result = db.Menus_SelectAll().Select(c => new MenuVM
            {
                Id = c.Id,
                NameAr=c.MenuNameAr,
                NameEn=c.MenuNameEn,
                OrderByNumber=c.OrderByNumber,
            });
            return Result;
        }
        public object GetEnquiryTypes()
        {
            var Result = db.EnquiryTypes_SelectAll().Select(c => new EnquiryTypeVM
            {
                Id = c.Id,
                NameAr = c. NameAr,
                NameEn = c.NameEn,
            });
            return Result;
        }

        public object GetBranches()
        {
            var Result = db.Branches_SelectByAll().Select(c => new BranchVM
            {
                Id = c.Id,
                NameAr = c.BranchNameAR,
                NameEn = c.BranchNameEn,
                CityId=c.FKCity_Id
            });
            return Result;
        }
        public object GetCities()
        {
            var Result = db.Cities_SelectAll().Select(c => new CityVM
            {
                Id = c.Id,
                CountryId=c.FKCountry_Id,
                    NameAr = c.Ar,
                    NameEn = c.En
            });
            return Result;
        }

        public object GetCountries()
        {
            var Result = db.Countries_SelectAll().Select(c => new CountryVM
            {
                Id = c.Id,
                    NameAr = c.Ar,
                    NameEn = c.En
            });
            return Result;
        }


        public object GetEmployees()
        {
            var Result = db.Users_SelectAllEmployees().Select(c => new UserVM
            {
                Id = c.Id,
                AccountType = new AccountTypeVM
                {
                    Id = c.FKAccountType_Id,
                        NameAr = c.AccountTypeNameAr,
                        NameEn = c.AccountTypeNameEn
                },
                UserName = c.UserName
            });
            return Result;
        }
    }//end class
}

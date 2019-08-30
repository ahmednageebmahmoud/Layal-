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

        public object GetEventSurveyQuestionTypes()
        {
            var Result = db.EventSurveyQuestionTypes_SelectAll().Select(c => new EventSurveyQuestionTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
            });
            return Result;
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

        public object GetEventSurveiesChart(int year)
        {
            var Result = db.EventSurveies_ChartByYear(year).Select(c => new  EventSurveyVM
            {
                CountIsSatisfied=c.CountIsSatisfied,
                EventDateTime=c.EventDateTime,

            }).ToList();
            var EventSurveyChart = new EventSurveyChartVM
            {
                CountEvents=db.Events_CountsByYear(year).First().Value,
                Month1 = Result.Where(c => c.EventDateTime.Month == 1).Sum(v => v.CountIsSatisfied),
                Month2 = Result.Where(c => c.EventDateTime.Month == 2).Sum(v => v.CountIsSatisfied),
                Month3 = Result.Where(c => c.EventDateTime.Month == 3).Sum(v => v.CountIsSatisfied),
                Month4 = Result.Where(c => c.EventDateTime.Month == 4).Sum(v => v.CountIsSatisfied),
                Month5 = Result.Where(c => c.EventDateTime.Month == 5).Sum(v => v.CountIsSatisfied),
                Month6 = Result.Where(c => c.EventDateTime.Month == 6).Sum(v => v.CountIsSatisfied),
                Month7 = Result.Where(c => c.EventDateTime.Month == 7).Sum(v => v.CountIsSatisfied),
                Month8 = Result.Where(c => c.EventDateTime.Month == 8).Sum(v => v.CountIsSatisfied),
                Month9 = Result.Where(c => c.EventDateTime.Month == 9).Sum(v => v.CountIsSatisfied),
                Month10 = Result.Where(c => c.EventDateTime.Month == 10).Sum(v => v.CountIsSatisfied),
                Month11 = Result.Where(c => c.EventDateTime.Month == 11).Sum(v => v.CountIsSatisfied),
                Month12 = Result.Where(c => c.EventDateTime.Month == 12).Sum(v => v.CountIsSatisfied),
            };

            return EventSurveyChart;
        }

        public object GetBranchesWithoutBranch(int branchId)
        {
            var Result = db.Branches_SelectByAll().Where(c=> c.Id!= branchId).Select(c => new BranchVM
            {
                Id = c.Id,
                NameAr = c.BranchNameAR,
                NameEn = c.BranchNameEn,
                CityId = c.FKCity_Id
            });
            return Result;
        }

        public object GetUsersWithBaicBranchWithWorkTypes()
        {
            var Result = db.Users_SelectByBaicBranchWithWorkTypes()
          .GroupBy(c => new
          {
              c.Id,
              c.UserName,
              c.IsBasic
          })
          .Select(c => new UserVM
          {
              Id = c.Key.Id,
              UserName = c.Key.UserName,
              IsBasicBranch = c.Key.IsBasic,

              WorkTypes = c.Select(v => new WorkTypeVM
              {
                  Id = v.FkWorkType_Id
              }).ToList()
          }).ToList();
            return Result;
        }

        public object GetSurveyQuestions()
        {
            var Result = db.EventSurveyQuestions_SelectAll().Select(c => new EventSurveyQuestionVM
            {
                Id = c.Id,
                IsActive=c.IsActive,
                IsDefault=c.IsDefault,
                SurveyQuestionTypeId=c.FKSurveyQuestionType_Id,
                SurveyQuestion=new EventSurveyQuestionTypeVM
                {
                    NameAr=c.SurveyQuestionNameAr,
                    NameEn=c.SurveyQuestionNameEn,
                }
            }).ToList();
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

        public object UsersWithCurrentBranchWithWorkTypes(int branchId)
        {
            var Result = db.Users_SelectByBranchIdWithWorkTypes(branchId)
              .GroupBy(c => new
              {
                  c.Id,
                  c.UserName,
              })
              .Select(c => new UserVM
              {
                  Id = c.Key.Id,
                  UserName = c.Key.UserName,
                  WorkTypes = c.Select(v => new WorkTypeVM
                  {
                      Id = v.FkWorkType_Id 
                  }).ToList()
              }).ToList();

            return Result;
        }

        public object GetSocialAccountTypes()
        {
            var Result = db.SocialAccountTypes_SelectAll().Select(c => new SocialAccountTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
            });
            return Result;
        }

        public List<UserVM> UsersWithCurrentBranchWithWorkTypes(int branchId, AccountTypeEnum employee)
        {
            var Result = db.Users_SelectByBranchId(branchId,(int)employee)
                .GroupBy(c=>new
                {
                    c.Id,
                    c.UserName
                })
                .Select(c => new UserVM
            {
                Id = c.Key.Id,
                UserName=c.Key.UserName,
                WorkTypes= c.Select(v=> new WorkTypeVM
                {
                    Id=v.FkWorkType_Id.HasValue?v.FkWorkType_Id.Value:0
                }).ToList()
            }).ToList();
            return Result;
        }

        public object GetPrintNameTypes()
        {
            var Result = db.PrintNameTypes_SelectAll().Select(c => new PrintNamesTypeVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                Price=c.Price
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
                IsPrintNamesFree = c.IsPrintNamesFree,
                Price=c.Price,
                NamsArExtraPrice=c.NamsArExtraPrice
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
                return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Result);

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
        public List<EnquiryTypeVM> GetEnquiryTypes()
        {
            var Result = db.EnquiryTypes_SelectAll().Select(c => new EnquiryTypeVM
            {
                Id = c.Id,
                NameAr = c. NameAr,
                NameEn = c.NameEn,
            }).ToList();
            return Result;
        }

        public object GetBranches(int? branchId=null)
        {
            var Result = db.Branches_SelectByAll().Where(c=> !branchId.HasValue || c.Id!= branchId.Value).Select(c => new BranchVM
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
                    NameEn = c.En,
                    IsoCode=c.IsoCode
            });
            return Result;
        }


        public object GetEmployees()
        {
            var Result = db.Users_SelectAllForUsersPrivileges().Select(c => new UserVM
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

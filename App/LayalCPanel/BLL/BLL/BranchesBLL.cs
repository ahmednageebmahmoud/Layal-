using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class BranchesBLL : BasicBLL
    {

        public object GetBranches(int? skip, int? take, string branchName, string email, string phoneNumber, string adddress,
            DateTime? createDateTo, DateTime? createDateFrom, int? countryId, int? cityId, int? accountTypeId, int? languageId)

        {
            var Branches = db.Branches_SelectByFilter(skip, take).Select(c => new BranchVM
            {
                Id = c.Id,
                NameAr = c.BranchNameAR,
                NameEn = c.BranchNameEn,
                PhoneNo = c.PhoneNo,
                Address=c.Address,

                City = new CityVM
                {
                    Id = c.FKCity_Id,
                    NameAr = c.CityNameAr,
                    NameEn = c.CityNameEn
                },
                Country = new CountryVM
                {
                    Id = c.FkCountry_Id,
                    NameAr = c.CountryNameAr,
                    NameEn = c.CountryNameEn
                },



            }).ToList();

            if (Branches.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Branches);
        }

        public object SaveChange(BranchVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = Add(c);
                            break;
                        case StateEnum.Update:
                            ObjectReturn = Update(c);
                            break;
                        case StateEnum.Delete:
                            ObjectReturn = Delete(c); break;
                            break;
                        default:
                            return new ResponseVM(RequestTypeEnum.Error, Token.StateNotFound);
                    }
                    tranc.Commit();
                    return ObjectReturn;
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        private object Delete(BranchVM c)
        {
            if (db.Branches_CheckIfUsed(c.Id).FirstOrDefault() > 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDeleteBecuseIsUsed);

            db.Branches_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted);
        }

        private object Update(BranchVM c)
        {
            db.Branches_Update(c.Id, c.NameAr, c.NameEn, c.Address, c.PhoneNo, c.CountryId, c.CityId, c.WordId);
            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        private object Add(BranchVM c)
        {
            ObjectParameter ID = new ObjectParameter("Id", typeof(int));
            ObjectParameter WordId = new ObjectParameter("WordId", typeof(int));
            db.Branches_Insert(ID, c.NameAr, c.NameEn, c.Address, c.PhoneNo, c.CountryId, c.CityId, WordId);
            c.Id = (int)ID.Value;
            c.WordId = (int)WordId.Value;
            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }

        public object SelectById(long id)
        {
            var Branch = db.Branches_SelectByPk(id).Select(c => new BranchVM
            {
                Id = c.Id,
                NameEn = c.BrancheNameEn,
                NameAr = c.BrancheNameAr,
                Address = c.Address,
                PhoneNo = c.PhoneNo,
                CityId = c.FKCity_Id,
                CountryId = c.FkCountry_Id,
                WordId=c.FKWord_Id,

                City = new CityVM
                {
                    Id = c.FKCity_Id,
                    NameAr = c.CityNameAr,
                    NameEn = c.CityNameEn
                },
                Country = new CountryVM
                {
                    Id = c.FkCountry_Id,
                    NameAr = c.CountryNameAr,
                    NameEn = c.CountryNameEn
                },
            }).FirstOrDefault();

            if (Branch == null)
                return new ResponseVM(Enums.RequestTypeEnum.Error, $"{Token.Branch} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Branch);
        }
    }//end class
}

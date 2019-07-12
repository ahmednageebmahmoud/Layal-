using BLL.Enums;
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
    public class CountriesBLL : BasicBLL
    {

        public object GetCountries(int? skip, int? take)

        {
            var Countries = db.Countries_SelectByFilter(skip, take).Select(c => new CountryVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                IsoCode = c.IsoCode,

                NameAr = c.NameAr,
                NameEn = c.NameEn

            }).ToList();

            if (Countries.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Countries);
        }

        public object SaveChange(CountryVM c)
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

        private object Delete(CountryVM c)
        {
            try
            {
                //Check Befor Used
                if (db.Countries_CheckIfUsed(c.Id).FirstOrDefault() > 0)
                    return new ResponseVM(RequestTypeEnum.Error, $"{Token.IsoCode} : {Token.CanNotDeleteBecuseIsUsed}");

                db.Countries_Delete(c.Id);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(CountryVM c)
        {
            try
            {
                //check iso codde
                if (db.Countries_IsoCodeBeforUsed(c.Id, c.IsoCode).FirstOrDefault() > 0)
                    return new ResponseVM(RequestTypeEnum.Error, $"{Token.IsoCode} : {Token.ItIsAlreadyUsed}");

                db.Countries_Update(c.Id, c.NameAr, c.NameEn, c.IsoCode, c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(CountryVM c)
        {
            try
            {
                //check iso codde
                if (db.Countries_IsoCodeBeforUsed(c.Id, c.IsoCode).FirstOrDefault() > 0)
                    return new ResponseVM(RequestTypeEnum.Error, $"{Token.IsoCode} : {Token.ItIsAlreadyUsed}");

                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.Countries_Insert(ID, c.NameAr, c.NameEn, c.IsoCode);
                c.Id = (int)ID.Value;
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public object SelectById(int id)
        {
            var Country = db.Countries_SelectWithCitiesByPk(id).GroupBy(c => new
            {
                c.Id,
                c.FKWord_Id,
                c.IsoCode,
                c.CountryNameAr,
                c.CountryNameEn
            }).Select(c => new CountryVM
            {
                Id = c.Key.Id,
                IsoCode = c.Key.IsoCode,
                WordId = c.Key.FKWord_Id,
                NameAr = c.Key.CountryNameAr,
                NameEn = c.Key.CountryNameEn,
                Cities = c.Select(v => new CityVM
                {
                    Id = v.Id,
                    CountryId = c.Key.Id,
                    WordId = v.CityFkWord_Id,
                    NameAr = v.CityNameAr,
                    NameEn = v.CityNameEn
                }).ToList()


            }).FirstOrDefault();

            if (Country == null)
                return new ResponseVM(Enums.RequestTypeEnum.Error, Token.CountryNotFound);

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Country);
    }


}//End Class
}

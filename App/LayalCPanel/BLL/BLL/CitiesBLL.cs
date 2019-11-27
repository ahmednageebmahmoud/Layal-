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
    public class CitiesBLL : BasicBLL
    {

        public object GetCities(int countryId)

        {
            var Cities = db.Cities_SelectByFilter(countryId).Select(c => new CityVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,

                    NameAr = c.Ar,
                    NameEn = c.En

            }).ToList();

            if (Cities.Count == 0)
            {

                return new ResponseVM(Enums.RequestTypeEnum.Info, $"{Token.Cities} : {Token.NoResult}");

            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Cities);
        }

        public object SaveChange(CityVM c)
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

        public object SavePrices(List<CityVM> cities)
        {
            using (var tranc=db.Database.BeginTransaction())
            {
                try
                {

                    
                    //Savw 500 City In Every Request To DataBase
                    int SaveCount = 500,
                        RequestsCount = cities.Count / SaveCount;
                    if (RequestsCount == 0) RequestsCount = 1;
                    for (int i = 0; i <= RequestsCount; i++)
                    {
                           var  CitiesTarget= cities.OrderBy(c => c.Id).Skip(i * SaveCount).Take(SaveCount).ToList();
                        if(CitiesTarget.Count>0)
                        {

                        var CitiesIds = string.Join(",", CitiesTarget.Select(c=> c.Id));
                        var CitiesPrices = string.Join(",", CitiesTarget.Select(c=> c.ShippingPrice));
                        db.Cities_UpdatePrices(CitiesIds, CitiesPrices, CitiesTarget.Count);
                        }
                    }

                    tranc.Commit();
                    return ResponseVM.Success();
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }

        private object Delete(CityVM c)
        {
            //Check Befor Used
            if (db.Cities_CheckIfUsed(c.Id).FirstOrDefault() > 0)
                return new ResponseVM(RequestTypeEnum.Error, $"{Token.IsoCode} : {Token.CanNotDeleteBecuseIsUsed}");

            db.Cities_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
        }

        private object Update(CityVM c)
        {
            db.Cities_Update(c.Id, c.NameAr, c.NameEn, c.WordId);
            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        private object Add(CityVM c)
        {

            ObjectParameter ID = new ObjectParameter("Id", typeof(int));
            db.Cities_Insert(ID, c.NameAr, c.NameEn, c.CountryId);
            c.Id = (int)ID.Value;
            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }



    }//End Class
}

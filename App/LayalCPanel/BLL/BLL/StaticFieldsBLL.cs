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
    public class StaticFieldsBLL : BasicBLL
    {

        public object GetStaticFields(int? skip, int? take)

        {
            var StaticFields = db.StaticFields_SelectByFilter(skip, take).Select(c => new StaticFieldVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn

            }).ToList();

            if (StaticFields.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, StaticFields);
        }

        public object SaveChange(StaticFieldVM c)
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

        private object Delete(StaticFieldVM c)
        {
            try
            {
                if (db.StaticFields_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);

                db.StaticFields_Delete(c.Id);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(StaticFieldVM c)
        {
            try
            {
                db.StaticFields_Update(c.Id, c.NameAr, c.NameEn, c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(StaticFieldVM c)
        {
            try
            {
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.StaticFields_Insert(ID, c.NameAr, c.NameEn);
                c.Id = (int)ID.Value;
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }



}//End Class
}

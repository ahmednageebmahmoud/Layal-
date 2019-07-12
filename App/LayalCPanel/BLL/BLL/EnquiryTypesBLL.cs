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
    public class EnquiryTypesBLL : BasicBLL
    {

        public object GetEnquiryTypes(int? skip, int? take)

        {
            var EnquiryTypes = db.EnquiryTypes_SelectByFilter(skip, take).Select(c => new EnquiryTypeVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn

            }).ToList();

            if (EnquiryTypes.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EnquiryTypes);
        }

        public object SaveChange(EnquiryTypeVM c)
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

        private object Delete(EnquiryTypeVM c)
        {
            try
            {
                //Check Befor Used
                if (db.EnquiryTypes_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Error, $"{Token.IsoCode} : {Token.CanNotDeleteBecuseIsUsed}");

                db.EnquiryTypes_Delete(c.Id);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(EnquiryTypeVM c)
        {
            try
            {
                db.EnquiryTypes_Update(c.Id, c.NameAr, c.NameEn, c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(EnquiryTypeVM c)
        {
            try
            {
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.EnquiryTypes_Insert(ID, c.NameAr, c.NameEn);
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

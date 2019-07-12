using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.ViewModels;
using BLL.Enums;
using Resources;
using System.Data.Entity.Core.Objects;

namespace BLL.BLL
{
    public class PackageDetailesBLL : BasicBLL
    {
       

        public object SaveChange(PackageDetailVM c)
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

        private object Delete(PackageDetailVM c)
        {
            try
            {
                db.PackageDetails_Delete(c.Id);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }


        private object Add(PackageDetailVM c)
        {
            try
            {
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.PackageDetails_Insert(ID,c.PackageId, c.ValueAr,c.ValueEn,c.PackageInputTypeId);
                c.Id = (int)ID.Value;
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

    }//end class
}

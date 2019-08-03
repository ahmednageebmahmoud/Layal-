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
    public class FilesReceivedTypesBLL : BasicBLL
    {

        public object GetFilesReceivedTypes(int? skip, int? take)

        {
            var FilesReceivedTypes = db.FilesReceivedTypes_SelectByFilter(skip, take).Select(c => new FilesReceivedTypeVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn

            }).ToList();

            if (FilesReceivedTypes.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, FilesReceivedTypes);
        }

        public object SaveChange(FilesReceivedTypeVM c)
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

        private object Delete(FilesReceivedTypeVM c)
        {
            try
            {
                if (db.FilesReceivedTypes_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);
                db.FilesReceivedTypes_Delete(c.Id,c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(FilesReceivedTypeVM c)
        {
            try
            {
                db.FilesReceivedTypes_Update(c.Id, c.NameAr, c.NameEn, c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(FilesReceivedTypeVM c)
        {
            try
            {
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.FilesReceivedTypes_Insert(ID, c.NameAr, c.NameEn);
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

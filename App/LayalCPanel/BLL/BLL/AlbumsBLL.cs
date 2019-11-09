using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using Resources;
using System;
using System.Linq;

namespace BLL.BLL
{
    public class AlbumsBLL : BasicBLL
    {

        public object GetAlbums(int? skip, int? take)

        {
            var Albums = db.Albums_SelectByFilter(skip, take).Select(c => new AlbumVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                WordDescriptionId = c.FKWord_Description_Id,
                DescriptionAr = c.DescriptionAr,
                DescriptionEn = c.DescriptionEn,
            }).ToList();

            if (Albums.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Albums);
        }


        public ResponseVM GetAlbumById(int id)
        {
            var Data = db.Albums_SelectByPk(id).GroupBy(v => new
            {
                v.Id,
                v.DescriptionAr,
                v.DescriptionEn,
                v.NameAr,
                v.NameEn
            }).Select(v => new AlbumVM
            {
                Id = v.Key.Id,
                NameAr = v.Key.NameAr,
                NameEn = v.Key.NameEn,
                DescriptionAr = v.Key.DescriptionAr,
                DescriptionEn = v.Key.DescriptionEn,
                AlbumFiles = v.Where(e => e.AlbumFileId >0).Select(b => new AlbumFileVM
                {
                    Id = b.AlbumFileId,
                    FileUrl = b.FileUrl
                }).ToList()
            }).FirstOrDefault();
            if (Data == null)
                return ResponseVM.Error($"{Token.Album} : {Token.NotFound}");
            return ResponseVM.Success(Data);
        }

        public object SaveChange(AlbumVM c)
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
                            ObjectReturn = Delete(c);
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

        private object Delete(AlbumVM c)
        {
            try
            {
                if (db.Albums_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);

                var Data = (AlbumVM)GetAlbumById(c.Id).Result;
                db.Albums_Delete(c.Id, c.WordId, c.WordDescriptionId, string.Join(",",Data.AlbumFiles.Select(v=> v.Id).ToList()));

                //Remove Files From Server
                FileService.RemoveFiles(Data.AlbumFiles.Select(b=> b.FileUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(AlbumVM c)
        {
            try
            {
                //Save Files In Server
                if (!SaveFiles(c))
                    return ResponseVM.Error(Token.SomFilesNotSaved);
                var NewFilesPathes = string.Join(",", c.AlbumFiles.Where(v => v.State == StateEnum.Create && v.FileUrl != null).Select(v => v.FileUrl));
                var DeleteFilesIds= string.Join(",", c.AlbumFiles.Where(v => v.State == StateEnum.Delete).Select(v => v.Id));
                var Object = db.Albums_Update(c.Id, c.NameAr, c.NameEn, c.WordId, c.DescriptionAr, c.DescriptionEn, c.WordDescriptionId,
                   NewFilesPathes, DeleteFilesIds)
                         .GroupBy(v => new
                         {
                             v.Id,
                             v.DescriptionAr,
                             v.DescriptionEn,
                             v.NameAr,
                             v.NameEn
                         }).Select(v => new AlbumVM
                         {
                             Id = v.Key.Id,
                             NameAr = v.Key.NameAr,
                             NameEn = v.Key.NameEn,
                             DescriptionAr = v.Key.DescriptionAr,
                             DescriptionEn = v.Key.DescriptionEn,
                             AlbumFiles = v.Where(e => e.AlbumFileId > 0).Select(b => new AlbumFileVM
                             {
                                 Id = b.AlbumFileId,

                                 FileUrl = b.FileUrl
                             }).ToList()
                         }).FirstOrDefault();

                FileService.RemoveFiles(c.AlbumFiles.Where(v => v.State == StateEnum.Delete).Select(v => v.FileUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, Object);
            }
            catch (Exception ex)
            {
                FileService.RemoveFiles(c.AlbumFiles.Where(v => v.State == StateEnum.Create).Select(v => v.FileUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }

        }

        private object Add(AlbumVM c)
        {
            try
            {
                //Save Files In Server
                if (!SaveFiles(c))
                    return ResponseVM.Error(Token.SomFilesNotSaved);

                var Object = db.Albums_Insert(c.NameAr, c.NameEn, c.DescriptionAr, c.DescriptionEn, string.Join(",", c.AlbumFiles.Where(v => v.FileUrl != null).Select(v => v.FileUrl)))
                         .GroupBy(v => new
                         {
                             v.Id,
                             v.DescriptionAr,
                             v.DescriptionEn,
                             v.NameAr,
                             v.NameEn
                         }).Select(v => new AlbumVM
                         {
                             Id = v.Key.Id,
                             NameAr = v.Key.NameAr,
                             NameEn = v.Key.NameEn,
                             DescriptionAr = v.Key.DescriptionAr,
                             DescriptionEn = v.Key.DescriptionEn,
                             AlbumFiles = v.Where(e => e.AlbumFileId > 0).Select(b => new AlbumFileVM
                             {
                                 Id = b.AlbumFileId,
                                 FileUrl = b.FileUrl
                             }).ToList()
                         }).FirstOrDefault();
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, Object);
            }
            catch (Exception ex)
            {
                FileService.RemoveFiles(c.AlbumFiles.Select(v => v.FileUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private bool SaveFiles(AlbumVM c)
        {
            bool SavedAll = true;

            c.AlbumFiles.Where(v => v.State == StateEnum.Create).ToList().ForEach(a =>
               {
                   //Save Image In server
                   if (a.File != null && SavedAll == true)
                   {
                       var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                       {
                           File = a.File,
                           ServerPathSave = "/Files/Albums/"
                       });

                       if (!FileSave.IsSaved)
                           SavedAll = false;
                       a.FileUrl = FileSave.SavedPath;
                   }
               });
            return SavedAll;
        }

    }//End Class
}

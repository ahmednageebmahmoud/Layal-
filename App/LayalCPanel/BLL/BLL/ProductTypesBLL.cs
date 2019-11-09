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
    public class ProductTypesBLL : BasicBLL
    {

        public object GetProductTypes(int? skip, int? take)

        {
            var ProductTypes = db.Phot_ProductTypes_SelectByFilter(skip, take).Select(c => new ProductTypeVM
            {
                Id = c.Id,
                WordId = c.FKWord_Name_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                ImageUrl=c.ImageUrl

            }).ToList();

            if (ProductTypes.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, ProductTypes);
        }

        public ResponseVM GetProductTypeById(long id)
        {
            var ProductType = db.Phot_ProductTypes_SelectByPK(id).Select(c => new ProductTypeVM
            {
                Id = c.Id,
                WordId = c.FKWord_Name_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                ImageUrl = c.ImageUrl
            }).FirstOrDefault();

            if (ProductType == null)
                return ResponseVM.Error($"{Token.ProductType} : {Token.NotFound}");

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, ProductType);
        }

        public object SaveChange(ProductTypeVM c)
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

        private object Delete(ProductTypeVM c)
        {
            try
            {
                if (db.Phot_ProductTypes_CheckIfUed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);

                db.Phot_ProductTypes_Delete(c.Id);
                FileService.RemoveFile(c.ImageUrl);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(ProductTypeVM c)
        {
            try
            {
                var OldValues = (ProductTypeVM)GetProductTypeById(c.Id).Result;

                //Save File 
                if (!SaveFile(c))
                    return ResponseVM.Error(Token.FileNotSaved);

                    db.Phot_ProductTypes_Update(c.Id,c.WordId, c.NameAr, c.NameEn, c.ImageUrl);

                //نتحقق اذا كان رفع صورة جديدة فيجب مسح القديمة
                if (c.Image != null)
                    FileService.RemoveFile(OldValues.ImageUrl);
                c.Image = null;

                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                //نتحقق اضا كانت هناك صورة جديدة حفظت فيجب حذفها
                if (c.Image != null)
                    FileService.RemoveFile(c.ImageUrl);
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }
        private bool SaveFile(ProductTypeVM c)
        {
            bool SavedAll = true;

            //Save Image In server
            if (c.Image != null)
            {
                var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                {
                    File = c.Image,
                    ServerPathSave = "/Files/Products/Types/"
                });

                if (!FileSave.IsSaved)
                    SavedAll = false;
                c.ImageUrl = FileSave.SavedPath;
            }
            return SavedAll;
        }

        private object Add(ProductTypeVM c)
        {
            try
            {
                //Save File 
                if (!SaveFile(c))
                    return ResponseVM.Error(Token.FileNotSaved);
                var ObjectSaved = db.Phot_ProductTypes_Insert(c.NameAr, c.NameEn,c.ImageUrl).Select(v=>
                new ProductTypeVM
                {
                    Id=v.Id,
                    ImageUrl=v.ImageUrl,
                    NameAr=v.NameAr,
                    NameEn=v.NameEn
                }).FirstOrDefault();
                if (ObjectSaved == null)
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
               
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, ObjectSaved);
            }
            catch (Exception ex)
            {
                FileService.RemoveFile(c.ImageUrl);
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }



    }//End Class
}

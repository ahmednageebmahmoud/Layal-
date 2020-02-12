using BLL.Enums;
using BLL.Services;
using BLL.ViewModels;
using Resources;
using System;
using System.Linq;
using System.Web.Script.Serialization;

namespace BLL.BLL
{
    public class ProductsBLL : BasicBLL
    {
        public object GetProducts(int? skip, int? take)

        {
            var Products = db.Phot_Products_SelectByFilter(skip, take).Select(c => new ProductVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                WordId = c.FKWord_Name_Id,
                WordDescriptionId = c.FKWord_Description_Id,
                IsActive = c.IsActive,
                Version = c.Version,
                Stock=c.Stock,

                ProductType = new ProductTypeVM { NameAr = c.ProductTypeNameAr, NameEn = c.ProductTypeNameEn },
                WordUploadFileNotesId = c.FKWord_UplaodFilesNotes_Id,
            }).ToList();

            if (Products.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Products);
        }


        public ResponseVM GetProductById(long id,bool fillOptions=true)
        {
            var Data = db.Phot_Products_SelectByPK(id).GroupBy(v => new
            {
                v.Id,
                v.DescriptionAr,
                v.DescriptionEn,
                v.NameAr,
                v.NameEn,
                v.UploadNotesAr,
                v.UploadNotesEn,
                v.FKProductType_Id,
                v.IsActive,
                v.FKWord_Name_Id,
                v.FKWord_Description_Id,
                v.FKWord_UplaodFilesNotes_Id,
                v.Version,
                v.Stock
            }).Select(v => new ProductVM
            {
                Id = v.Key.Id,
                NameAr = v.Key.NameAr,
                NameEn = v.Key.NameEn,
                DescriptionAr = v.Key.DescriptionAr,
                DescriptionEn = v.Key.DescriptionEn,
                UplaodFileNotesAr = v.Key.UploadNotesAr,
                UplaodFileNotesEn = v.Key.UploadNotesEn,
                ProductTypeId = v.Key.FKProductType_Id,
                WordId = v.Key.FKWord_Name_Id,
                WordDescriptionId = v.Key.FKWord_Description_Id,
                WordUploadFileNotesId = v.Key.FKWord_UplaodFilesNotes_Id,
                IsActive = v.Key.IsActive,
                Version = v.Key.Version,
                Stock=v.Key.Stock,
                Images = v.Where(e => e.ProductImageId.HasValue).Select(b => new ProductImageVM
                {
                    Id = b.ProductImageId.Value,
                    ImageUrl = b.ImageUrl
                }).ToList(),
                Options = fillOptions? db.Phot_ProductsOptions_SelectByProductId(v.Key.Id).GroupBy(c => new
                {
                    c.Id,
                    c.FKStaticField_Id,
                    c.NameAr,
                    c.NameEn
                }).Select(c => new ProductOptionVM
                {
                    Id = c.Key.Id,
                    StaticFieldId = c.Key.FKStaticField_Id,
                    StaticField = new StaticFieldVM
                    {
                        Id = c.Key.FKStaticField_Id,
                        NameAr = c.Key.NameAr,
                        NameEn = c.Key.NameEn
                    },
                    Items = c.Where(b => b.OptionItemId.HasValue).Select(b => new ProductOptionItemVM
                    {
                        Id = b.OptionItemId.Value,
                        WordValueId = b.FKWord_Value_Id.Value,
                        Price = b.Price,
                        ValueAr = b.ValueAr,
                        ValueEn = b.ValueEn
                    }).ToList()
                }).ToList():null
            }).FirstOrDefault();
            if (Data == null)
                return ResponseVM.Error($"{Token.Product} : {Token.NotFound}");
            return ResponseVM.Success(Data);
        }



        public object SaveChange(ProductVM c)
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

                return ObjectReturn;
            }
            catch (Exception ex)
            {

                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }

        }

        private object Delete(ProductVM c)
        {
            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    //Can Not Delete If Thie Is Used
                    if (db.Phot_Products_CheckIfUsed(c.Id).First().Value > 0)
                        return ResponseVM.Error(Token.CanNotDeleteBecuseIsUsedBuUCanDisActiveThis);

                    var Data = (ProductVM)GetProductById(c.Id).Result;
                    db.Phot_Products_Delete(c.Id, c.WordId, c.WordDescriptionId, c.WordUploadFileNotesId);

                    tranc.Commit();
                    //Remove Files From Server
                    FileService.RemoveFiles(Data.Images.Select(b => b.ImageUrl).ToList());
                    return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        private object Update(ProductVM c)
        {
            ProductOptionBLL OBLL = new ProductOptionBLL();

            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {

                    //Can Not Delete If Thie Is Used
                    if (db.Phot_Products_CheckIfUsed(c.Id).First().Value > 0)
                        return ResponseVM.Error(Token.CanNotUpdateBecuseIsUsedBuUCanDisActiveThis);



                    bool IsUsed = false;
                    //فى حالة اذا كان الطلب مستخدم لا يمكن تحديث سوى المعلومات الاساسية بدون فئة الطلب والصور فقط
                    if (db.Phot_Products_CheckIfUsed(c.Id).First().Value > 0)
                    {
                        c.ProductTypeId = 0;//For Not Update
                        IsUsed = true;
                    }

                    //Save Files In Server
                    if (!SaveFiles(c))
                        return ResponseVM.Error(Token.SomFilesNotSaved);
                    var NewFilesPathes = string.Join(",", c.Images.Where(v => v.State == StateEnum.Create && !string.IsNullOrEmpty(v.ImageUrl)).Select(v => v.ImageUrl));
                    var DeleteFilesIds = string.Join(",", c.Images.Where(v => v.State == StateEnum.Delete).Select(v => v.Id));
                    db.Phot_Products_Update(c.Id, c.WordId, c.WordDescriptionId, c.WordUploadFileNotesId, c.NameAr, c.NameEn, c.DescriptionAr, c.DescriptionEn, c.UplaodFileNotesAr, c.UplaodFileNotesEn,
                      NewFilesPathes, DeleteFilesIds, c.ProductTypeId, c.IsActive,c.Stock);


                    //Update Options
                    if (!IsUsed)
                        foreach (var op in c.Options)
                        {
                            switch (op.State)
                            {
                                case StateEnum.Create:
                                    OBLL.Add(op, c.Id, db);
                                    break;
                                case StateEnum.Update:
                                    {
                                        var Res = OBLL.Update(op, db);
                                        if (Res != null) return Res;
                                    }
                                    break;
                                case StateEnum.Delete:
                                    {
                                        //Check If This Item If Not Used
                                        var Res = OBLL.Delete(op, db);
                                        if (Res != null) return Res;
                                    }
                            break;
                            default:
                                    break;
                        }

                }


                    FileService.RemoveFiles(c.Images.Where(v => v.State == StateEnum.Delete).Select(v => v.ImageUrl).ToList());
                tranc.Commit();
                var Data = (ProductVM)GetProductById(c.Id).Result;

                if (IsUsed)
                    return new ResponseVM(RequestTypeEnum.Success, Token.UpdatedAllWithoutOptions, Data);
                else
                    return new ResponseVM(RequestTypeEnum.Success, Token.Updated, Data);

            }
                catch (Exception ex)
            {
                tranc.Rollback();
                FileService.RemoveFiles(c.Images.Where(v => v.State == StateEnum.Create).Select(v => v.ImageUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

    }

        public object ProductDisactive(long id,bool isActive)
        {
                db.Products_Disactive(id, isActive);
            return ResponseVM.Success();
        }

    /// <summary>
    /// Add Product
    /// </summary>
    /// <param name="c"></param>
    /// <returns></returns>
    private object Add(ProductVM c)
    {
        ProductOptionBLL OBLL = new ProductOptionBLL();
        using (var tranc = db.Database.BeginTransaction())
        {
            try
            {
                //Disapled Another Product With The Thame Parent 
                if (c.ProductParentId.HasValue)
                    db.Products_DisActiveParentAndChildren(c.ProductParentId);

                //Save Files In Server
                if (!SaveFiles(c))
                    return ResponseVM.Error(Token.SomFilesNotSaved);

                var ProductId = db.Phot_Products_Insert(c.NameAr, c.NameEn, c.DescriptionAr, c.DescriptionEn, c.UplaodFileNotesAr, c.UplaodFileNotesEn, string.Join(",", c.Images.Where(v => v.ImageUrl != null).Select(v => v.ImageUrl)), c.ProductTypeId,
                    this.UserLoggad.Id, c.IsActive, c.Version, c.ProductParentId,c.Stock)
                        .FirstOrDefault();

                //Return If Not Add  Product
                if (ProductId == null || ProductId <= 0)
                    throw new Exception(Token.ICantAdded);

                //Add Options
                OBLL.AddList(c.Options, ProductId.Value, db);
                var Data = (ProductVM)GetProductById(ProductId.Value).Result;
                tranc.Commit();
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, Data);
            }
            catch (Exception ex)
            {
                tranc.Rollback();
                FileService.RemoveFiles(c.Images.Select(v => v.ImageUrl).ToList());
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }
    }


    private bool SaveFiles(ProductVM c)
    {
        bool SavedAll = true;

        c.Images.Where(v => v.State == StateEnum.Create).ToList().ForEach(a =>
           {
                   //Save Image In server
                   if (a.File != null && SavedAll == true)
               {
                   var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                   {
                       File = a.File,
                       ServerPathSave = "/Files/Products/"
                   });

                   if (!FileSave.IsSaved)
                       SavedAll = false;
                   a.ImageUrl = FileSave.SavedPath;
               }
           });
        return SavedAll;
    }

}//End Class
}

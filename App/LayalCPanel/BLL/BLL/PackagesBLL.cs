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
    public class PackagesBLL : BasicBLL
    {
        public object GetPackages(int? skip, int? take)
        {
            var Packages = db.Packages_SelectByPaging(skip, take).Select(c => new PackageVM
            {
                Id = c.Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn,
                DescriptionAr = c.DescriptionAr,
                DescriptionEn = c.DescriptionEn,
                IsPrintNamesFree = c.IsPrintNamesFree,
                WordDescriptionId = c.FkWordDescription_Id,
                WordNameId = c.FkWordName_Id,
                Price=c.Price,
                NamsArExtraPrice=c.NamsArExtraPrice
            }).ToList();
            if (Packages.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(RequestTypeEnum.Info, Token.NoResult);
                return new ResponseVM(RequestTypeEnum.Info, Token.NoMoreResult);

            }

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, Packages);


        }

        public object SaveChange(PackageVM c)
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

        private object Delete(PackageVM c)
        {
            try
            {
                if (db.Package_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDeleteBecuseIsUsed);

                db.Packages_Delete(c.Id, c.WordNameId, c.WordDescriptionId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public object SaveChangePackageDeail(PackageDetailVM c)
        {
            throw new NotImplementedException();
        }

        private object Update(PackageVM c)
        {
            try
            {
                //if (!c.IsPrintNamesFree)
                //    c.NamsArExtraPrice = 0;

                db.Packages_Update(c.Id, c.NameAr, c.NameEn, c.DescriptionAr, c.DescriptionEn, c.IsPrintNamesFree, c.AlbumTypeId, c.WordNameId, c.WordDescriptionId,c.Price,c.NamsArExtraPrice);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(PackageVM c)
        {
            try
            {
            //    if (!c.IsPrintNamesFree)
            //        c.NamsArExtraPrice = 0;
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.Packages_Insert(ID, c.NameAr, c.NameEn, c.DescriptionAr, c.DescriptionEn, c.IsPrintNamesFree, c.AlbumTypeId,c.Price,c.NamsArExtraPrice)
                    .ToList().ForEach(v=> {
                        c.Id = v.Id;
                        c.WordDescriptionId = v.FkWordDescription_Id;
                        c.WordNameId = v.FkWordName_Id;
                    });

                return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        internal PackageVM GetPackageInformation(int packageId)
        {
        return    db.Packages_SelectByPK(packageId).GroupBy(c => new
            {
                c.Id,
                c.DescriptionAr,
                c.DescriptionEn,
                c.FKAlbumType_Id,
                c.FkWordDescription_Id,
                c.FkWordName_Id,
                c.IsPrintNamesFree,
                c.NameAr,
                c.NameEn,
                c.AlbumType_NameAr,
                c.AlbumType_NameEn,
            }).Select(c => new PackageVM
            {
                Id = c.Key.Id,
                AlbumTypeId = c.Key.FKAlbumType_Id,
                DescriptionAr = c.Key.DescriptionAr,
                DescriptionEn = c.Key.DescriptionEn,
                NameAr = c.Key.NameAr,
                NameEn = c.Key.NameEn,
                IsPrintNamesFree = c.Key.IsPrintNamesFree,
                WordDescriptionId = c.Key.FkWordDescription_Id,
                WordNameId = c.Key.FkWordName_Id,
                AlbumType = new AlbumVM
                {
                    NameAr = c.Key.AlbumType_NameAr,
                    NameEn = c.Key.AlbumType_NameEn,
                },
                PackageDetails = c.Where(x => x.PackageDetailsId.HasValue).Select(v => new PackageDetailVM
                {
                    Id = v.PackageDetailsId,
                    ValueAr = v.PackageDetailValueAr,
                    ValueEn = v.PackageDetailValueEn,
                    PackageInputTypeId = v.FKPackageInputType_Id,
                    PackageInputType = new PackageInputTypeVM
                    {
                        NameAr = v.PackageInputTypeAr,
                        NameEn = v.PackageInputTypeEn,
                    },
                }).ToList()

            }).FirstOrDefault();

        }

        public object SelectById(int id)
        {
            var Package = db.Packages_SelectByPK(id).GroupBy(c => new
            {
                c.Id,
                c.DescriptionAr,
                c.DescriptionEn,
                c.FKAlbumType_Id,
                c.FkWordDescription_Id,
                c.FkWordName_Id,
                c.IsPrintNamesFree,
                c.NameAr,
                c.NameEn,
                c.Price,c.NamsArExtraPrice
            }).Select(c => new PackageVM
            {
                Id = c.Key.Id,
                AlbumTypeId = c.Key.FKAlbumType_Id,
                DescriptionAr = c.Key.DescriptionAr,
                DescriptionEn = c.Key.DescriptionEn,
                NameAr = c.Key.NameAr,
                NameEn = c.Key.NameEn,
                IsPrintNamesFree = c.Key.IsPrintNamesFree,
                WordDescriptionId = c.Key.FkWordDescription_Id,
                WordNameId = c.Key.FkWordName_Id,
                Price = c.Key.Price,
                NamsArExtraPrice = c.Key.NamsArExtraPrice,
                PackageDetails = c.Where(x => x.PackageDetailsId.HasValue).Select(v => new PackageDetailVM
                {
                    Id = v.PackageDetailsId,
                    ValueAr = v.PackageDetailValueAr,
                    ValueEn = v.PackageDetailValueEn,
                    PackageInputTypeId = v.FKPackageInputType_Id
                }).ToList()

            }).FirstOrDefault();

            if (Package == null)
                return new ResponseVM(RequestTypeEnum.Error, $"{Token.Package} : {Token.NotFound}");

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, Package);
        }
    }//end class
}

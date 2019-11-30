using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using BLL.Enums;
using BLL.ViewModels;
using DAL;
using Resources;

namespace BLL.BLL
{
    public class ProductOptionBLL 
    {
        /// <summary>
        /// Add List Of Options 
        /// </summary>
        /// <param name="options"></param>
        internal void AddList(List<ProductOptionVM> options, long productId,LayanEntities db)
        {
            options.ForEach(op =>
            {
                var ItemsJson = new JavaScriptSerializer().Serialize(op.Items.Select(c => new
                {
                    ValueAr = c.ValueAr,
                    ValueEn = c.ValueEn,
                    Price = c.Price
                }).ToList());

                db.Phot_ProductsOptions_Insert(op.StaticFieldId, productId, ItemsJson);
            });
        }

        /// <summary>
        /// Add Option
        /// </summary>
        /// <param name="op"></param>
        /// <param name="productId"></param>
        internal void Add(ProductOptionVM op, long productId, LayanEntities db)
        {
            var ItemsJson = new JavaScriptSerializer().Serialize(op.Items.Select(c => new
            {
                ValueAr = c.ValueAr,
                ValueEn = c.ValueEn,
                Price = c.Price
            }).ToList());

            db.Phot_ProductsOptions_Insert(op.StaticFieldId, productId, ItemsJson);
        }

        /// <summary>
        /// Updatee One Option
        /// </summary>
        /// <param name="op"></param>
        internal object Update(ProductOptionVM op, LayanEntities db)
        {
            //Update Option And Delete Items
            var ItemsDeleted = op.Items.Where(c => c.State == StateEnum.Delete).ToList();
            //foreach (var item in ItemsDeleted)
            //{
            //    if (db.Phot_ProductsOptionItems_CheckIfUsed(item.Id).Any(v => v.Value > 0))
            //        return ResponseVM.Error($"{item.Value} : {Token.CanNotDeleteBecuseIsUsed}");
            //}

            var ItemsIdsDelete = string.Join(",", ItemsDeleted.Select(c => c.Id));
            db.Phot_ProductsOptions_Update(op.Id, op.StaticFieldId, ItemsIdsDelete);
            
            //Create Items
            var ItemsCreating = op.Items.Where(c => c.State == StateEnum.Create);
            if (ItemsCreating.Count() > 0)
            {
                string ItemsNamesAr = string.Join(",", ItemsCreating.Select(v => v.ValueAr));
                string ItemsNamesEn = string.Join(",", ItemsCreating.Select(v => v.ValueEn));
                string ItemsPrice = string.Join(",", ItemsCreating.Select(v => v.Price));
                db.Phot_ProductsOptionItems_Insert(op.Id, ItemsNamesAr, ItemsNamesEn, ItemsPrice, ItemsCreating.Count());
            }

            //Update Items
            var ItemsUpdating = op.Items.Where(c => c.State == StateEnum.Update);
            if (ItemsUpdating.Count() > 0)
            {
                string ItemsIds = string.Join(",", ItemsUpdating.Select(v => v.Id));
                string ItemsWordIds = string.Join(",", ItemsUpdating.Select(v => v.WordValueId));
                string ItemsNamesAr = string.Join(",", ItemsUpdating.Select(v => v.ValueAr));
                string ItemsNamesEn = string.Join(",", ItemsUpdating.Select(v => v.ValueEn));
                string ItemsPrice = string.Join(",", ItemsUpdating.Select(v => v.Price));
                db.Phot_ProductsOptionItems_Update(op.Id, ItemsIds, ItemsNamesAr, ItemsNamesEn, ItemsWordIds, ItemsPrice, ItemsUpdating.Count());
            }
            return null;
        }

        

        internal object Delete(ProductOptionVM op, LayanEntities db)
        {
            //if (db.f_Phot_ProductsOptions_CheckIfUsed(op.Id).Any(v => v.Value > 0))
            //    return ResponseVM.Error($"{op.StaticField.StaticFieldName} : {Token.CanNotDeleteBecuseIsUsed}");
            db.Phot_ProductsOptions_Delete(op.Id);
            return null;
        }
    }//End Class
}

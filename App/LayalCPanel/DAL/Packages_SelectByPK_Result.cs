//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    
    public partial class Packages_SelectByPK_Result
    {
        public int Id { get; set; }
        public long FkWordName_Id { get; set; }
        public bool IsPrintNamesFree { get; set; }
        public long FkWordDescription_Id { get; set; }
        public int FKAlbumType_Id { get; set; }
        public decimal Price { get; set; }
        public decimal NamsArExtraPrice { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string DescriptionAr { get; set; }
        public string DescriptionEn { get; set; }
        public Nullable<int> PackageDetailsId { get; set; }
        public string PackageDetailValueAr { get; set; }
        public string PackageDetailValueEn { get; set; }
        public Nullable<int> FKPackageInputType_Id { get; set; }
        public string PackageInputTypeAr { get; set; }
        public string PackageInputTypeEn { get; set; }
        public string AlbumType_NameAr { get; set; }
        public string AlbumType_NameEn { get; set; }
    }
}

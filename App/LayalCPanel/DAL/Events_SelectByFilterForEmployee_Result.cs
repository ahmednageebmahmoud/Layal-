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
    
    public partial class Events_SelectByFilterForEmployee_Result
    {
        public long Id { get; set; }
        public Nullable<bool> IsClinetCustomLogo { get; set; }
        public string LogoFilePath { get; set; }
        public Nullable<bool> IsNamesAr { get; set; }
        public string NameGroom { get; set; }
        public string NameBride { get; set; }
        public Nullable<int> FKPrintNameType_Id { get; set; }
        public System.DateTime EventDateTime { get; set; }
        public System.DateTime CreateDateTime { get; set; }
        public int FKPackage_Id { get; set; }
        public long FKClinet_Id { get; set; }
        public string Notes { get; set; }
        public long FKUserCreaed_Id { get; set; }
        public int FKBranch_Id { get; set; }
        public string ClendarEventId { get; set; }
        public decimal PackagePrice { get; set; }
        public decimal PackageNamsArExtraPrice { get; set; }
        public Nullable<System.DateTime> VistToCoordinationDateTime { get; set; }
        public string VistToCoordinationClendarEventId { get; set; }
        public Nullable<decimal> NamesPrintingPrice { get; set; }
        public long EventId { get; set; }
        public Nullable<bool> Booking { get; set; }
        public Nullable<bool> DataPerfection { get; set; }
        public Nullable<bool> Coordination { get; set; }
        public Nullable<bool> Implementation { get; set; }
        public Nullable<bool> ArchivingAndSaveing { get; set; }
        public Nullable<bool> ProcessingProducts { get; set; }
        public Nullable<bool> Choosing { get; set; }
        public Nullable<bool> DigitalProcessing { get; set; }
        public Nullable<bool> PreparingForPrinting { get; set; }
        public Nullable<bool> Manufacturing { get; set; }
        public Nullable<bool> QualityAndReview { get; set; }
        public Nullable<bool> Packaging { get; set; }
        public Nullable<bool> TransmissionAndDelivery { get; set; }
        public Nullable<bool> Archiving { get; set; }
        public string EnquiryName { get; set; }
        public Nullable<bool> IsClosed { get; set; }
        public string Branch_NameAr { get; set; }
        public string Branch_NameEn { get; set; }
        public string Package_NameAr { get; set; }
        public string Package_NameEn { get; set; }
        public string WordPrintNamesType_NameAr { get; set; }
        public string WordPrintNamesType_NameEn { get; set; }
    }
}

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
    
    public partial class Phot_OrderServicePrices_SelectByOrderId_Result
    {
        public long Id { get; set; }
        public long FkOrder_Id { get; set; }
        public long FkUser_Id { get; set; }
        public long FKWord_Id { get; set; }
        public decimal Price { get; set; }
        public System.DateTime CreateDateTime { get; set; }
        public string ServiceNameAr { get; set; }
        public string ServiceNameEn { get; set; }
    }
}

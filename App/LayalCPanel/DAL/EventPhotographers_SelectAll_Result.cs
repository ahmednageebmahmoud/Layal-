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
    
    public partial class EventPhotographers_SelectAll_Result
    {
        public long Id { get; set; }
        public System.DateTime CreateDateTime { get; set; }
        public long FKUser_Id { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }
        public int AccountTypeNameId { get; set; }
        public string AccountTypeNameAr { get; set; }
        public string AccountTypeNameEn { get; set; }
    }
}
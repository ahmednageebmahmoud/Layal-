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
    
    public partial class EventArchives_SelectAll_Result
    {
        public int EV_Id { get; set; }
        public long EV_EventId { get; set; }
        public long EV_UserId { get; set; }
        public string EV_FolderName { get; set; }
        public string EV_HardDiskName { get; set; }
        public System.DateTime EV_DateTime { get; set; }
        public Nullable<long> EVD_Id { get; set; }
        public Nullable<System.DateTime> EVD_DateTime { get; set; }
        public string EVD_MemoryId { get; set; }
        public string EVD_MemoryType { get; set; }
        public string EVD_Notes { get; set; }
        public Nullable<int> EVD_PhotoNumberFrom { get; set; }
        public Nullable<int> EVD_PhotoNumberTo { get; set; }
        public string EVD_PhotoStartName { get; set; }
    }
}

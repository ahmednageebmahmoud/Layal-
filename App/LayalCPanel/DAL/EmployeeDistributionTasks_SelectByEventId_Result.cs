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
    
    public partial class EmployeeDistributionTasks_SelectByEventId_Result
    {
        public long Id { get; set; }
        public int FKWorkType_Id { get; set; }
        public long FKEmployee_Id { get; set; }
        public long FKEvent_Id { get; set; }
        public bool IsAnotherBranch { get; set; }
        public int FKBranch_Id { get; set; }
        public string UserName { get; set; }
        public int FKAccountType_Id { get; set; }
        public bool IsFinshed { get; set; }
        public string BranchNameAr { get; set; }
        public string BranchNameEn { get; set; }
    }
}

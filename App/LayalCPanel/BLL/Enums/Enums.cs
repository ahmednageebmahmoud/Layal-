using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Enums
{
    public enum AccountTypeEnum
    {
        ProjectManager = 1,
        Supervisor = 2,
        BranchManager = 3,
        Clinet = 4
    }


    public enum RequestTypeEnum
    {
        Success = 1,
        Error = 2,
        Warning = 3,
        Info = 4,
    }
    public enum LanguageEnum
    {
        English = 1,
        Arabic = 2,
    }
    public enum AppInformationEnum
    {
        CP = 1,
        API = 2,
        FrontEnd = 3,
        Terms = 4
    }
    public enum FilesTypeEnum
    {
        Image = 1,
        SmallImage = 2,
        CV = 3,
    }

    public enum PagesEnum
    {
        UsersPrivileges = 1,
        Users = 2,
        Countries = 3,
        EnquiryTypes = 4,
        Enquires = 5,
        Branches = 6,
        UserInformation=10,
        PrintNamesTypes=11,
        Events=12,
        Packages=14,
        AlbumTypes=15,
        PackageInputTypes=16
    }


    public enum StateEnum
    {
        Create = 1,
        Update = 2,
        Delete = 3
    }

    public enum EnquiryStatusTypesEnum
    {
        NotAnswer= 1,
        CustomerContacted= 2,
        RejectService= 3,
        FullApproval= 4,
        ScheduleVisit= 5,
        NeedsToThink= 6,
        DesireToBook =7,
        BankTransferDeposit=8


    }
}//end class

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
        Clinet = 4,
        Employee = 5,
        Helper = 6,
        Photographer = 7
    }

    public enum CRMTypeEum
    {
        Payments = 1,
        EnquiryStatus = 2,
        EmployeeTasksStatus = 3
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
        UserInformation = 10,
        PrintNamesTypes = 11,
        Events = 12,
        Packages = 14,
        AlbumTypes = 15,
        PackageInputTypes = 16,
        SocialAccountTypes = 17,
        UserPayments = 18,
        EnquiryPayments = 19,
        EventSurveyQuestionTypes = 20,
        EventSurveyQuestions = 21,
        FilesReceivedTypes = 22
    }


    public enum StateEnum
    {
        Create = 1,
        Update = 2,
        Delete = 3
    }

    public enum EnquiryStatusTypesEnum
    {
        NotAnswer = 1,
        CustomerContacted = 2,
        RejectService = 3,
        FullApproval = 4,
        ScheduleVisit = 5,
        NeedsToThink = 6,
        BookByCash = 7,
        BookByBankTransfer = 8,

        //يضاف تلقاء عند انشاء الاستفسار مباشرة
        CreateEnquiry = 9,
        //يضاف تلقائ عند انشاء حساب الميل 
        CreateClinetAccount = 10,
        //يضاف تلقائى عند انشاء المناسبة
        CreateEvent = 11,
        //يضاف تلقائى عند غلق الاستفسار
        CloseEnquiry = 12

    }

    public enum WorksTypesEnum
    {
        Booking = 1,
        DataPerfection = 2,
        Coordination = 3,
        Implementation = 4,
        ArchivingAndSaveing = 5,
        ProductProcessing = 6,
        Chooseing = 7,
        DigitalProcessing = 8,
        PreparingForPrinting = 9,
        Manufacturing = 10,
        QualityAndReview = 11,
        Packaging = 12,
        TransmissionAndDelivery = 13,
        Archiving = 14,
    }




}//end class

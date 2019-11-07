using BLL.Enums;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class CRMBLL : BasicBLL
    {

        public object CRMDeitails(long enqyiryId)
        {
            List<CRMVM> CRM = new List<CRMVM>();
            var Eqnnuiry = db.Enquires_SelectByPk(enqyiryId).First();

            //Enquiry Status
            CRM.AddRange(db.CRM_EnquiryStatus(enqyiryId).Select(b => new CRMVM
            {
                DateTime = b.Status_CreateDateTime,
                UserCreatedId = b.Status_UserCreatedId,
                DescriptionAr = GetEnquiryStatusDescriptionAr(b.Status_CreatedUserNameAr, b.Status_NameAr, b.EnquiryStatusId, Eqnnuiry.EnquiryTypeNameAr),
                DescriptionEn = GetEnquiryStatusDescriptionEn(b.Status_CreatedUserNameEn, b.Status_NameEn, b.EnquiryStatusId, Eqnnuiry.EnquiryTypeNameEn),
                IconClass = "flaticon-file-1 kt-font-success",
                CircleColor = "kt-list-timeline__badge--success",
                CRMType = CRMTypeEum.EnquiryStatus
            }).ToList());

            //Enquiry Payments
            CRM.AddRange(db.CRM_EnquiryPayments(enqyiryId).Select(c => new CRMVM
            {
                DateTime = c.DateTime,
                UserCreatedId = c.FKUserCreated_Id,
                UserCreatedName = c.UserCreatedName,
                DescriptionAr = GetEnquiryPaymentDescriptionAr(c.UserCreatedName, c.Amount, c.IsBankTransfer, c.IsDeposit, c.IsAcceptFromManger),
                DescriptionEn = GetEnquiryPaymentDescriptionEn(c.UserCreatedName, c.Amount, c.IsBankTransfer, c.IsDeposit, c.IsAcceptFromManger),
                IconClass = "fas fa-hand-holding-usd kt-font-primary ",
                CircleColor = "kt-list-timeline__badge--primary",
                CRMType = CRMTypeEum.Payments

            }));

            //Employee Work Status
            CRM.AddRange(db.CRM_EventTaskStatusHistories(enqyiryId).Select(c => new CRMVM
            {
                DateTime = c.DateTime,
                UserCreatedId = c.FKUsre_Id,
                UserCreatedName = c.FullName,
                DescriptionAr = GetEventStatusDescriptionAr(c.FullName, c.IsFinshed, c.WorkTypeNameAr),
                DescriptionEn = GetEventStatusDescriptionEn(c.FullName, c.IsFinshed, c.WorkTypeNameEn),
                IconClass = "fa fa-tasks kt-font-danger ",
                CircleColor = "kt-list-timeline__badge--danger",
                CRMType = CRMTypeEum.EmployeeTasksStatus

            }));
            return CRM.OrderBy(c => c.DateTime).GroupBy(c=> c.SmallDate).Select(c=>
            
            new
            {
             Date=   c.Key,
                Details=c.Select(v=> new CRMVM
                {
                    DateTime = v.DateTime,
                    UserCreatedId = v.UserCreatedId,
                    DescriptionAr =v.DescriptionAr,
                    DescriptionEn =v.DescriptionEn,
                    IconClass =v.IconClass,
                    CircleColor =v.CircleColor,
                    CRMType =v.CRMType
                })
            }
            ).ToList();
        }

        private string GetEventStatusDescriptionEn(string fullName, bool isFinshed, string workTypeNameEn)
        {
            string StatusName = "";
            if (isFinshed)
                StatusName = "finshe";
            else
                StatusName = "cancel finsh";
            return string.Format("{0} has been {1} task {2}", fullName, StatusName, workTypeNameEn);
        }

        private string GetEventStatusDescriptionAr(string fullName, bool isFinshed, string workTypeNameAr)
        {
            string StatusName = "";
            if (isFinshed)
                StatusName = "بانهاء";
            else
                StatusName = "بالغاء انهاء";
            return string.Format("لفد قام {0}  {1} مهمه {2}", fullName, StatusName, workTypeNameAr);
        }


        private string GetEnquiryPaymentDescriptionAr(string userName, decimal amount, bool isBankTransfer, bool isDeposit, bool? isAcceptFromManger)
        {
            string PaymentName = "", PaymentMethod = "", AcceptStatus = "";
            if (isDeposit)
                PaymentName = "عربون بقيمة";
            else
                PaymentName = "دفعة بقيمة";

            if (isBankTransfer)
                PaymentMethod = "بواسطة تحويل بنكى";
            else
                PaymentMethod = "بواسطة الدفع الكاش";

            if (isAcceptFromManger == true)
                AcceptStatus = "وتم اعتمادها من الآدارة";
            else
                AcceptStatus = "ولم يتم اعتمادها من الآدارة";


            return string.Format("لقد قام الموظف {0} باضافة {1} {2} ريال {3} {4} ", userName, PaymentName, amount, PaymentMethod, AcceptStatus);
        }
        private string GetEnquiryPaymentDescriptionEn(string userName, decimal amount, bool isBankTransfer, bool isDeposit, bool? isAcceptFromManger)
        {
            string PaymentName = "", PaymentMethod = "", AcceptStatus = "";
            if (isDeposit)
                PaymentName = "deposit of value";
            else
                PaymentName = "payment of value";

            if (isBankTransfer)
                PaymentMethod = "by bank transfer.";
            else
                PaymentMethod = "by cash payment";

            if (isAcceptFromManger == true)
                AcceptStatus = "and it's been approved by the manger";
            else
                AcceptStatus = "and not been approved by the manger";


            return string.Format("{0} ahs been addedd {1} {2} sr {3} {4} ", userName, PaymentName, amount, PaymentMethod, AcceptStatus);

        }

        //Get Enquiry Status Description En
        private string GetEnquiryStatusDescriptionEn(string userName, string stauts, int stautsId, string enquiryType)
        {
            switch ((EnquiryStatusTypesEnum)stautsId)
            {
                case EnquiryStatusTypesEnum.NotAnswer:
                case EnquiryStatusTypesEnum.CustomerContacted:
                case EnquiryStatusTypesEnum.RejectService:
                case EnquiryStatusTypesEnum.FullApproval:
                case EnquiryStatusTypesEnum.ScheduleVisit:
                case EnquiryStatusTypesEnum.NeedsToThink:
                case EnquiryStatusTypesEnum.BookByCash:
                case EnquiryStatusTypesEnum.BookByBankTransfer:
                    return string.Format("'{0}' has been added status '{1}' on enquiry", userName, stauts);
                case EnquiryStatusTypesEnum.CreateClinetAccount:
                    return string.Format("'{0}' has been created clinet account on enquiry", userName);
                case EnquiryStatusTypesEnum.CreateEvent:
                    return string.Format("'{0}' has been created event for enquiry", userName);
                case EnquiryStatusTypesEnum.CloseEnquiry:
                    return string.Format("'{0}' has been closed enquiry", userName);
                case EnquiryStatusTypesEnum.CreateEnquiry:
                    return string.Format("'{0}' has been created enquiry by {1}", userName, enquiryType);
            }
            return "";
        }

        //Get Enquiry Status Description Ar
        private string GetEnquiryStatusDescriptionAr(string userName, string stauts, int stautsId, string enquiryType)
        {
            switch ((EnquiryStatusTypesEnum)stautsId)
            {
                case EnquiryStatusTypesEnum.NotAnswer:
                case EnquiryStatusTypesEnum.CustomerContacted:
                case EnquiryStatusTypesEnum.RejectService:
                case EnquiryStatusTypesEnum.FullApproval:
                case EnquiryStatusTypesEnum.ScheduleVisit:
                case EnquiryStatusTypesEnum.NeedsToThink:
                case EnquiryStatusTypesEnum.BookByCash:
                case EnquiryStatusTypesEnum.BookByBankTransfer:
                    return string.Format("لقد قام الموظف '{0}' باضافة الحالة '{1}' على الاستفسار", userName, stauts);
                case EnquiryStatusTypesEnum.CreateClinetAccount:
                    return string.Format("لقد قام الموظف '{0}' بانشاء حساب المستخدم على الاستفسار", userName);
                case EnquiryStatusTypesEnum.CreateEvent:
                    return string.Format("لقد قام الموظف '{0}' بانشاء المناسبة على الاستفسار", userName);
                case EnquiryStatusTypesEnum.CloseEnquiry:
                    return string.Format("لقد قام الموظف '{0}' بغلق الاستفسار", userName);
                case EnquiryStatusTypesEnum.CreateEnquiry:
                    return string.Format("لقد قام الموظف {0} بانشاء استفسارعن طريق {1}", userName, enquiryType);
            }
            return "";
        }
    }
}

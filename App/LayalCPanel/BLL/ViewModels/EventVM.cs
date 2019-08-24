using BLL.Enums;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class EventVM : BasicVM
    {

        public long Id { get; set; }
        public bool? IsClinetCustomLogo { get; set; }
        //public bool? IsLogoAr { get; set; }
        public bool? IsNamesAr { get; set; }
        public string LogoFilePath { get; set; }
        public string NameGroom { get; set; }
        public string NameBride { get; set; }
        public DateTime EventDateTime { get; set; }
        public DateTime CreateDateTime { get; set; }
        public DateTime? VistToCoordinationDateTime { get; set; }


        public string VistToCoordinationDateTimeDisplay => DateService.GetDateTimeAr(this.VistToCoordinationDateTime);
        public string EventDateTimeDisplay => DateService.GetDateAr(this.EventDateTime);
        public string CreateDateTimeDisplay => DateService.GetDateTimeAr(this.CreateDateTime);
        public int? PackageId { get; set; }
        public int? PrintNameTypeId { get; set; }
        public long ClinetId { get; set; }
        public string Notes { get; set; }
        public long UserCreaedId { get; set; }
        public int? BranchId { get; set; }
        public bool? IsActive { get; set; }
        public string UserNameCreatedId { get; set; }
        public string UserNameClinetId { get; set; }
        public EnquiyVM Enquiry { get; set; }
        public string EnquiryName { get; set; }
        public string UserCreatedUserName { get; set; }
        public string ClinetUserName { get; set; }
        public string CustomLogo { get; set; }
        public PackageVM Package { get; set; }
        public BranchVM Branch { get; set; }
        public PrintNamesTypeVM PrintNameType { get; set; }
        public string LogoFileName { get; set; }
        public string ClendarEventId { get; set; }
        public bool IsAllowSurvey => DateTime.Now > this.EventDateTime &&
         DateTime.Now < this.EventDateTime.AddMonths(1);



        public int Skip { get; set; }
        public int Take { get; set; }

        /// <summary>
        /// مثلا هل تم الانتهاء ام لاء
        /// </summary>
        public bool? IsFinshed { get; set; }


        public DateTime? EventDateTo { get; set; }
        public DateTime? EventDateFrom { get; set; }
        public DateTime? CreateDateFrom { get; set; }
        public DateTime? CreateDateTo { get; set; }
        public List<EnquiryPaymentVM> PaymentsInformations { get; set; } = new List<EnquiryPaymentVM>();

        /// <summary>
        /// اجمالى المدفوعات
        /// </summary>
        public decimal? TotalPayments { get; set; } = 0;
        /// <summary>
        /// اجمالى المدفوعات المعتمدة او النشطة
        /// </summary>
        public decimal? TotalPaymentsActivated { get; set; } = 0;

        /// <summary>
        /// سعر الحزمة
        /// </summary>
        public decimal PackagePrice { get; set; }
        /// <summary>
        /// السعر الاضافى من اجل طباعة الاسماء بـ العربى
        /// </summary>
        public decimal PackageNamsArExtraPrice { get; set; }
        /// <summary>
        /// مجموع الاسعار
        /// </summary>
        public decimal TotalPrice => this.PackagePrice + this.PackageNamsArExtraPrice;

        /// <summary>
        /// المبلغ المتبقى
        /// </summary>
        public decimal? RemainingAmount => this.TotalPrice - this.TotalPaymentsActivated;

        /// <summary>
        /// اذا قام بدفع كامل المستحقات
        /// </summary>
        public bool? IsPayment => this.TotalPaymentsActivated >= this.TotalPrice;

        public bool? IsClosed { get; set; }
        public string VistToCoordinationClendarEventId { get; internal set; }
        public int WorkTypeId { get; set; }
        public EventWorkStatusVM CurrentWorkStatus { get; set; }
        public List<EventWorkStatusVM> EventWorksStatus { get; set; } = new List<EventWorkStatusVM>();
        public EventWorksStatusIsFinshedVM EventWorkStatusIsFinshed { get; set; }
        public decimal NamesPrintingPrice { get;   set; }

        /// <summary>
        /// هناك بعض الحالات التى ينتهى فييها التاسك على اكثر من مرحلة 
        /// مثلا فى عملية الارشفة والحفظ قد تنتهى التاسك من الفرع الاول ولم تنتهى فى الفرع التانى 
        /// وحينها نتحقق بان المستخدم الحالى انهىء التاسك بتاعة
        /// </summary>
        public EventWorksStatusIsFinshedVM EventWorkStatusIsFinshedByCurrentUser { get {

                if (this.EventWorksStatus.Count == 0)
                    return new EventWorksStatusIsFinshedVM();

                return new EventWorksStatusIsFinshedVM
                {
                    ArchivingAndSaveing = this.EventWorksStatus.Any(v => v.WorkTypeId == WorksTypesEnum.ArchivingAndSaveing &&
                     v.UserId == this.UserLoggad.Id) ? this.EventWorksStatus.LastOrDefault(v => v.WorkTypeId == WorksTypesEnum.ArchivingAndSaveing &&
                      v.UserId == this.UserLoggad.Id).IsFinshed : false
                };
            } }


        /// <summary>
        /// معنى ذالك ان المستخدم الحالى هوا من نفس الفرع الخاص بـ المناسبة
        /// </summary>
        public bool IsCurrentUserSameBranch => this.UserLoggad.BrId == this.BranchId;
    }//end class
}

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


        public string VistToCoordinationDateTimeDisplay => DateService.GetDateTimeEn(this.VistToCoordinationDateTime);
        public string EventDateTimeDisplay => DateService.GetDateTimeEn(this.EventDateTime);
        public string CreateDateTimeDisplay => DateService.GetDateTimeEn(this.CreateDateTime);
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



        public int Skip { get; set; }
        public int Take { get; set; }




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
        public decimal RemainingAmount => this.TotalPrice - this.TotalPaymentsActivated.Value;

        public bool? IsPayment { get; set; }

        public bool? IsClosed { get; set; }
        public string VistToCoordinationClendarEventId { get; internal set; }
        public int WorkTypeId { get; set; }

        public List<EventWorkStatusVM> EventWorksStatus { get; set; } = new List<EventWorkStatusVM>();
        public EventWorkStatusVM CoordinationWorkStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.Coordination);
            }
        }  
        public EventWorkStatusVM ArchivingAndSaveingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.ArchivingAndSaveing);
            }
        }
        public EventWorkStatusVM ProductProcessingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.ProductProcessing);
            }
        }

        public EventWorkStatusVM ChooseingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.Chooseing);
            }
        }
        public EventWorkStatusVM DigitalProcessingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.DigitalProcessing);
            }
        }
        public EventWorkStatusVM PreparingForPrintingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.PreparingForPrinting);
            }
        }
        public EventWorkStatusVM ManufacturingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.Manufacturing);
            }
        }
        public EventWorkStatusVM QualityAndReviewStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.QualityAndReview);
            }
        }
        public EventWorkStatusVM PackagingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.Packaging);
            }
        }
        public EventWorkStatusVM TransmissionAndDeliveryStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.TransmissionAndDelivery);
            }
        }
        public EventWorkStatusVM ArchivingStatus
        {
            get
            {
                if (EventWorksStatus.Count == 0) return new EventWorkStatusVM();
                return this.EventWorksStatus.LastOrDefault(c => c.WorkTypeId == WorksTypesEnum.Archiving);
            }
        }



    }//end class
}

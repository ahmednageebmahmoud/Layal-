using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ViewModels
{
   public class OrderCancleRequestVM
    {
        public long Id { get; set; }
        /// <summary>
        /// وصف وهى تكتب من قبل المدير
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// سبب الالغاء وهى تكتب من قبل العميل
        /// </summary>
        public string Customer_ReasonCanceling { get; set; }
        /// <summary>
        /// وقت وتاريخ انشاء طلب  الالغاء
        /// </summary>
        public DateTime CreateDateTime { get; set; }
        public string CreateDateTime_Display => DateService.GetDateTimeAr(this.CreateDateTime);
        /// <summary>
        /// اذا تمت الموافقة على الطلب من قبل العميل
        /// </summary>
        public bool? Customer_IsAccepted { get; set; }
        /// <summary>
        /// تاريخ الموافقة من قبل العميل
        /// </summary>
        public DateTime? Customer_AcceptedDateTime { get; set; }
        public string Customer_AcceptedDateTime_Display => DateService.GetDateTimeAr(this.Customer_AcceptedDateTime);
        /// <summary>
        /// المبلغ المتبقى
        /// </summary>
        public decimal RemainingAmounts { get; set; }
        /// <summary>
        /// اذا كان المبلغ المتبقى سوف يرد الى العميل
        /// </summary>
        public bool IsRemainingAmountsForCustomer { get; set; }
        /// <summary>
        /// رقم حساب العميل البنكى
        /// </summary>
        public int? Customer_BankAccountNumber { get; set; }
        /// <summary>
        /// اسم البنك الخاص بـ العميل
        /// </summary>
        public string Customer_BankName { get; set; }
        /// <summary>
        /// اسم حساب العميل البنكى
        /// </summary>
        public string Customer_BankAccountName { get; set; }
        /// <summary>
        /// صورة التحويل الذى تمت ... اذا كان التحويل لـ صالح العميل اذا الذى يمكنة رفع الصورة هى الادارة 
        /// واذا  كان التحويل لـ صالح الشركة  اذا الذى سوف يرفع الصورة هو العميل
        /// </summary>
        public string TransfaerAmpuntImage { get; set; }
        /// <summary>
        /// المستخدم الذى قدم طلب الالغاء
        /// </summary>
        public long FkUserCancled_Id { get; set; }
        public long OrderId { get; set; }
        public long UserCreatedOrderId { get; set; }

        
        public HttpPostedFileBase TransfaerAmpuntImageFile { get; set; }

    }//End Class
}

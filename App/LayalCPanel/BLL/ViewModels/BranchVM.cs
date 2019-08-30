using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class BranchVM : BasicVM
    {
        public int? Id { get; set; }
        public string BranchName => this.IsEn ? this.NameEn : this.NameAr;
        public long? WordId { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string PhoneNo { get;   set; }
        public string Address { get;   set; }
        public CityVM City { get;   set; }
        public CountryVM Country { get;   set; }
        public int CityId { get;   set; }
        public int CountryId { get; set; }
        public bool IsBasic { get; set; }

        /// <summary>
        /// فى هذة الوظيفة يكون موظف واحد تابع للبرانش ولا يحتاج مدير البرناش لتوجية الوظيفة لة 
        /// فـ الوظيفة سوف توجة بشكل تلقائى
        /// </summary>
        public long? ArchivingAndSaveingEmployeeId { get; set; }
        /// <summary>
        /// فى هذة الوظيفة يكون موظف واحد تابع للبرانش ولا يحتاج مدير البرناش لتوجية الوظيفة لة 
        /// فـ الوظيفة سوف توجة بشكل تلقائى
        /// </summary>
        public long? ImplementationEmployeeId { get; set; }
        /// <summary>
        /// فى هذة الوظيفة يكون موظف واحد تابع للبرانش ولا يحتاج مدير البرناش لتوجية الوظيفة لة 
        /// فـ الوظيفة سوف توجة بشكل تلقائى
        /// </summary>
        public long? CoordinationEmployeeId { get; set; }
        /// <summary>
        /// لا يمكن تحديث المعلومات الاساسية اذا كان هذا الفرع مستخدم من قبل 
        /// </summary>
        public bool IsDeisabledBaicElements { get;   set; }
        /// <summary>
        /// اسم الفرع الاخبر الذى سوف يقوم بحفظ الملفات احطياتيا
        /// </summary>
        public int? ArchivingAndSaveingAnotherBranchId { get; set; }

    }//end class
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class ProductVM : BasicVM
    {
        public long Id { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string ProductName => this.IsEn ? this.NameEn : this.NameAr;
        public long ProductTypeId { get; set; }
        public long WordId { get;   set; }
        public long WordDescriptionId { get;   set; }
        public string DescriptionEn { get;   set; }
        public string DescriptionAr { get;   set; }
        public string Description => this.IsEn ? this.DescriptionEn : this.DescriptionAr;
        public string UplaodFileNotesAr { get; set; }
        public string UplaodFileNotesEn { get; set; }
        public string UplaodFileNote => this.IsEn ? this.UplaodFileNotesEn : this.UplaodFileNotesAr;
        public List<ProductImageVM> Images { get; set; } = new List<ProductImageVM>();
        public List<ProductOptionVM> Options { get; set; }
        public bool IsActive { get; set; }
        public ProductTypeVM ProductType { get; internal set; }
        public long WordUploadFileNotesId { get; internal set; }
        public int Version { get; set; }
        public long? ProductParentId { get; set; }
    }
}

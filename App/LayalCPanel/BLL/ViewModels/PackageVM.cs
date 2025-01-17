﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
 public   class PackageVM:BasicVM
    {
        public int Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string PackageName => this.IsEn ? this.NameEn : this.NameAr;

        public string DescriptionAr { get; set; }
        public string DescriptionEn { get; set; }
        public string DescriptionName => this.IsEn ? this.DescriptionEn : this.DescriptionAr;

        public bool IsPrintNamesFree { get;   set; }
        public int AlbumTypeId { get; set; }
        
        public long WordNameId { get; set; }
        public long WordDescriptionId { get; set; }
        public List<PackageDetailVM> PackageDetails { get;   set; }
        public AlbumVM AlbumType { get; set; }

        public decimal Price { get; set; }
        public decimal NamsArExtraPrice { get; set; }
        public decimal TotalPrice => this.Price + this.NamsArExtraPrice;

    }//End Class
}

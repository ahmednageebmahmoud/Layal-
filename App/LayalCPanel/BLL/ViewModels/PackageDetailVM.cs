﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class PackageDetailVM : BasicVM
    {
        public int? Id { get; set; }
        public string ValueAr { get; set; }
        public string ValueEn { get; set; }
        public string Value => this.IsEn ? ValueEn : ValueAr;
        
        public int? PackageInputTypeId { get; set; }
        public int PackageId { get; set; }
        public StaticFieldVM PackageInputType { get; set; }

    }//end class
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class AlbumVM : BasicVM
    {
        public int Id { get;   set; }
        public string NameAr { get;   set; }
        public string NameEn { get;   set; }
        public string AlbumTypeName => this.IsEn ? this.NameEn : this.NameAr;
        public long WordId { get;   set; }
        public long WordDescriptionId { get;   set; }

        public string DescriptionEn { get;   set; }
        public string DescriptionAr { get;   set; }
        public string Description => this.IsEn ? this.DescriptionEn : this.DescriptionAr;
        public List<AlbumFileVM> AlbumFiles { get; set; } = new List<AlbumFileVM>();

    }
}

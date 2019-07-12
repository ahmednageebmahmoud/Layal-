using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class NoteVM : BasicVM
    {
        public string Notes { get; set; }
        public DateTime? CreateDateTime { get; set; }
        public string CreateDateTimeDisplay => DateService.GetDateTimeEn(this.CreateDateTime);
        public long? UserCreatedId { get;   set; }
        public string UserCreatedName { get;   set; }
        public int? Id { get; internal set; }
    }//end class
}

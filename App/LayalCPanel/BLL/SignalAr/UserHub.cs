using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.SignalAr
{
    public class UserHub
    {
        /// <summary>
        /// User Id In DaaBassae
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// Connection Ids In Signal Ar
        /// </summary>
        public HashSet<string> ConnectionIds { get; set; }
    }
}

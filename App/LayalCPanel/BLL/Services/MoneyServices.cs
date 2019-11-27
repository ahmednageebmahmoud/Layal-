using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class MoneyServices
    {
        internal static object GetByCulture(decimal shippingPrice)
        {
            return shippingPrice.ToString("c", new CultureInfo("ar-sa"));
        }

    }//End Class
}

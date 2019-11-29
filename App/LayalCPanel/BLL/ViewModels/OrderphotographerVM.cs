using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class OrderphotographerVM : BasicVM
    {
        public long Id { get; set; }
        public long ProductTypeId { get; set; }
        public long ProductId { get; set; }
        public List<ProductOptionVM> Options { get; set; }
        public DateTime CreateDateTime { get; set; }
        public string CreateDateTime_Display => DateService.GetDateTimeAr(this.CreateDateTime);
        public ProductVM Product { get; set; }
        public ProductTypeVM ProductType { get; set; }
        public UserVM UserCreated { get; set; }
        public long UserCreatedId { get; set; }
        public bool IsActive { get; set; }
        public List<OrderFileVM> Files { get; set; }
        public bool Delivery_IsReceiptFromTheBranch { get; set; }
        public int? Delivery_CountryId { get; set; }
        public int? Delivery_CityId { get; set; }
        public string Delivery_Address { get; set; }


        public  List<OrderPriceVM> ServicePrices { get; set; }
        public decimal TotalPrices { get; internal set; }

        public List<OrderPaymentVM> Payments { get; set; }
        public decimal TotalPayments { get; internal set; }
        
    }
}//End CLass

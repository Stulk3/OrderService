//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OrderService.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Suppliers
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Manager { get; set; }
        public string PhoneNumber { get; set; }
        public Nullable<double> TradePrice { get; set; }
        public Nullable<double> RetailPrice { get; set; }
        public Nullable<double> Discount { get; set; }
        public Nullable<double> Available { get; set; }
        public string Specials { get; set; }
    }
}

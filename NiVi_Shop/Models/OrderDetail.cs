using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NiVi_Shop.Models
{
    [Table("OrderDetail")]
    public class OrderDetail
    {
        [Key]
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public double Price { get; set; }
        public int? Quantity { get; set; }
    }
}
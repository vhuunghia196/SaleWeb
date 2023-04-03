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
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DayOfCreate { get; set; }
        public int OrderID { get; set; }
        [ForeignKey("OrderID")]
        public virtual Orders Order { get; set; }
        public int ProductID { get; set; }
        [ForeignKey("ProductID")]
        public virtual Products Product { get; set; }
        public double Price { get; set; }
        public int? Quantity { get; set; }
    }
}
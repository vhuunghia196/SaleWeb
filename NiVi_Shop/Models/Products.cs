using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace NiVi_Shop.Models
{
    [Table("Products")]
    public class Products
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Image { get; set; }
        public double Price { get; set; }
        public int? Quantity { get; set; }
        public string Detail { get; set; }
        public int SupplierID { get; set; }
        public int CategoryID { get; set; }
    }
}
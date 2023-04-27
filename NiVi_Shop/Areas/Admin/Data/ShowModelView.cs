using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NiVi_Shop.Areas.Admin.Data
{
    public class ShowModelView
    {
        public List<Product> Products { get; set; }
        public List<Supplier> Supplier { get; set; }
        public List<Categories> Categories { get; set; }
        public List<Comment> Comment { get; set; }
        public List<OrderDetail> OrderDetail { get; set; }
        public List<Order> Orders { get; set; }
        public List<Role> Role { get; set; }
        public List<User> Users { get; set; }
    }
}
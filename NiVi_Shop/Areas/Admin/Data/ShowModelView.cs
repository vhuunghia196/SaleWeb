using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NiVi_Shop.Areas.Admin.Data
{
    public class ShowModelView
    {
        public List<Products> Products { get; set; }
        public List<Supplier> Supplier { get; set; }
        public List<Categories> Categories { get; set; }
        public List<Comment> Comment { get; set; }
        public List<OrderDetail> OrderDetail { get; set; }
        public List<Orders> Orders { get; set; }
        public List<Role> Role { get; set; }
        public List<Users> Users { get; set; }
    }
}
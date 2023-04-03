using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NiVi_Shop.Models
{
    public class NiViShopDBContext:DbContext
    {
        public NiViShopDBContext() : base("name=ChuoiKN") { }
        public DbSet<Categories> Categories { get; set; }
        public DbSet<OrderDetail> OrderDetail { get; set; }
        public DbSet<Orders> Orders { get; set; }

        public DbSet<Products> Products { get; set; }
        public DbSet<Supplier> Suplier { get; set; }
        public DbSet<Comment> Comment { get; set; }
        public DbSet<User> User { get; set; }
    }
}
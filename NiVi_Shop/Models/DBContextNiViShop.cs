namespace NiVi_Shop.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBContextNiViShop : DbContext
    {
        public DBContextNiViShop()
            : base("name=DBContextNiViShop6")
        {
        }

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Comment>()
                .HasMany(e => e.Comment1)
                .WithRequired(e => e.Comment2)
                .HasForeignKey(e => e.IDReplyComment);

            modelBuilder.Entity<Products>()
                .HasMany(e => e.Comment)
                .WithRequired(e => e.Products)
                .WillCascadeOnDelete(false);
        }
    }
}

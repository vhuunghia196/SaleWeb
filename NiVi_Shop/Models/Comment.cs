namespace NiVi_Shop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comment()
        {
            Comment1 = new HashSet<Comment>();
        }

        [Key]
        public int IDComment { get; set; }

        [Required]
        public string Content { get; set; }

        public int ProductId { get; set; }

        public int IDReplyComment { get; set; }

        public int? UserID { get; set; }

        public virtual Product Product { get; set; }

        public virtual User User { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comment1 { get; set; }

        public virtual Comment Comment2 { get; set; }
    }
}

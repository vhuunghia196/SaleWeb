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
        [Key]
        public int IDComment { get; set; }

        [Required]
        public string Content { get; set; }

        public int ProductId { get; set; }

        public int? UserID { get; set; }

        public DateTime? DayComment { get; set; }

        public virtual Products Products { get; set; }

        public virtual Users Users { get; set; }
    }
}

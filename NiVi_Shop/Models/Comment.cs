using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace NiVi_Shop.Models
{
    [Table("Comment")]
    public class Comment
    {
        [Key]
        public int IDComment { get; set; }
        [Required]
        public String Content { get; set; }
        public int ProductId { get; set; }
        [ForeignKey("ProductId")]
        public virtual Products Product { get; set; }
        public int UserID { get; set; }
        [ForeignKey("UserID")]
        public virtual User User { get; set; }
        public int IDReplyComment { get; set; }
        [ForeignKey("IDReplyComment")]
        public virtual Comment Comments { get; set; }
    }
}
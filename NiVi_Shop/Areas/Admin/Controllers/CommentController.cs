using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class CommentController : Controller
    {
        DBContextNiViShop dbConnext = new DBContextNiViShop();
        // GET: Admin/Comment
        public ActionResult Index()
        {
            var comment = dbConnext.Comment.ToList();
            return View(comment);
        }
        [HttpPost]
        public ActionResult Remove(int id)
        {
            var cmt = dbConnext.Comment.Find(id);
            if (cmt != null)
            {
                dbConnext.Comment.Remove(cmt);
                dbConnext.SaveChanges();
                return Json(new { success = true });
            }    
            return Json(new { success = false });
        }
    }
}
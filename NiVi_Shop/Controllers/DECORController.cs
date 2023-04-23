using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NiVi_Shop.Models;
namespace NiVi_Shop.Controllers
{
    public class DECORController : Controller
    {
        // GET: Decor

        public ActionResult Index()
        {
            var db = new DBContextNiViShop();
            var categoryID = db.Categories.Where(p => p.CategoryName == "Decor").FirstOrDefault().CategoryID;
            var productDecor = db.Products.Where(p => p.CategoryID == categoryID).ToList();
            return View(productDecor);
        }
    }
}
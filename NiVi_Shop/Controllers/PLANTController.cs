using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Controllers
{
    public class PLANTController : Controller
    {
        // GET: PLANT

        public ActionResult Index()
        {
            var db = new DBContextNiViShop();
            var categoryID = db.Categories.Where(p => p.CategoryName == "Plant").FirstOrDefault().CategoryID;
            var productPLant= db.Products.Where(p => p.CategoryID == categoryID).ToList();
            return View(productPLant);
        }
    }
}
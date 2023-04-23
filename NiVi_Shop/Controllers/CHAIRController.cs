using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NiVi_Shop.Models;
namespace NiVi_Shop.Controllers
{
    public class CHAIRController : Controller
    {

        // GET: CHAIR

        public ActionResult Index()
        {
            var db = new DBContextNiViShop();
            var categoryID = db.Categories.Where(p => p.CategoryName == "Chair").FirstOrDefault().CategoryID;
            var productChair = db.Products.Where(p => p.CategoryID == categoryID).ToList();
            return View(productChair);
        }
    }
}
using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Controllers
{
    public class SHOPController : Controller
    {
        // GET: SHOP

        public ActionResult Index()
        {
            var db = new DBContextNiViShop();
            var product = db.Products.ToList();
            
            return View(product);
        }
    }
}
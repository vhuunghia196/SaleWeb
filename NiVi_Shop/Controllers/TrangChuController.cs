using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;

namespace NiVi_Shop.Controllers
{
    public class TrangChuController : Controller
    {
        
        // GET: TrangChu
        public ActionResult Index()
        {
            var listProduct = new DBContextNiViShop().Products.ToList();
            return View(listProduct);
        }
    }
}
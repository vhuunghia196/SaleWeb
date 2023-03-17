using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Controllers
{
    public class TrangChuController : Controller
    {
        private NiViShopDBContext db = new NiViShopDBContext();
        // GET: TrangChu
        public ActionResult Index()
        {
            return View();
        }
    }
}
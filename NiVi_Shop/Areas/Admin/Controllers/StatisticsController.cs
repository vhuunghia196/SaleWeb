using Newtonsoft.Json;
using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class StatisticsController : Controller
    {
        DBContextNiViShop dbConnect = new DBContextNiViShop();
        // GET: Admin/Statistics
        public ActionResult Index()
        {
            return View();
        }

        public class ProductInfo
        {
            public string CategoryName { get; set; }
            public int Quantity { get; set; }
            public double Revenue { get; set; }
        }

        [HttpGet]
        public ActionResult getStatistics()
        {
            var products = dbConnect.Database.SqlQuery<ProductInfo>("SELECT c.CategoryName AS CategoryName, SUM(od.Quantity) AS Quantity, SUM(od.Price) AS Revenue FROM OrderDetail od INNER JOIN Products p ON od.ProductID = p.ProductID INNER JOIN Categories c ON p.CategoryID = c.CategoryID GROUP BY c.CategoryName").ToList();
            return Json(products, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Revenue()
        {
            return View();
        }
    }
}
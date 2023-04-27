using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        DBContextNiViShop dbConnext = new DBContextNiViShop();
        // GET: Admin/Order
        public ActionResult Index()
        {
            var item = dbConnext.Orders.ToList();
            ViewBag.Orderdetail = new SelectList(dbConnext.OrderDetail.ToList(), "OrderID", "ProductID");
            return View(item);
        }

        [HttpPost]
        public ActionResult Update (int id)
        {
            var ord = dbConnext.Orders.Find(id);
            if (ord != null)
            {
                ord.isPaid = 1;
                ord.isReceived = 1;
                dbConnext.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false });
        }
    }
}
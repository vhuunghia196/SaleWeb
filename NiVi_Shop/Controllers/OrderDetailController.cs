using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Controllers
{
    public class OrderDetailController : Controller
    {
        // GET: OrderDetail
        public ActionResult Index()
        {
            int? userId = Session["UserID"] as int?;
            if (userId != null)
            {
                using (var db = new DBContextNiViShop())
                {
                    // xử lí lấy tất cả sản phẩm theo UserID
                    var orderID = db.Orders
                                .Where(o => o.UserID == userId.Value && o.isPaid == 1)
                                .Select(o => o.OrderID)
                                .ToList();
                    // list chi tiết order theo userid
                    var orderDetails = db.OrderDetails
                                    .Where(od => orderID.Contains(od.OrderID))
                                    .ToList();
                    // list sản phẩm theo orderid
                    var productIds = db.OrderDetails
                                    .Where(od => orderID.Contains(od.OrderID))
                                    .Select(od => od.ProductID)
                                    .ToList();
                    //sản phẩm
                    var distinctProducts = db.Products
                                    .Where(p => productIds.Contains(p.ProductID))
                                    .GroupBy(p => p.ProductID)
                                    .Select(g => g.FirstOrDefault())
                                    .ToList();
                    ViewBag.DistinctProducts = distinctProducts;
                    ViewBag.OrderDetails = orderDetails;
                    return View();
                }
            }
            else
            {
                ViewBag.NotUserID = "Chưa đăng nhập";
                return View();
            }
        }
    }
}
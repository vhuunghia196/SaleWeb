using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Web.Security;

namespace NiVi_Shop.Controllers
{
    public class TrangChuController : Controller
    {
        
        // GET: TrangChu
        public ActionResult Index()
        {
            
            var listProduct = new DBContextNiViShop().Products.ToList();
            if(Session["Quantity"] == null)
            {
                Session["Quantity"] = 0;
            }

            return View(listProduct);
        }
        public ActionResult ProductDetails(int id)
        {
            var db = new DBContextNiViShop();
            var product = db.Products.FirstOrDefault(p => p.ProductID == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            var productsInCategory = db.Products.Where(p => p.CategoryID == product.CategoryID && p.ProductID != product.ProductID).ToList();
            ViewBag.ProductsInCategory = productsInCategory;
            return View(product);
        }
        public ActionResult Cart()
        {
            var db = new DBContextNiViShop();
            var cart = (List<Products>)Session["Cart"];
            var category_name = db.Categories.ToList();
            ViewBag.CategoryName = category_name;

            decimal sum = 0;
            decimal sumOfQuantity = 0;
            ViewBag.Quantity = sumOfQuantity;
            if (cart != null)
            {
                foreach (var product in cart)
                {
                    sum += (decimal)product.Price * (decimal)product.Quantity;
                    sumOfQuantity += (decimal)product.Quantity;
                }
                ViewBag.TotalPrice = sum;
                ViewBag.Quantity = sumOfQuantity;
            }
            Session["Quantity"] = sumOfQuantity;
            return View(cart);
        }


        // controller thêm giỏ hàng
        [HttpPost]
        public ActionResult AddToCart(int id)
        {
            // Lấy thông tin sản phẩm từ database bằng ID.
            var db = new DBContextNiViShop();
            var product = db.Products.Find(id);

            if (product != null)
            {
                // Nếu Session["Cart"] chưa tồn tại, tạo một List để lưu trữ các sản phẩm.
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<Products>();
                }

                // Lấy List đã lưu từ Session.
                var cart = (List<Products>)Session["Cart"];

                // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng hay chưa.
                var existingProduct = cart.FirstOrDefault(p => p.ProductID == id);

                if (existingProduct != null)
                {
                    // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng sản phẩm lên 1.
                    existingProduct.Quantity++;
                }
                else
                {
                    // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm vào List.
                    product.Quantity = 1;
                    cart.Add(product);
                }

                // Cập nhật Session["Cart"] với List mới nhất.
                Session["Cart"] = cart;

                // Trả về một đối tượng JSON với thuộc tính success = true để hiển thị thông báo.
                return Json(new { success = true });
            }
            else
            {
                // Trả về một đối tượng JSON với thuộc tính success = false nếu không tìm thấy sản phẩm.
                return Json(new { success = false });
            }
        }

        // xóa sản phẩm trong giỏ hàng 
        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            // Lấy List đã lưu từ Session.
            var cart = (List<Products>)Session["Cart"];

            // Tìm kiếm sản phẩm trong giỏ hàng.
            var product = cart.FirstOrDefault(p => p.ProductID == id);

            if (product != null)
            {
                // Nếu sản phẩm đã tồn tại trong giỏ hàng, xóa sản phẩm.
                cart.Remove(product);

                // Cập nhật Session["Cart"] với List mới nhất.
                Session["Cart"] = cart;

                // Trả về một đối tượng JSON với thuộc tính success = true để hiển thị thông báo.
                return Json(new { success = true });
            }
            else
            {
                // Trả về một đối tượng JSON với thuộc tính success = false nếu không tìm thấy sản phẩm.
                return Json(new { success = false });
            }
        }
        

    }
}
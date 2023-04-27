using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Controllers
{
    public class SearchController : Controller
    {
        
        // GET: Search
        public ActionResult Search()
        {
            var listProduct = new DBContextNiViShop().Products.ToList();
            return View(listProduct);
        }
        [HttpPost]
        public ActionResult Search(string searchKeyword)
        {
            // Lấy dữ liệu sản phẩm từ cơ sở dữ liệu dựa trên từ khóa tìm kiếm
            var products = SearchProducts(searchKeyword);

            if (products.Count() == 0)
            {
                // Không tìm thấy sản phẩm nào, trả về View "NotFound"
                return View("NotFound");
            }

            // Trả về View với dữ liệu sản phẩm tìm được
            return View(products);
        }
        public List<Product> SearchProducts(string searchKeyword)
        {
            // Kết nối cơ sở dữ liệu và truy xuất sản phẩm theo từ khóa tìm kiếm
            using (var db = new DBContextNiViShop())
            {
                return db.Products
                    .Where(p => p.Name.Contains(searchKeyword))
                    .ToList();
            }
        }
    }
}
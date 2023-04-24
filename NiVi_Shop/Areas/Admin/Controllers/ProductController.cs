using NiVi_Shop.Areas.Admin.Data;
using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    [AdminAuthorizeAttribute]
    public class ProductController : Controller
    {
        DBContextNiViShop dbConnect = new DBContextNiViShop();
        // GET: Admin/Product
        public ActionResult Index()
        {
            var listProduct = dbConnect.Products.ToList();

            return View(listProduct);
        }
        public class CombinedModelView
        {
            public ShowModelView ShowModelView { get; set; }
            public Product Products { get; set; }
        }

        public ActionResult Add()
        {
            var products = dbConnect.Products.ToList();
            var suppliers = dbConnect.Suppliers.ToList();
            var categories = dbConnect.Categories.ToList();
            var viewModel1 = new ShowModelView
            {
                Products = products,
                Supplier = suppliers,
                Categories = categories
            };
            var viewModel2 = new Product();
            var combinedModelView = new CombinedModelView
            {
                ShowModelView = viewModel1,
                Products = viewModel2
            };

            return View(combinedModelView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(CombinedModelView model)
        {
            if (ModelState.IsValid)
            {
                dbConnect.Products.Add(model.Products);
                dbConnect.SaveChanges();
                return RedirectToAction("Index");
            }
            var products = dbConnect.Products.ToList();
            var suppliers = dbConnect.Suppliers.ToList();
            var categories = dbConnect.Categories.ToList();
            model.ShowModelView = new ShowModelView
            {
                Products = products,
                Supplier = suppliers,
                Categories = categories
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var item = dbConnect.Products.Find(id);
                if (item != null)
                {
                    dbConnect.Products.Remove(item);
                    dbConnect.SaveChanges();
                    return Json(new { success = true });
                }
                return Json(new { success = false });
            }
            catch (Exception ex)
            {
                // Handle exception here
                return Json(new { success = false, error = ex.Message });
            }
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var item = dbConnect.Products.Find(id);
            ViewBag.Supplier = new SelectList(dbConnect.Suppliers.ToList(), "SupplierID", "Name");
            ViewBag.Category = new SelectList(dbConnect.Categories.ToList(), "CategoryID", "CategoryName");
            return View(item);
        }

        [HttpPost]
        public ActionResult Edit(Product p)
        {
    
            try
            {
                if (p != null)
                {
                    dbConnect.Products.Attach(p);
                    dbConnect.Entry(p).State = System.Data.Entity.EntityState.Modified;
                    dbConnect.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(p);
            }
            catch (Exception ex)
            {
                // Handle exception here
                return Json(new { success = false, error = ex.Message });
            }
        }
    }
}
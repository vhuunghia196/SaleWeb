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
    }
}
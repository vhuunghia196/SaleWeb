using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class SupplierController : Controller
    {
        DBContextNiViShop dbConnect = new DBContextNiViShop();
        // GET: Admin/Supplier
        public ActionResult Index()
        {
            //ViewBag.Supplier = new SelectList(dbConnect.Supplier.ToList());
            var supplier = dbConnect.Supplier.ToList();
            return View(supplier);
        }



        [HttpPost]
        public ActionResult Add(String name, String phone, String address, String company)
        {
            try
            {
                foreach (Supplier i in dbConnect.Supplier)
                {
                    if (i.Name == name && i.PhoneNumber == phone && i.Address == address && i.CompanyName == company)
                        return Json(new { success = false });
                }
                Supplier s = new Supplier();
                s.Name = name;
                s.PhoneNumber = phone;
                s.Address = address;
                s.CompanyName = company;
                if (s != null)
                {
                    dbConnect.Supplier.Add(s);
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

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var item = dbConnect.Supplier.Find(id);
                if (item != null)
                {
                    dbConnect.Supplier.Remove(item);
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

        [HttpPost]
        public ActionResult Edit(int id, String name, String phone, String address, String company)
        {
            try
            {
                String a = name;
                var s = dbConnect.Supplier.Find(id);
                if (s != null)
                {
                    s.Name = name;
                    s.PhoneNumber = phone;
                    s.Address = address;
                    s.CompanyName = company;
                    //dbConnect.Suppliers.Attach(s);
                    //dbConnect.Entry(s).State = System.Data.Entity.EntityState.Modified;
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
    }
}
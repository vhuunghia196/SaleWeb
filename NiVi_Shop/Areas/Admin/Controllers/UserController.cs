using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        DBContextNiViShop dbConnect = new DBContextNiViShop();
        // GET: Admin/User
        public ActionResult Index()
        {
            ViewBag.Role = new SelectList(dbConnect.Roles.ToList(), "RoleID", "RoleName");
            var user = dbConnect.Users.ToList();
            return View(user);
        }

        [HttpPost]
        public ActionResult Remove(int id)
        {
            try
            {
                var item = dbConnect.Users.Find(id);
                if (item != null)
                {
                    dbConnect.Users.Remove(item);
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
        public ActionResult Add(String name, String username, String password, String phone, String email, String role, String address)
        {
            try
            {
                var r = dbConnect.Roles.FirstOrDefault(a => a.RoleName == role);
                var user = dbConnect.Users.FirstOrDefault(u => u.Username == username);
                if (user == null)
                {

                    User u = new User();
                    u.Name = name;
                    u.Username = username;
                    u.Password = password;
                    u.PhoneNumber = phone;
                    u.Address = address;
                    u.Email = email;
                    u.RoleID = r.RoleID;
                    if(u!=null)
                    {
                        dbConnect.Users.Add(u);
                        dbConnect.SaveChanges();
                        return Json(new { success = 1 });
                    }
                    return Json(new { success = 2 });
                }
                else
                {
                    return Json(new { success = 3 });
                }
            }
            catch (Exception ex)
            {
                // Handle exception here
                return Json(new { success = 99, error = ex.Message });
            }
        }

        [HttpPost]
        public ActionResult Edit(int id, int role)
        {
            try
            {
                var u = dbConnect.Users.Find(id);
                
                if (u != null)
                {
                    u.RoleID = role;
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
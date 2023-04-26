using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace NiVi_Shop.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            if (user!=null)
            {
                // Kiểm tra tên đăng nhập và mật khẩu có đúng không
                var db = new DBContextNiViShop();
                var userList = db.Users.ToList();
                string trimmedUsername = user.Username.Trim();
                foreach (var i in userList)
                {
                    if (trimmedUsername == i.Username && user.Password == i.Password)
                    {
                        FormsAuthentication.SetAuthCookie(i.Username, true);
                        Session["Name"] = i.Name;
                        Session["UserID"] = i.UserID;
                        Session["RoleID"] = i.RoleID;
                        return RedirectToAction("Index", "TrangChu");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng");
                    }
                }
            }
            
            return View(user);
        }
        public ActionResult Logout()
        {

            // Xóa thông tin đăng nhập trên server
            FormsAuthentication.SignOut();
            Session.Remove("Name");
            Session.Remove("UserID");
            // Chuyển hướng đến trang đăng nhập
            return RedirectToAction("Login", "Login");
        }
    }
}
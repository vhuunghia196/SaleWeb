using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BCrypt.Net;

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
        // hàm login không băm mật khẩu
        /*[HttpPost]
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
        }*/



        // hàm login băm mật khẩu
        [HttpPost]
        public ActionResult Login(User user)
        {
            if (user != null)
            {
                // Kiểm tra tên đăng nhập và mật khẩu có đúng không
                var db = new DBContextNiViShop();
                var userList = db.Users.ToList();
                var userExists = userList.Any(u => u.Username == user.Username.Trim());
                if (!userExists)
                {
                    ModelState.AddModelError("", "Tên đăng nhập không tồn tại");
                    return View(user);
                }

                string hashedPassword = userList.First(u => u.Username == user.Username.Trim()).Password;
                try
                {
                    if (BCrypt.Net.BCrypt.Verify(user.Password.Trim(), hashedPassword))
                    {
                        FormsAuthentication.SetAuthCookie(user.Username.Trim(), true);
                        var currentUser = db.Users.FirstOrDefault(u => u.Username == user.Username.Trim());
                        if (currentUser != null)
                        {
                            Session["Name"] = currentUser.Name;
                            Session["UserID"] = currentUser.UserID;
                            Session["RoleID"] = currentUser.RoleID;
                        }
                        return RedirectToAction("Index", "TrangChu");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng");
                    }
                }
                catch (BCrypt.Net.SaltParseException ex)
                {
                    ModelState.AddModelError("", "Lỗi xác thực mật khẩu: " + ex.Message);
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
            Session.Remove("RoleID");
            // Chuyển hướng đến trang đăng nhập
            return RedirectToAction("Login", "Login");
        }
    }
}
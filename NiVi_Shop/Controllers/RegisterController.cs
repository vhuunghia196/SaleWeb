using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BCrypt.Net;
using hbehr.recaptcha;
using System.Net.Http;
using System.Threading.Tasks;

namespace NiVi_Shop.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(Users user, string gRecaptchaResponse)
        {
            if (user != null)
            {
                using (var context = new DBContextNiViShop())
                {
                    // Kiểm tra trùng lặp UserName và PhoneNumber
                    var username = user.Username.Trim();
                    if (context.Users.Any(u => u.Username == username))
                    {
                        ModelState.AddModelError("UserName", "Tên đăng nhập đã được sử dụng");
                    }
                    var phoneNumber = user.PhoneNumber.Trim();
                    if (context.Users.Any(u => u.PhoneNumber == phoneNumber))
                    {
                        ModelState.AddModelError("PhoneNumber", "Số điện thoại đã được sử dụng");
                    }
                    if (!ModelState.IsValid)
                    {
                        return View(user);
                    }
                    // Nếu không có lỗi, lưu thông tin người dùng vào cơ sở dữ liệu
                    if (ModelState.IsValid)
                    {
                        
                        var user2 = new Users
                        {
                            Username = user.Username.Trim(),
                            Password = BCrypt.Net.BCrypt.HashPassword(user.Password.Trim()),
                            Name = user.Name.Trim(),
                            Email = user.Email.Trim(),
                            PhoneNumber = user.PhoneNumber.Trim(),
                            Address = user.Address.Trim(),
                            RoleID = 2
                        };
                        context.Users.Add(user2);
                        context.SaveChanges();
                        // Chuyển hướng đến trang "Đăng nhập"
                        return RedirectToAction("Login", "Login");
                    }
                }
            }
            return View(user);
        }
       
    }
}
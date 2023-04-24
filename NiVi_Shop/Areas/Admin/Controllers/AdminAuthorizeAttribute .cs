using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NiVi_Shop.Areas.Admin.Controllers
{
    public class AdminAuthorizeAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        // Kiểm tra xem trang hiện tại có phải là trang admin hay không
        if (filterContext.HttpContext.Request.Url.AbsoluteUri.ToLower().Contains("/admin"))
        {
            // Kiểm tra xem có tồn tại Session["RoleID"] hay không
            if (filterContext.HttpContext.Session["RoleID"] == null || (int)filterContext.HttpContext.Session["RoleID"] != 1)
            {
                // Nếu không, chuyển hướng đến trang đăng nhập
                filterContext.Result = new RedirectResult("~/Login");
                return;
            }
        }

        base.OnActionExecuting(filterContext);
    }
}
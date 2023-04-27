using NiVi_Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Web.Security;
using PayPal.Api;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using System.Configuration;
using System.Data.Entity;

namespace NiVi_Shop.Controllers
{
    public class TrangChuController : Controller
    {

        // GET: TrangChu
        public ActionResult Index()
        {

            var listProduct = new DBContextNiViShop().Products.ToList();
            if (Session["Quantity"] == null)
            {
                Session["Quantity"] = 0;
            }
            /*ChangeProductImageUrls();*/
            return View(listProduct);
        }
        public void ChangeProductImageUrls(int idProduct)
        {
            using (var context = new DBContextNiViShop())
            {
                // Lấy danh sách sản phẩm
                var products = context.Products.Find(idProduct);

                // Tải ảnh lên Cloudinary và cập nhật url mới cho từng sản phẩm
                var account = new Account(
                    ConfigurationManager.AppSettings["CloudinaryCloudName"],
                    ConfigurationManager.AppSettings["CloudinaryApiKey"],
                    ConfigurationManager.AppSettings["CloudinaryApiSecret"]
                );
                CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);

               
                    // Lấy tên file cũ của ảnh
                    var oldImageName = products.Image;

                    // Tải ảnh lên Cloudinary và lấy URL mới của ảnh
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(Server.MapPath("~/Publics/image/" + oldImageName + ".jpg"))
                    };
                    var uploadResult = cloudinary.Upload(uploadParams);
                    var imageUrl = uploadResult.SecureUri.ToString();

                // Cập nhật cột Image với URL mới
                    products.Image = imageUrl;
              

                // Lưu thay đổi vào cơ sở dữ liệu
                context.SaveChanges();

                // Xóa ảnh cũ khỏi thư mục Images
            }
        }
        public void ChangeProductImageUrls()
        {
            using (var context = new DBContextNiViShop())
            {
                // Lấy danh sách sản phẩm
                var products = context.Products.ToList();

                // Tải ảnh lên Cloudinary và cập nhật url mới cho từng sản phẩm
                var account = new Account(
                    ConfigurationManager.AppSettings["CloudinaryCloudName"],
                    ConfigurationManager.AppSettings["CloudinaryApiKey"],
                    ConfigurationManager.AppSettings["CloudinaryApiSecret"]
                );
                CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);

                foreach (var product in products)
                {
                    // Lấy tên file cũ của ảnh
                    var oldImageName = product.Image;

                    // Tải ảnh lên Cloudinary và lấy URL mới của ảnh
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(Server.MapPath("~/Publics/image/" + oldImageName))
                    };
                    var uploadResult = cloudinary.Upload(uploadParams);
                    var imageUrl = uploadResult.SecureUri.ToString();

                    // Cập nhật cột Image với URL mới
                    product.Image = imageUrl;
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                context.SaveChanges();

                // Xóa ảnh cũ khỏi thư mục Images
            }
        }
        public ActionResult ProductDetails(int id)
        {
            var db = new DBContextNiViShop();
            var product = db.Products.FirstOrDefault(p => p.ProductID == id);
            var comments = db.Comment.Include(c => c.User)
                           .Where(c => c.ProductId == id)
                           .ToList();
            if (product == null)
            {
                return HttpNotFound();
            }
            var productsInCategory = db.Products.Where(p => p.CategoryID == product.CategoryID && p.ProductID != product.ProductID).ToList();
            ViewBag.Product = product;
            ViewBag.ProductID = id;
            ViewBag.ProductsInCategory = productsInCategory;
            ViewBag.Comments = comments;
            return View();
        }

        // thêm comment
        [HttpPost]
        public ActionResult AddComment(Comment comment, int productId)
        {
            var db = new DBContextNiViShop();
            // Kiểm tra tính hợp lệ của dữ liệu
            if (comment == null || Session["UserID"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                var newComment = new Comment
                {
                    Content = comment.Content,
                    UserID = (int)Session["UserID"],
                    DayComment = DateTime.Now,
                    ProductId = productId
                };
                db.Comment.Add(newComment);
                db.SaveChanges();
            }
            return RedirectToAction("ProductDetails", "TrangChu", new { id = productId });
        }
        public ActionResult Cart()
        {
            var db = new DBContextNiViShop();
            var cart = (List<Product>)Session["Cart"];
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
                    Session["Cart"] = new List<Product>();
                }

                // Lấy List đã lưu từ Session.
                var cart = (List<Product>)Session["Cart"];

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
                decimal sumOfQuantity = 0;
                if (cart != null)
                {
                    foreach (var products in cart)
                    {
                        sumOfQuantity += (decimal)products.Quantity;
                    }
                }
                Session["Quantity"] = sumOfQuantity;
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
            var cart = (List<Product>)Session["Cart"];

            // Tìm kiếm sản phẩm trong giỏ hàng.
            var product = cart.FirstOrDefault(p => p.ProductID == id);

            if (product != null)
            {
                // Nếu sản phẩm đã tồn tại trong giỏ hàng, xóa sản phẩm.
                cart.Remove(product);
                decimal sumOfQuantity = 0;
                if (cart != null)
                {
                    foreach (var products in cart)
                    {
                        sumOfQuantity += (decimal)products.Quantity;
                    }
                }
                Session["Quantity"] = sumOfQuantity;
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

        private Payment payment;
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            var listItems = new ItemList()
            {
                items = new List<Item>()
            };


            List<Product> listCarts = (List<Product>)Session["Cart"];
            foreach (var cart in listCarts)


            {
                listItems.items.Add(new Item()
                {
                    name = cart.Name,
                    currency = "USD",
                    price = cart.Price.ToString(),
                    quantity = cart.Quantity.ToString(),
                    sku = "sku"
                });
            }

            var payer = new Payer() { payment_method = "paypal" };

            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };


            var details = new Details()
            {
                tax = "1",
                shipping = "2",
                subtotal = listCarts.Sum(x => x.Quantity * x.Price).ToString()
            };

            var amount = new Amount()
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(),
                details = details
            };

            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = "Nghia testing transaction decription",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                item_list = listItems
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            return payment.Create(apiContext);
        }

        private Payment ExecutePayment(APIContext aPIContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            payment = new Payment() { id = paymentId };
            return payment.Execute(aPIContext, paymentExecution);
        }

        public ActionResult PaymentWithPaypal()
        {
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/TrangChu/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createdPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;
                    while (links.MoveNext())
                    {
                        Links link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = link.href;
                        }
                    }
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("Failure");
                    }
                }
            }
            catch (Exception ex)
            {
                PaypalLogger.Log("Error: " + ex.Message);
                return View("Failure");
            }
            var cart = (List<Product>)Session["Cart"];
            using (var context = new DBContextNiViShop())
            {
                var order = new Models.Orders
                {
                    UserID = (int)Session["userID"],
                    OrderDate = DateTime.Now,
                    isPaid = 1,
                    isReceived = 0
                };
                context.Orders.Add(order);
                context.SaveChanges();
                int latestOrderId = context.Orders.Max(o => o.OrderID);

                foreach (var product in cart)
                {
                    var orderDetail = new Models.OrderDetail
                    {
                        OrderID = latestOrderId,
                        ProductID = product.ProductID,
                        Price = product.Price,

                        Quantity = product.Quantity

                    };

                    context.OrderDetails.Add(orderDetail);
                }

                context.SaveChanges();
            }
            Session.Remove("Cart");
            return View("Success");
        }

        public ActionResult OrderNotPay()
        {
            var cart = (List<Product>)Session["Cart"];
            if(cart != null)
            {
                using (var context = new DBContextNiViShop())
                {
                    var order = new Models.Orders
                    {
                        UserID = (int)Session["userID"],
                        OrderDate = DateTime.Now,
                        isPaid = 0,
                        isReceived = 0
                    };
                    context.Orders.Add(order);
                    context.SaveChanges();
                    int latestOrderId = context.Orders.Max(o => o.OrderID);

                    foreach (var product in cart)
                    {
                        var orderDetail = new Models.OrderDetail
                        {
                            OrderID = latestOrderId,
                            ProductID = product.ProductID,
                            Price = product.Price,
                            Quantity = product.Quantity
                        };

                        context.OrderDetails.Add(orderDetail);
                    }

                    context.SaveChanges();
                }
                Session.Remove("Cart");
            }
            else
            {
                ViewBag.NotSuccess = "Nothing in cart";
            }
            return View("SuccessWithNotPay");
        }
    }
}
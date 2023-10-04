# SaleWeb
1. Giới thiệu đề tài

Ni’Vi Shop - Website về bán hàng nội thất được thiết kế để mang lại trải nghiệm mua sắm thú vị cho khách hàng với giao diện thân thiện và dễ sử dụng. Trang web được thiết kế với mục đích mang đến cho khách hàng một trải nghiệm mua sắm trực tuyến tuyệt vời, từ việc tìm kiếm sản phẩm dễ dàng đến quá trình thanh toán thuận tiện và an toàn.Web cho khách hàng xem chi tiết sản phẩm, tìm kiếm sản phẩm, thêm, xóa sản phẩm, sửa số lượng sản phẩm trong giỏ hàng và website cung cấp các phương thức để liên hệ với nhân viên Ni’Vi nếu cần giúp đỡ. Với sự đa dạng, chất lượng và tiện lợi, Ni’Vi Shop rất hy vọng sẽ giúp khách hàng tìm được những sản phẩm ưng ý và mang lại không gian sống hoàn hảo cho gia đình. Website shop bán hàng nội thất online – Ni’Vi Shop của nhóm em được lập trình bằng ngôn ngữ lập trình C#, chạy trên nền .Net Framework và kết nối bằng cơ sở SQL Server.

2. Các bước thực hiện đề tài

* Thiết kế giao diện trang web bán hàng nội thất Ni’Vi Shop
* Thiết kế cơ sở dữ liệu để lưu trữ thông tin của sản phẩm (Products), nhà cung cấp (Supplier), bình luận (Comment), đơn hàng (Orders), chi tiết đơn hàng (OrderDetail), khách hàng (Users), vai trò (Role), loại sản phẩm (Categories).
* Tạo các chức năng cho website bán hàng.
* Đảm bảo tính bảo mật cho website bằng cách sử dụng các công nghệ mã hóa dữ liệu, xác thực người dùng.
* Thực hiện thử nghiệm trên website để kiểm tra các lỗi và đảm bảo tính ổn định.
3.
3.a. Sơ đồ lớp
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/8c5b7b4f-fba8-417d-ab13-ec4d74583829)

3.b. Lược đồ cơ sở dữ liệu

* Role (RoleID, RoleName)
* Users (UserID, Username, Password, Name, PhoneNumber, Address, Email, #RoleID)
* Orders (OrderID, #UserID, OrderDate, isPaid, isReceived)
* Categories (CategoryID, CategoryName, Description)
* Supplier (SupplierID, Name, PhoneNumber, Address, CompanyName)
* Products (ProductID, Name, Image, Price, Quantity, Detail, #SupplierID, #CategoryID)
* OrderDetail (OrderDetailId, #OrderID, #ProductID, Price, Quantity)
* Comment (IDComment, [Content], #ProductID, DayComment, #UserID)

3.c. Mối quan hệ giữa các thực thể

* Mối quan hệ giữa bảng Users và Role: Một Role có nhiều Users và một Users thuộc một Role. Khi Role bị hủy thì vẫn còn Users. Đây là quan hệ Agreegation.
* Mối quan hệ giữa bảng Users và Orders: Một Users có nhiều Orders và một Orders thuộc một Users. Khi Users bị hủy thì Orders vẫn còn. Đây là quan hệ Agreegation.
* Mối quan hệ giữa bảng Orders và OrderDetail: Một Orders có nhiều OrderDetail và một OrderDetail thuộc một Orders. Khi Orders bị hủy thì OrderDetail vẫn còn. Đây là quan hệ Agreegation.
* Mối quan hệ giữa bảng Users và Comment: Một Users có nhiều Comment và một Comment thuộc một Users. Khi Users bị hủy thì Comment cũng bị hủy theo. Đây là quan hệ Composition.
* Mối quan hệ giữa bảng Products và Comment: Một Products có nhiều Comment và một Comment thuộc một Products. Khi Products bị hủy thì Comment cũng bị hủy theo. Đây là quan hệ Composition.
* Mối quan hệ giữa bảng Products và OrderDetail: Một Products có nhiều OrderDetail và một OrderDetail thuộc một Products. Khi Products bị hủy thì OrderDetail vẫn còn. Đây là quan hệ Agreegation.
* Mối quan hệ giữa bảng Products và Supplier: Một Supplier có nhiều Products và một Products thuộc một Supplier. Khi Supplier bị hủy thì Products cũng bị hủy theo. Đây là quan hệ Composition.
* Mối quan hệ giữa bảng Products và Categories: Một Categories có nhiều Products và một Products thuộc một Categories. Khi Categories bị hủy thì vẫn còn Products. Đây là quan hệ Agreegation.

4. Chức năng

Mô tả chức năng

4.1. Chức năng của Admin

* Theo dõi đơn hàng và cập nhật trạng thái đơn hàng.
* Thống kê doanh thu trên từng lọai sản phẩm, thống kê số lượng bán ra trên từng loại sản phẩm.
* Hiển thị, thêm, sửa, xóa sản phẩm.
* Hiển thị, thêm, sửa, xóa nhà cung cấp.
* Hiển thị, thêm, sửa, xóa người dùng.
* Xóa những comment (Các comment được nhận định là tiêu cực).

4.2 Chức năng của Customer

* Bình luận sản phẩm.
* Đăng nhập và đăng ký tài khoản.
* Hiển thị sản phẩm và danh mục sản phẩm.
* Cho phép khách hàng tìm kiếm sản phẩm theo từ khóa
* Cho phép khách hàng xem thông tin chi tiết của sản phẩm.
* Cho phép khách hàng xem những đơn đặt hàng đã thanh toán online
* Thêm sản phẩm vào giỏ hàng.
* Thanh toán online với paypal.

5. Giao diện


* Trang chủ admin
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/f3d85187-227e-4073-85ab-9f5f0aa37ca0)

* Thống kê doanh thu trên từng lọai sản phẩm, thống kê số lượng bán ra trên từng loại sản phẩm.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/75c03bc9-b582-4cb9-bfa2-bbc8e1cdea6b)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/dcc44c24-d7c3-4721-8c7f-9429584dfda8)

* Hiển thị, thêm, sửa, xóa sản phẩm.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/ba92eccb-883c-42fe-b3ef-60cebe9b9dc3)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/7cbe6535-2697-4729-9557-e1b82aa215bb)

* Hiển thị, thêm, sửa, xóa nhà cung cấp.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/a9208aa0-d060-4ed2-8472-750df5276553)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/68563c44-93c0-4bcc-bee4-d241bac518fd)

* Hiển thị, thêm, sửa, xóa người dùng.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/39408982-d5d8-497b-99bc-f1444bebd12c)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/feb244ba-6efc-4758-a91d-a6eeb4ca2ae8)

* Xóa những comment (Các comment được nhận định là tiêu cực).
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/42a94f29-3cb4-4f61-9c4f-c4ec6295b920)

* Theo dõi đơn hàng và cập nhật trạng thái đơn hàng.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/47936cc0-2cd4-4e0f-8980-188b811905d7)

* Đăng nhập và đăng ký tài khoản.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/cbd85371-6c31-42a8-81e3-9ce34618109f)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/d9c70a7e-e722-497a-a551-98a20d13385f)

* Hiển thị sản phẩm và danh mục sản phẩm.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/7577fe5e-444f-4a33-8c2e-dc87ebf0b88b)

* Cho phép khách hàng xem thông tin chi tiết của sản phẩm.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/5a1ffc27-6ca4-4d65-9e61-3047f93a5166)

* Bình luận sản phẩm.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/37425d57-356b-4351-a1b8-975db4f6fb2b)

* Cho phép khách hàng xem những đơn đặt hàng đã thanh toán online.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/3051159b-673c-45d9-826b-3478131c6ccf)

* Giao diện giỏ hàng.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/6b42d7dc-922b-43fb-bbe9-ed90ed9dd25a)

* Thanh toán online với paypal.
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/b8b59ae1-90b4-4d10-bb81-4935f55ebc94)
![image](https://github.com/vhuunghia196/SaleWeb/assets/76529425/b03e57f2-1062-4955-a529-22c1f687d9fe)























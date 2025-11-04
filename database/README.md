# 🚀 Hướng Dẫn Cài Đặt Database - Chaos Shop

## 📋 Yêu Cầu

- MySQL 8.0 hoặc cao hơn
- MySQL Workbench (tùy chọn, để quản lý database)

## 🔧 Cài Đặt Nhanh

### Bước 1: Tạo Database và Bảng

```bash
mysql -u root -p < schema.sql
```

Hoặc trong MySQL Workbench:
1. Mở file `schema.sql`
2. Chạy toàn bộ script (Ctrl + Shift + Enter)

### Bước 2: Import Dữ Liệu Mẫu

```bash
mysql -u root -p < init_data.sql
```

### Bước 3: Kiểm Tra

```sql
USE chaos_shop;

-- Kiểm tra số lượng bảng
SHOW TABLES;

-- Kiểm tra dữ liệu
SELECT * FROM roles;
SELECT * FROM users;
SELECT * FROM products LIMIT 5;
```

## 📊 Cấu Trúc Database

Database gồm **27 bảng** được chia thành 7 nhóm chức năng:

### 1. 🔐 Xác Thực & Phân Quyền (5 bảng)
- `roles` - Vai trò người dùng
- `users` - Thông tin người dùng
- `refresh_tokens` - Token làm mới
- `verification_tokens` - Mã xác thực email/reset password
- `login_history` - Lịch sử đăng nhập

### 2. 🛍️ Quản Lý Sản Phẩm (8 bảng)
- `categories` - Danh mục sản phẩm
- `brands` - Thương hiệu
- `products` - Sản phẩm
- `product_images` - Hình ảnh sản phẩm
- `attributes` - Thuộc tính (Size, Color, Material)
- `attribute_values` - Giá trị thuộc tính
- `product_variants` - Biến thể sản phẩm
- `variant_attributes` - Kết nối biến thể với thuộc tính

### 3. 👥 Quản Lý Khách Hàng (4 bảng)
- `customer_addresses` - Địa chỉ giao hàng
- `carts` - Giỏ hàng
- `cart_items` - Chi tiết giỏ hàng
- `wishlists` - Sản phẩm yêu thích

### 4. 📦 Quản Lý Đơn Hàng (3 bảng)
- `orders` - Đơn hàng
- `order_items` - Chi tiết đơn hàng
- `order_status_history` - Lịch sử trạng thái

### 5. 💳 Thanh Toán & Khuyến Mãi (2 bảng)
- `payment_transactions` - Giao dịch thanh toán
- `coupons` - Mã giảm giá

### 6. ⭐ Đánh Giá (1 bảng)
- `product_reviews` - Đánh giá sản phẩm

### 7. 🔔 Hệ Thống (2 bảng)
- `notifications` - Thông báo
- `admin_activity_logs` - Log hoạt động admin

## 👤 Tài Khoản Mẫu

| Email | Password | Role | Mô Tả |
|-------|----------|------|-------|
| admin@chaosshop.com | Admin@123 | admin | Quản trị viên |
| staff@chaosshop.com | Admin@123 | staff | Nhân viên |
| user1@gmail.com | Admin@123 | user | Khách hàng 1 |
| user2@gmail.com | Admin@123 | user | Khách hàng 2 |

⚠️ **Lưu ý:** Password hash trong database là mẫu. Khi implement backend, cần hash password thật bằng bcrypt.

## 📝 Dữ Liệu Mẫu Có Sẵn

- ✅ 3 vai trò (admin, staff, user)
- ✅ 4 người dùng
- ✅ 15 danh mục sản phẩm (có cấu trúc cha-con)
- ✅ 6 thương hiệu
- ✅ 10 sản phẩm
- ✅ 18 biến thể sản phẩm (với size và màu sắc)
- ✅ 4 mã giảm giá
- ✅ 3 đơn hàng mẫu (các trạng thái khác nhau)
- ✅ 2 đánh giá sản phẩm
- ✅ Giỏ hàng và địa chỉ mẫu

## 🔑 Các Chức Năng Chính

### 1. Authentication & Authorization
- ✅ Đăng ký/Đăng nhập
- ✅ JWT với Refresh Token
- ✅ Xác thực email
- ✅ Reset password
- ✅ Phân quyền theo role (admin/staff/user)
- ✅ Lịch sử đăng nhập

### 2. Quản Lý Sản Phẩm
- ✅ CRUD sản phẩm
- ✅ Danh mục đa cấp
- ✅ Thương hiệu
- ✅ Nhiều hình ảnh/sản phẩm
- ✅ Biến thể sản phẩm (size, màu sắc)
- ✅ Quản lý tồn kho theo biến thể
- ✅ Sản phẩm nổi bật
- ✅ SEO-friendly URL (slug)

### 3. Giỏ Hàng & Đặt Hàng
- ✅ Thêm/sửa/xóa giỏ hàng
- ✅ Nhiều địa chỉ giao hàng
- ✅ Tính phí ship
- ✅ Áp dụng mã giảm giá
- ✅ Nhiều phương thức thanh toán

### 4. Quản Lý Đơn Hàng
- ✅ 6 trạng thái đơn hàng
- ✅ Lịch sử thay đổi trạng thái
- ✅ Ghi chú đơn hàng
- ✅ Theo dõi giao dịch thanh toán

### 5. Khuyến Mãi
- ✅ Mã giảm giá (% hoặc số tiền)
- ✅ Điều kiện áp dụng
- ✅ Giới hạn số lần sử dụng
- ✅ Thời gian hiệu lực

### 6. Đánh Giá & Thông Báo
- ✅ Đánh giá sản phẩm (1-5 sao)
- ✅ Admin duyệt đánh giá
- ✅ Thông báo realtime
- ✅ Sản phẩm yêu thích

### 7. Admin & Bảo Mật
- ✅ Log mọi hoạt động admin
- ✅ Theo dõi IP và user agent
- ✅ Audit trail
- ✅ Quản lý người dùng

## 📚 Tài Liệu Chi Tiết

Xem file `DATABASE_DOCUMENTATION.md` để biết:
- Mô tả chi tiết từng bảng
- Các query thường dùng
- Best practices
- Hướng dẫn mở rộng

## 🔒 Bảo Mật

### Đã Implement
- ✅ Password hashing (bcrypt)
- ✅ Refresh token mechanism
- ✅ Email verification
- ✅ Login tracking
- ✅ Admin activity logs

### Cần Implement Ở Backend
- ⚠️ Rate limiting
- ⚠️ CSRF protection
- ⚠️ XSS prevention
- ⚠️ SQL injection prevention (dùng prepared statements)
- ⚠️ Input validation
- ⚠️ Password strength policy

## 🛠️ Maintenance

### Backup
```bash
# Backup toàn bộ database
mysqldump -u root -p chaos_shop > backup_$(date +%Y%m%d).sql

# Restore
mysql -u root -p chaos_shop < backup_20240101.sql
```

### Optimize
```sql
-- Analyze tables
ANALYZE TABLE products, orders, users;

-- Optimize tables
OPTIMIZE TABLE products, orders, users;
```

## 🐛 Troubleshooting

### Lỗi: "Access denied for user"
```bash
# Cấp quyền cho user
GRANT ALL PRIVILEGES ON chaos_shop.* TO 'your_user'@'localhost';
FLUSH PRIVILEGES;
```

### Lỗi: "Table doesn't exist"
```bash
# Chạy lại schema.sql
mysql -u root -p < schema.sql
```

### Reset Database
```bash
# Xóa và tạo lại
mysql -u root -p -e "DROP DATABASE IF EXISTS chaos_shop;"
mysql -u root -p < schema.sql
mysql -u root -p < init_data.sql
```

## 📞 Liên Hệ

Nếu gặp vấn đề, vui lòng tạo issue hoặc liên hệ team phát triển.

---

**Happy Coding! 🚀**

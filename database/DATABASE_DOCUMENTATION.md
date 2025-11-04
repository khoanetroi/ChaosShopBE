# 📚 CHAOS SHOP - TÀI LIỆU DATABASE

## 🎯 Tổng Quan Hệ Thống

Database **chaos_shop** được thiết kế hoàn chỉnh cho hệ thống bán quần áo trực tuyến với đầy đủ các tính năng:
- ✅ Xác thực & phân quyền (Authentication & Authorization)
- ✅ Quản lý sản phẩm & biến thể
- ✅ Giỏ hàng & đơn hàng
- ✅ Thanh toán & khuyến mãi
- ✅ Đánh giá sản phẩm
- ✅ Thông báo & log hoạt động

---

## 🔐 1. HỆ THỐNG XÁC THỰC & PHÂN QUYỀN

### 1.1. Bảng `roles` - Vai Trò Người Dùng

**Mục đích:** Quản lý các vai trò trong hệ thống

**Cấu trúc:**
- `role_id`: ID vai trò (Primary Key)
- `role_name`: Tên vai trò (admin, staff, user)
- `description`: Mô tả vai trò

**3 Vai Trò Chính:**

| Role ID | Role Name | Quyền Hạn |
|---------|-----------|-----------|
| 1 | admin | Toàn quyền quản trị hệ thống, quản lý user, sản phẩm, đơn hàng, cấu hình |
| 2 | staff | Quản lý sản phẩm, xử lý đơn hàng, xem báo cáo |
| 3 | user | Mua sắm, đặt hàng, đánh giá sản phẩm |

---

### 1.2. Bảng `users` - Người Dùng

**Mục đích:** Lưu trữ thông tin tài khoản người dùng

**Các trường quan trọng:**
- `user_id`: ID người dùng
- `email`: Email đăng nhập (unique)
- `password_hash`: Mật khẩu đã mã hóa (bcrypt)
- `full_name`: Họ tên đầy đủ
- `phone`: Số điện thoại
- `role_id`: Vai trò (FK → roles)
- `is_active`: Trạng thái kích hoạt
- `is_verified`: Đã xác thực email chưa
- `last_login`: Lần đăng nhập cuối

**Chức năng:**
- ✅ Đăng ký tài khoản mới
- ✅ Đăng nhập/Đăng xuất
- ✅ Xác thực email
- ✅ Phân quyền theo role
- ✅ Quản lý thông tin cá nhân

---

### 1.3. Bảng `refresh_tokens` - Token Làm Mới

**Mục đích:** Quản lý refresh token cho JWT authentication

**Cơ chế hoạt động:**
1. Khi user đăng nhập → Tạo access token (15-30 phút) + refresh token (7-30 ngày)
2. Access token hết hạn → Dùng refresh token để lấy access token mới
3. Refresh token có thể thu hồi (revoke) khi đăng xuất

**Các trường quan trọng:**
- `token`: Refresh token string (unique)
- `user_id`: ID người dùng
- `expires_at`: Thời gian hết hạn
- `is_revoked`: Đã thu hồi chưa
- `ip_address`: IP đăng nhập
- `user_agent`: Thông tin trình duyệt

**Bảo mật:**
- ✅ Mỗi user có thể có nhiều refresh token (đa thiết bị)
- ✅ Token có thời hạn
- ✅ Có thể thu hồi token khi cần
- ✅ Lưu IP và user agent để phát hiện bất thường

---

### 1.4. Bảng `verification_tokens` - Mã Xác Thực

**Mục đích:** Quản lý mã xác thực email và reset password

**2 Loại Token:**
1. **email_verification**: Xác thực email khi đăng ký
2. **password_reset**: Reset mật khẩu khi quên

**Quy trình:**
- Tạo token ngẫu nhiên → Gửi email → User click link → Verify token → Thực hiện hành động

---

### 1.5. Bảng `login_history` - Lịch Sử Đăng Nhập

**Mục đích:** Theo dõi lịch sử đăng nhập (thành công/thất bại)

**Ứng dụng:**
- Phát hiện đăng nhập bất thường
- Thống kê hoạt động user
- Bảo mật tài khoản

---

## 🛍️ 2. HỆ THỐNG QUẢN LÝ SẢN PHẨM

### 2.1. Bảng `categories` - Danh Mục Sản Phẩm

**Mục đích:** Phân loại sản phẩm theo cấu trúc cây

**Đặc điểm:**
- Hỗ trợ danh mục cha-con (parent_id)
- Có slug cho SEO-friendly URL
- Có thứ tự hiển thị (display_order)

**Ví dụ cấu trúc:**
```
Áo Nam (parent)
  ├── Áo Thun Nam (child)
  ├── Áo Sơ Mi Nam (child)
  └── Áo Khoác Nam (child)
```

---

### 2.2. Bảng `brands` - Thương Hiệu

**Mục đích:** Quản lý thương hiệu sản phẩm

**Ví dụ:** Nike, Adidas, Uniqlo, Zara, H&M, Local Brand

---

### 2.3. Bảng `products` - Sản Phẩm

**Mục đích:** Lưu thông tin chính của sản phẩm

**Các trường quan trọng:**
- `product_name`: Tên sản phẩm
- `slug`: URL thân thiện SEO
- `sku`: Mã sản phẩm
- `category_id`: Danh mục
- `brand_id`: Thương hiệu
- `base_price`: Giá gốc
- `sale_price`: Giá khuyến mãi
- `is_featured`: Sản phẩm nổi bật
- `view_count`: Lượt xem
- `sold_count`: Đã bán
- `rating_average`: Điểm đánh giá trung bình

**Chức năng:**
- ✅ Quản lý thông tin sản phẩm
- ✅ SEO optimization
- ✅ Thống kê lượt xem, đã bán
- ✅ Tính điểm đánh giá

---

### 2.4. Bảng `product_images` - Hình Ảnh Sản Phẩm

**Mục đích:** Lưu nhiều hình ảnh cho mỗi sản phẩm

**Đặc điểm:**
- Một sản phẩm có nhiều ảnh
- Có ảnh chính (is_primary)
- Có thứ tự hiển thị

---

### 2.5. Bảng `attributes` & `attribute_values` - Thuộc Tính

**Mục đích:** Định nghĩa các thuộc tính sản phẩm

**4 Loại Thuộc Tính:**
1. **Size**: S, M, L, XL, XXL
2. **Color**: Đen, Trắng, Xanh Navy, Đỏ, Xám...
3. **Material**: Cotton, Jean, Kaki, Polyester...
4. **Style**: Slim fit, Regular, Oversize...

---

### 2.6. Bảng `product_variants` - Biến Thể Sản Phẩm

**Mục đích:** Quản lý các phiên bản khác nhau của sản phẩm

**Ví dụ:**
- Áo Thun Basic → 12 biến thể (3 màu x 4 size)
- Mỗi biến thể có:
  - SKU riêng
  - Giá điều chỉnh (nếu có)
  - Số lượng tồn kho riêng

**Công thức giá:**
```
Giá biến thể = Giá sản phẩm + Giá điều chỉnh
```

---

### 2.7. Bảng `variant_attributes` - Kết Nối Biến Thể & Thuộc Tính

**Mục đích:** Liên kết biến thể với các thuộc tính cụ thể

**Ví dụ:**
```
Variant: "Áo Thun Basic - Size M - Màu Đen"
  → Size: M
  → Color: Đen
```

---

## 👥 3. HỆ THỐNG QUẢN LÝ KHÁCH HÀNG

### 3.1. Bảng `customer_addresses` - Địa Chỉ Giao Hàng

**Mục đích:** Lưu địa chỉ giao hàng của khách hàng

**Đặc điểm:**
- Một user có nhiều địa chỉ
- Có địa chỉ mặc định (is_default)
- Lưu đầy đủ: Tên người nhận, SĐT, địa chỉ, phường/xã, quận/huyện, tỉnh/thành

---

### 3.2. Bảng `carts` & `cart_items` - Giỏ Hàng

**Mục đích:** Quản lý giỏ hàng của khách hàng

**Cơ chế:**
- Mỗi user có 1 giỏ hàng
- Giỏ hàng chứa nhiều sản phẩm (cart_items)
- Mỗi item lưu: variant_id, quantity

**Chức năng:**
- ✅ Thêm sản phẩm vào giỏ
- ✅ Cập nhật số lượng
- ✅ Xóa sản phẩm
- ✅ Tính tổng tiền

---

### 3.3. Bảng `wishlists` - Sản Phẩm Yêu Thích

**Mục đích:** Lưu danh sách sản phẩm yêu thích

**Chức năng:**
- ✅ Thêm/xóa sản phẩm yêu thích
- ✅ Xem danh sách wishlist
- ✅ Chuyển từ wishlist sang giỏ hàng

---

## 📦 4. HỆ THỐNG QUẢN LÝ ĐƠN HÀNG

### 4.1. Bảng `orders` - Đơn Hàng

**Mục đích:** Lưu thông tin đơn hàng

**Các trường quan trọng:**
- `order_number`: Mã đơn hàng (unique)
- `user_id`: Khách hàng
- Thông tin người nhận (tên, SĐT, địa chỉ)
- `subtotal`: Tổng tiền hàng
- `shipping_fee`: Phí vận chuyển
- `discount_amount`: Giảm giá
- `total_amount`: Tổng thanh toán
- `order_status`: Trạng thái đơn hàng
- `payment_status`: Trạng thái thanh toán
- `payment_method`: Phương thức thanh toán

**6 Trạng Thái Đơn Hàng:**

| Status | Mô Tả | Hành Động |
|--------|-------|-----------|
| pending | Chờ xác nhận | Admin xác nhận đơn |
| confirmed | Đã xác nhận | Chuẩn bị hàng |
| processing | Đang xử lý | Đóng gói sản phẩm |
| shipping | Đang giao | Shipper đang giao |
| delivered | Đã giao | Hoàn thành |
| cancelled | Đã hủy | Đơn bị hủy |

**3 Trạng Thái Thanh Toán:**
- `pending`: Chưa thanh toán
- `paid`: Đã thanh toán
- `failed`: Thanh toán thất bại

**4 Phương Thức Thanh Toán:**
- `cod`: Thanh toán khi nhận hàng
- `bank_transfer`: Chuyển khoản ngân hàng
- `momo`: Ví MoMo
- `vnpay`: VNPay

---

### 4.2. Bảng `order_items` - Chi Tiết Đơn Hàng

**Mục đích:** Lưu các sản phẩm trong đơn hàng

**Đặc điểm:**
- Lưu snapshot thông tin sản phẩm tại thời điểm đặt hàng
- Tránh bị ảnh hưởng khi sản phẩm thay đổi giá/tên

---

### 4.3. Bảng `order_status_history` - Lịch Sử Trạng Thái

**Mục đích:** Theo dõi lịch sử thay đổi trạng thái đơn hàng

**Ứng dụng:**
- Xem timeline đơn hàng
- Kiểm tra ai đã thay đổi trạng thái
- Ghi chú lý do thay đổi

---

## 💳 5. HỆ THỐNG THANH TOÁN & KHUYẾN MÃI

### 5.1. Bảng `payment_transactions` - Giao Dịch Thanh Toán

**Mục đích:** Lưu lịch sử giao dịch thanh toán

**Chức năng:**
- ✅ Ghi nhận giao dịch
- ✅ Lưu mã giao dịch từ cổng thanh toán
- ✅ Theo dõi trạng thái thanh toán
- ✅ Đối soát giao dịch

---

### 5.2. Bảng `coupons` - Mã Giảm Giá

**Mục đích:** Quản lý mã khuyến mãi

**2 Loại Giảm Giá:**
1. **percentage**: Giảm theo % (VD: 10%, 20%)
2. **fixed_amount**: Giảm số tiền cố định (VD: 50.000đ)

**Các điều kiện:**
- `min_order_amount`: Giá trị đơn hàng tối thiểu
- `usage_limit`: Tổng số lần sử dụng
- `start_date`, `end_date`: Thời gian hiệu lực

**Ví dụ Coupon:**
```
WELCOME10: Giảm 10% cho khách mới
SUMMER50K: Giảm 50K cho đơn từ 500K
FREESHIP: Miễn phí ship cho đơn từ 300K
```

---

## ⭐ 6. HỆ THỐNG ĐÁNH GIÁ

### 6.1. Bảng `product_reviews` - Đánh Giá Sản Phẩm

**Mục đích:** Khách hàng đánh giá sản phẩm đã mua

**Điều kiện đánh giá:**
- Phải mua sản phẩm (có order_id)
- Đơn hàng đã giao thành công

**Các trường:**
- `rating`: Điểm đánh giá (1-5 sao)
- `comment`: Nội dung đánh giá
- `is_verified_purchase`: Mua hàng xác thực
- `is_approved`: Admin duyệt chưa

**Chức năng:**
- ✅ Đánh giá sản phẩm
- ✅ Admin duyệt đánh giá
- ✅ Tính điểm trung bình
- ✅ Hiển thị đánh giá đã duyệt

---

## 🔔 7. HỆ THỐNG THÔNG BÁO & LOG

### 7.1. Bảng `notifications` - Thông Báo

**Mục đích:** Gửi thông báo cho người dùng

**3 Loại Thông Báo:**
1. **order**: Thông báo về đơn hàng
2. **promotion**: Thông báo khuyến mãi
3. **system**: Thông báo hệ thống

**Ví dụ:**
- "Đơn hàng ORD20240001 đã được xác nhận"
- "Mã giảm giá SUMMER50K cho bạn"
- "Cập nhật điều khoản sử dụng"

---

### 7.2. Bảng `admin_activity_logs` - Log Hoạt Động Admin

**Mục đích:** Ghi nhận mọi hành động của Admin/Staff

**Ứng dụng:**
- Theo dõi ai làm gì, khi nào
- Audit trail cho bảo mật
- Khôi phục dữ liệu khi cần

**Ghi nhận:**
- User thực hiện
- Hành động (create, update, delete)
- Bảng và record bị tác động
- Giá trị cũ và mới (JSON)
- IP và user agent

---

## 🔧 8. HƯỚNG DẪN SỬ DỤNG

### 8.1. Cài Đặt Database

```bash
# 1. Tạo database và bảng
mysql -u root -p < schema.sql

# 2. Import dữ liệu mẫu
mysql -u root -p < init_data.sql
```

### 8.2. Tài Khoản Mẫu

| Email | Password | Role | Mô Tả |
|-------|----------|------|-------|
| admin@chaosshop.com | Admin@123 | admin | Quản trị viên |
| staff@chaosshop.com | Admin@123 | staff | Nhân viên |
| user1@gmail.com | Admin@123 | user | Khách hàng 1 |
| user2@gmail.com | Admin@123 | user | Khách hàng 2 |

⚠️ **Lưu ý:** Password hash trong file SQL là mẫu, cần thay bằng hash thật khi triển khai.

---

## 📊 9. CÁC QUERY THƯỜNG DÙNG

### 9.1. Lấy Sản Phẩm Với Biến Thể

```sql
SELECT 
    p.product_id,
    p.product_name,
    p.base_price,
    p.sale_price,
    pv.variant_id,
    pv.variant_name,
    pv.stock_quantity,
    pv.sku
FROM products p
LEFT JOIN product_variants pv ON p.product_id = pv.product_id
WHERE p.is_active = TRUE
    AND pv.is_active = TRUE
    AND pv.stock_quantity > 0;
```

### 9.2. Tính Tổng Giỏ Hàng

```sql
SELECT 
    c.cart_id,
    c.user_id,
    SUM(
        CASE 
            WHEN p.sale_price IS NOT NULL 
            THEN (p.sale_price + COALESCE(pv.price_adjustment, 0)) * ci.quantity
            ELSE (p.base_price + COALESCE(pv.price_adjustment, 0)) * ci.quantity
        END
    ) as total_amount
FROM carts c
JOIN cart_items ci ON c.cart_id = ci.cart_id
JOIN product_variants pv ON ci.variant_id = pv.variant_id
JOIN products p ON pv.product_id = p.product_id
WHERE c.user_id = ?
GROUP BY c.cart_id;
```

### 9.3. Thống Kê Đơn Hàng Theo Trạng Thái

```sql
SELECT 
    order_status,
    COUNT(*) as order_count,
    SUM(total_amount) as total_revenue
FROM orders
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY order_status;
```

### 9.4. Top Sản Phẩm Bán Chạy

```sql
SELECT 
    p.product_id,
    p.product_name,
    p.sold_count,
    p.rating_average,
    SUM(oi.quantity) as total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 10;
```

---

## 🔒 10. BẢO MẬT & TỐI ƯU

### 10.1. Bảo Mật

✅ **Đã Implement:**
- Password hash với bcrypt
- Refresh token mechanism
- Email verification
- Login history tracking
- Admin activity logs
- IP và user agent tracking

⚠️ **Cần Thêm:**
- Rate limiting cho login
- Two-factor authentication (2FA)
- Password policy (độ mạnh mật khẩu)
- Session timeout
- CSRF protection

### 10.2. Index Optimization

Database đã có các index quan trọng:
- Email, phone (unique index)
- Foreign keys
- Status fields
- Date fields
- Slug fields

### 10.3. Backup Strategy

Khuyến nghị:
- Daily backup toàn bộ database
- Hourly backup bảng orders, payment_transactions
- Lưu trữ backup ít nhất 30 ngày

---

## 📈 11. MỞ RỘNG TRONG TƯƠNG LAI

### Các Tính Năng Có Thể Thêm:

1. **Multi-warehouse**: Quản lý nhiều kho hàng
2. **Loyalty Program**: Chương trình tích điểm
3. **Flash Sale**: Giảm giá trong thời gian ngắn
4. **Product Bundles**: Combo sản phẩm
5. **Gift Cards**: Thẻ quà tặng
6. **Affiliate Program**: Tiếp thị liên kết
7. **Live Chat**: Hỗ trợ trực tuyến
8. **Product Recommendations**: Gợi ý sản phẩm AI
9. **Inventory Alerts**: Cảnh báo tồn kho
10. **Multi-language**: Đa ngôn ngữ

---

## 📞 12. HỖ TRỢ

Nếu có thắc mắc về database schema, vui lòng liên hệ team phát triển.

**Version:** 1.0.0  
**Last Updated:** 2024  
**Author:** Chaos Shop Development Team

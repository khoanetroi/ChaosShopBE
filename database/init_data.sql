-- ============================================
-- DỮ LIỆU KHỞI TẠO CHO CHAOS SHOP
-- ============================================

USE chaos_shop;

-- ============================================
-- 1. KHỞI TẠO VAI TRÒ (ROLES)
-- ============================================

INSERT INTO roles (role_id, role_name, description) VALUES
(1, 'admin', 'Quản trị viên hệ thống - Toàn quyền truy cập'),
(2, 'staff', 'Nhân viên - Quản lý đơn hàng và sản phẩm'),
(3, 'user', 'Khách hàng - Mua sắm và đặt hàng');

-- ============================================
-- 2. KHỞI TẠO NGƯỜI DÙNG MẪU
-- ============================================
-- Password mặc định: Admin@123 (đã hash bằng bcrypt)
-- Trong thực tế, bạn cần hash password bằng bcrypt với cost factor 10-12

INSERT INTO users (user_id, email, password_hash, full_name, phone, role_id, is_active, is_verified, email_verified_at) VALUES
-- Admin
(1, 'admin@chaosshop.com', '$2b$10$rKvVJKhGxQxmYZ4YvXxXXeYvXxXxXxXxXxXxXxXxXxXxXxXxXxXxX', 'Nguyễn Văn Admin', '0901234567', 1, TRUE, TRUE, NOW()),
-- Staff
(2, 'staff@chaosshop.com', '$2b$10$rKvVJKhGxQxmYZ4YvXxXXeYvXxXxXxXxXxXxXxXxXxXxXxXxXxXxX', 'Trần Thị Staff', '0902234567', 2, TRUE, TRUE, NOW()),
-- Users
(3, 'user1@gmail.com', '$2b$10$rKvVJKhGxQxmYZ4YvXxXXeYvXxXxXxXxXxXxXxXxXxXxXxXxXxXxX', 'Lê Văn User', '0903234567', 3, TRUE, TRUE, NOW()),
(4, 'user2@gmail.com', '$2b$10$rKvVJKhGxQxmYZ4YvXxXXeYvXxXxXxXxXxXxXxXxXxXxXxXxXxXxX', 'Phạm Thị Hoa', '0904234567', 3, TRUE, TRUE, NOW());

-- ============================================
-- 3. KHỞI TẠO DANH MỤC SẢN PHẨM
-- ============================================

INSERT INTO categories (category_id, category_name, slug, description, parent_id, is_active, display_order) VALUES
-- Danh mục cha
(1, 'Áo Nam', 'ao-nam', 'Các loại áo dành cho nam giới', NULL, TRUE, 1),
(2, 'Áo Nữ', 'ao-nu', 'Các loại áo dành cho nữ giới', NULL, TRUE, 2),
(3, 'Quần Nam', 'quan-nam', 'Các loại quần dành cho nam giới', NULL, TRUE, 3),
(4, 'Quần Nữ', 'quan-nu', 'Các loại quần dành cho nữ giới', NULL, TRUE, 4),
(5, 'Phụ Kiện', 'phu-kien', 'Phụ kiện thời trang', NULL, TRUE, 5),

-- Danh mục con - Áo Nam
(6, 'Áo Thun Nam', 'ao-thun-nam', 'Áo thun nam các loại', 1, TRUE, 1),
(7, 'Áo Sơ Mi Nam', 'ao-so-mi-nam', 'Áo sơ mi nam công sở', 1, TRUE, 2),
(8, 'Áo Khoác Nam', 'ao-khoac-nam', 'Áo khoác, jacket nam', 1, TRUE, 3),

-- Danh mục con - Áo Nữ
(9, 'Áo Thun Nữ', 'ao-thun-nu', 'Áo thun nữ các loại', 2, TRUE, 1),
(10, 'Áo Sơ Mi Nữ', 'ao-so-mi-nu', 'Áo sơ mi nữ công sở', 2, TRUE, 2),
(11, 'Áo Khoác Nữ', 'ao-khoac-nu', 'Áo khoác, jacket nữ', 2, TRUE, 3),

-- Danh mục con - Quần
(12, 'Quần Jean Nam', 'quan-jean-nam', 'Quần jean nam', 3, TRUE, 1),
(13, 'Quần Kaki Nam', 'quan-kaki-nam', 'Quần kaki nam', 3, TRUE, 2),
(14, 'Quần Jean Nữ', 'quan-jean-nu', 'Quần jean nữ', 4, TRUE, 1),
(15, 'Váy', 'vay', 'Váy các loại', 4, TRUE, 2);

-- ============================================
-- 4. KHỞI TẠO THƯƠNG HIỆU
-- ============================================

INSERT INTO brands (brand_id, brand_name, slug, description, is_active) VALUES
(1, 'Nike', 'nike', 'Thương hiệu thể thao nổi tiếng', TRUE),
(2, 'Adidas', 'adidas', 'Thương hiệu thể thao Đức', TRUE),
(3, 'Uniqlo', 'uniqlo', 'Thương hiệu thời trang Nhật Bản', TRUE),
(4, 'Zara', 'zara', 'Thương hiệu thời trang Tây Ban Nha', TRUE),
(5, 'H&M', 'h-m', 'Thương hiệu thời trang Thụy Điển', TRUE),
(6, 'Local Brand', 'local-brand', 'Thương hiệu Việt Nam', TRUE);

-- ============================================
-- 5. KHỞI TẠO THUỘC TÍNH SẢN PHẨM
-- ============================================

INSERT INTO attributes (attribute_id, attribute_name, attribute_type) VALUES
(1, 'Size', 'size'),
(2, 'Màu sắc', 'color'),
(3, 'Chất liệu', 'material'),
(4, 'Kiểu dáng', 'style');

-- Giá trị Size
INSERT INTO attribute_values (attribute_id, value_name) VALUES
(1, 'S'),
(1, 'M'),
(1, 'L'),
(1, 'XL'),
(1, 'XXL');

-- Giá trị Màu sắc
INSERT INTO attribute_values (attribute_id, value_name, color_code) VALUES
(2, 'Đen', '#000000'),
(2, 'Trắng', '#FFFFFF'),
(2, 'Xanh Navy', '#000080'),
(2, 'Xanh Dương', '#0000FF'),
(2, 'Đỏ', '#FF0000'),
(2, 'Xám', '#808080'),
(2, 'Be', '#F5F5DC'),
(2, 'Nâu', '#8B4513');

-- Giá trị Chất liệu
INSERT INTO attribute_values (attribute_id, value_name) VALUES
(3, 'Cotton 100%'),
(3, 'Cotton pha'),
(3, 'Kaki'),
(3, 'Jean'),
(3, 'Vải thun'),
(3, 'Polyester');

-- ============================================
-- 6. KHỞI TẠO SẢN PHẨM MẪU
-- ============================================

INSERT INTO products (product_id, product_name, slug, sku, category_id, brand_id, description, base_price, sale_price, is_active, is_featured) VALUES
-- Áo thun nam
(1, 'Áo Thun Nam Basic Cotton', 'ao-thun-nam-basic-cotton', 'ATN001', 6, 3, 'Áo thun nam basic chất liệu cotton 100% thoáng mát, form regular fit phù hợp mọi vóc dáng', 199000, 149000, TRUE, TRUE),
(2, 'Áo Thun Nam Polo', 'ao-thun-nam-polo', 'ATN002', 6, 1, 'Áo thun polo nam cao cấp, thiết kế thể thao năng động', 299000, 249000, TRUE, TRUE),
(3, 'Áo Thun Nam Oversize', 'ao-thun-nam-oversize', 'ATN003', 6, 6, 'Áo thun oversize form rộng theo phong cách streetwear', 249000, NULL, TRUE, FALSE),

-- Áo sơ mi nam
(4, 'Áo Sơ Mi Nam Công Sở', 'ao-so-mi-nam-cong-so', 'ASM001', 7, 4, 'Áo sơ mi nam công sở chất liệu kaki cao cấp, không nhăn', 399000, 349000, TRUE, TRUE),
(5, 'Áo Sơ Mi Nam Oxford', 'ao-so-mi-nam-oxford', 'ASM002', 7, 3, 'Áo sơ mi nam vải oxford dày dặn, form slim fit', 449000, NULL, TRUE, FALSE),

-- Quần jean nam
(6, 'Quần Jean Nam Slim Fit', 'quan-jean-nam-slim-fit', 'QJN001', 12, 2, 'Quần jean nam form slim fit ôm vừa vặn, co giãn tốt', 499000, 399000, TRUE, TRUE),
(7, 'Quần Jean Nam Regular', 'quan-jean-nam-regular', 'QJN002', 12, 6, 'Quần jean nam form regular thoải mái, phong cách basic', 449000, 399000, TRUE, FALSE),

-- Áo thun nữ
(8, 'Áo Thun Nữ Basic', 'ao-thun-nu-basic', 'ATN004', 9, 5, 'Áo thun nữ basic cotton mềm mại, nhiều màu sắc', 179000, 149000, TRUE, TRUE),
(9, 'Áo Thun Nữ Croptop', 'ao-thun-nu-croptop', 'ATN005', 9, 4, 'Áo thun nữ croptop trẻ trung, năng động', 199000, NULL, TRUE, TRUE),

-- Quần jean nữ
(10, 'Quần Jean Nữ Skinny', 'quan-jean-nu-skinny', 'QJN003', 14, 4, 'Quần jean nữ skinny ôm dáng, tôn chân', 449000, 399000, TRUE, TRUE);

-- ============================================
-- 7. KHỞI TẠO HÌNH ẢNH SẢN PHẨM
-- ============================================

INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
-- Áo thun nam basic
(1, '/images/products/ao-thun-nam-basic-1.jpg', TRUE, 1),
(1, '/images/products/ao-thun-nam-basic-2.jpg', FALSE, 2),
(1, '/images/products/ao-thun-nam-basic-3.jpg', FALSE, 3),

-- Áo polo
(2, '/images/products/ao-polo-nam-1.jpg', TRUE, 1),
(2, '/images/products/ao-polo-nam-2.jpg', FALSE, 2),

-- Áo oversize
(3, '/images/products/ao-oversize-1.jpg', TRUE, 1),
(3, '/images/products/ao-oversize-2.jpg', FALSE, 2),

-- Áo sơ mi công sở
(4, '/images/products/ao-so-mi-cong-so-1.jpg', TRUE, 1),
(4, '/images/products/ao-so-mi-cong-so-2.jpg', FALSE, 2);

-- ============================================
-- 8. KHỞI TẠO BIẾN THỂ SẢN PHẨM
-- ============================================

-- Áo thun nam basic - Size S, M, L, XL x Màu Đen, Trắng, Xám
INSERT INTO product_variants (product_id, sku, variant_name, stock_quantity, is_active) VALUES
-- Size S
(1, 'ATN001-S-BLACK', 'Size S - Đen', 50, TRUE),
(1, 'ATN001-S-WHITE', 'Size S - Trắng', 50, TRUE),
(1, 'ATN001-S-GREY', 'Size S - Xám', 30, TRUE),
-- Size M
(1, 'ATN001-M-BLACK', 'Size M - Đen', 100, TRUE),
(1, 'ATN001-M-WHITE', 'Size M - Trắng', 100, TRUE),
(1, 'ATN001-M-GREY', 'Size M - Xám', 80, TRUE),
-- Size L
(1, 'ATN001-L-BLACK', 'Size L - Đen', 80, TRUE),
(1, 'ATN001-L-WHITE', 'Size L - Trắng', 80, TRUE),
(1, 'ATN001-L-GREY', 'Size L - Xám', 60, TRUE),
-- Size XL
(1, 'ATN001-XL-BLACK', 'Size XL - Đen', 50, TRUE),
(1, 'ATN001-XL-WHITE', 'Size XL - Trắng', 50, TRUE),
(1, 'ATN001-XL-GREY', 'Size XL - Xám', 40, TRUE);

-- Áo polo - Size M, L, XL x Màu Navy, Đen
INSERT INTO product_variants (product_id, sku, variant_name, stock_quantity, is_active) VALUES
(2, 'ATN002-M-NAVY', 'Size M - Navy', 60, TRUE),
(2, 'ATN002-M-BLACK', 'Size M - Đen', 60, TRUE),
(2, 'ATN002-L-NAVY', 'Size L - Navy', 80, TRUE),
(2, 'ATN002-L-BLACK', 'Size L - Đen', 80, TRUE),
(2, 'ATN002-XL-NAVY', 'Size XL - Navy', 40, TRUE),
(2, 'ATN002-XL-BLACK', 'Size XL - Đen', 40, TRUE);

-- ============================================
-- 9. KHỞI TẠO MÃ GIẢM GIÁ
-- ============================================

INSERT INTO coupons (coupon_code, coupon_name, discount_type, discount_value, min_order_amount, usage_limit, start_date, end_date, is_active) VALUES
('WELCOME10', 'Giảm 10% cho khách hàng mới', 'percentage', 10.00, 0, 1000, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY), TRUE),
('SUMMER50K', 'Giảm 50K cho đơn từ 500K', 'fixed_amount', 50000.00, 500000, 500, NOW(), DATE_ADD(NOW(), INTERVAL 60 DAY), TRUE),
('FREESHIP', 'Miễn phí vận chuyển', 'fixed_amount', 30000.00, 300000, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 90 DAY), TRUE),
('VIP20', 'Giảm 20% cho khách VIP', 'percentage', 20.00, 1000000, 100, NOW(), DATE_ADD(NOW(), INTERVAL 365 DAY), TRUE);

-- ============================================
-- 10. KHỞI TẠO ĐỊA CHỈ KHÁCH HÀNG MẪU
-- ============================================

INSERT INTO customer_addresses (user_id, recipient_name, phone, address_line, ward, district, city, is_default) VALUES
(3, 'Lê Văn User', '0903234567', '123 Đường Lê Lợi', 'Phường Bến Thành', 'Quận 1', 'TP. Hồ Chí Minh', TRUE),
(3, 'Lê Văn User', '0903234567', '456 Đường Nguyễn Huệ', 'Phường Bến Nghé', 'Quận 1', 'TP. Hồ Chí Minh', FALSE),
(4, 'Phạm Thị Hoa', '0904234567', '789 Đường Trần Hưng Đạo', 'Phường Cầu Kho', 'Quận 1', 'TP. Hồ Chí Minh', TRUE);

-- ============================================
-- 11. KHỞI TẠO GIỎ HÀNG MẪU
-- ============================================

INSERT INTO carts (user_id) VALUES (3), (4);

INSERT INTO cart_items (cart_id, variant_id, quantity) VALUES
(1, 1, 2),  -- User 3: 2 áo thun đen size S
(1, 4, 1),  -- User 3: 1 áo thun đen size M
(2, 13, 1); -- User 4: 1 áo polo navy size M

-- ============================================
-- 12. KHỞI TẠO ĐƠN HÀNG MẪU
-- ============================================

INSERT INTO orders (order_number, user_id, recipient_name, recipient_phone, shipping_address, district, city, 
                    subtotal, shipping_fee, discount_amount, total_amount, order_status, payment_status, payment_method, order_date) VALUES
('ORD20240001', 3, 'Lê Văn User', '0903234567', '123 Đường Lê Lợi, Phường Bến Thành', 'Quận 1', 'TP. Hồ Chí Minh',
 298000, 30000, 0, 328000, 'delivered', 'paid', 'cod', DATE_SUB(NOW(), INTERVAL 10 DAY)),
 
('ORD20240002', 4, 'Phạm Thị Hoa', '0904234567', '789 Đường Trần Hưng Đạo, Phường Cầu Kho', 'Quận 1', 'TP. Hồ Chí Minh',
 498000, 30000, 50000, 478000, 'shipping', 'paid', 'bank_transfer', DATE_SUB(NOW(), INTERVAL 2 DAY)),
 
('ORD20240003', 3, 'Lê Văn User', '0903234567', '123 Đường Lê Lợi, Phường Bến Thành', 'Quận 1', 'TP. Hồ Chí Minh',
 447000, 30000, 0, 477000, 'confirmed', 'pending', 'cod', DATE_SUB(NOW(), INTERVAL 1 DAY));

-- Chi tiết đơn hàng
INSERT INTO order_items (order_id, product_id, variant_id, product_name, variant_name, quantity, unit_price, subtotal) VALUES
-- Đơn 1
(1, 1, 1, 'Áo Thun Nam Basic Cotton', 'Size S - Đen', 2, 149000, 298000),

-- Đơn 2
(2, 2, 13, 'Áo Thun Nam Polo', 'Size M - Navy', 2, 249000, 498000),

-- Đơn 3
(3, 1, 4, 'Áo Thun Nam Basic Cotton', 'Size M - Đen', 3, 149000, 447000);

-- ============================================
-- 13. KHỞI TẠO ĐÁNH GIÁ SẢN PHẨM
-- ============================================

INSERT INTO product_reviews (product_id, user_id, order_id, rating, comment, is_approved) VALUES
(1, 3, 1, 5, 'Áo đẹp, chất lượng tốt, giá cả hợp lý. Sẽ ủng hộ shop lâu dài!', TRUE),
(2, 4, 2, 4, 'Áo polo đẹp, nhưng hơi nhỏ so với size. Nên order lên 1 size.', TRUE);

-- ============================================
-- 14. CẬP NHẬT THỐNG KÊ SẢN PHẨM
-- ============================================

UPDATE products SET 
    sold_count = 5,
    rating_average = 5.00,
    view_count = 150
WHERE product_id = 1;

UPDATE products SET 
    sold_count = 2,
    rating_average = 4.00,
    view_count = 80
WHERE product_id = 2;

-- ============================================
-- 15. THÔNG BÁO MẪU
-- ============================================

INSERT INTO notifications (user_id, title, message, notification_type, is_read) VALUES
(3, 'Đơn hàng đã giao thành công', 'Đơn hàng ORD20240001 đã được giao thành công. Cảm ơn bạn đã mua hàng!', 'order', TRUE),
(3, 'Đơn hàng mới đã được xác nhận', 'Đơn hàng ORD20240003 đã được xác nhận và đang được xử lý.', 'order', FALSE),
(4, 'Đơn hàng đang được giao', 'Đơn hàng ORD20240002 đang trên đường giao đến bạn.', 'order', FALSE),
(4, 'Mã giảm giá mới', 'Nhập mã SUMMER50K để được giảm 50K cho đơn hàng từ 500K!', 'promotion', FALSE);

-- ============================================
-- HOÀN TẤT
-- ============================================

SELECT 'Database initialization completed successfully!' AS status;

-- ============================================
-- ENHANCED SAMPLE DATA FOR CHAOSSHOP
-- More products for better demo experience
-- ============================================

USE chaos_shop;

-- ============================================
-- ADDITIONAL CATEGORIES (English for frontend)
-- ============================================

INSERT INTO categories (category_name, slug, description, parent_id, is_active, display_order) VALUES
('Electronics', 'electronics', 'Electronic devices and gadgets', NULL, TRUE, 10),
('Clothing', 'clothing', 'Fashion and apparel', NULL, TRUE, 11),
('Accessories', 'accessories', 'Fashion accessories', NULL, TRUE, 12),
('Home', 'home', 'Home and living', NULL, TRUE, 13);

-- ============================================
-- ADDITIONAL BRANDS
-- ============================================

INSERT INTO brands (brand_name, slug, description, is_active) VALUES
('Apple', 'apple', 'Premium technology brand', TRUE),
('Samsung', 'samsung', 'Korean electronics giant', TRUE),
('Sony', 'sony', 'Japanese electronics', TRUE),
('Bose', 'bose', 'Premium audio equipment', TRUE),
('IKEA', 'ikea', 'Swedish furniture and home', TRUE);

-- ============================================
-- SAMPLE PRODUCTS - ELECTRONICS
-- ============================================

INSERT INTO products (product_name, slug, sku, description, category_id, brand_id, base_price, sale_price, is_active, is_featured, view_count, sold_count, rating_average, rating_count) VALUES
-- Electronics
('Premium Wireless Headphones', 'premium-wireless-headphones', 'ELEC-001', 'Experience crystal-clear audio with our premium wireless headphones. Features active noise cancellation, 30-hour battery life, and premium comfort padding.', 
(SELECT category_id FROM categories WHERE slug = 'electronics'), 
(SELECT brand_id FROM brands WHERE slug = 'bose'), 
299.99, 249.99, TRUE, TRUE, 1250, 89, 4.8, 156),

('Smart Watch Pro', 'smart-watch-pro', 'ELEC-002', 'Stay connected with our latest smartwatch. Track your fitness, receive notifications, and monitor your health with advanced sensors.',
(SELECT category_id FROM categories WHERE slug = 'electronics'),
(SELECT brand_id FROM brands WHERE slug = 'apple'),
399.99, 349.99, TRUE, TRUE, 2100, 145, 4.6, 203),

('Wireless Earbuds', 'wireless-earbuds', 'ELEC-003', 'Compact wireless earbuds with superior sound quality. Includes charging case with 24-hour battery life.',
(SELECT category_id FROM categories WHERE slug = 'electronics'),
(SELECT brand_id FROM brands WHERE slug = 'sony'),
149.99, NULL, TRUE, TRUE, 890, 67, 4.5, 98),

('Bluetooth Speaker', 'bluetooth-speaker', 'ELEC-004', 'Portable Bluetooth speaker with 360-degree sound. Waterproof design perfect for outdoor adventures.',
(SELECT category_id FROM categories WHERE slug = 'electronics'),
(SELECT brand_id FROM brands WHERE slug = 'bose'),
79.99, 69.99, TRUE, FALSE, 456, 34, 4.5, 67),

('4K Smart TV 55 inch', '4k-smart-tv-55', 'ELEC-005', 'Ultra HD 4K Smart TV with HDR support. Built-in streaming apps and voice control.',
(SELECT category_id FROM categories WHERE slug = 'electronics'),
(SELECT brand_id FROM brands WHERE slug = 'samsung'),
799.99, 699.99, TRUE, TRUE, 678, 23, 4.7, 45),

('Laptop Pro 15 inch', 'laptop-pro-15', 'ELEC-006', 'Powerful laptop for professionals. Intel i7, 16GB RAM, 512GB SSD, dedicated graphics.',
(SELECT category_id FROM categories WHERE slug = 'electronics'),
(SELECT brand_id FROM brands WHERE slug = 'apple'),
1299.99, 1199.99, TRUE, FALSE, 890, 12, 4.9, 34),

-- Clothing
('Designer Leather Jacket', 'designer-leather-jacket', 'CLOTH-001', 'Premium genuine leather jacket with modern styling. Perfect for any occasion, combining comfort with timeless fashion.',
(SELECT category_id FROM categories WHERE slug = 'clothing'),
(SELECT brand_id FROM brands WHERE slug = 'zara'),
249.99, 199.99, TRUE, TRUE, 567, 45, 4.9, 78),

('Classic Denim Jeans', 'classic-denim-jeans', 'CLOTH-002', 'Comfortable and durable denim jeans with a classic fit. Made from premium cotton blend for all-day comfort.',
(SELECT category_id FROM categories WHERE slug = 'clothing'),
(SELECT brand_id FROM brands WHERE slug = 'h-m'),
79.99, 59.99, TRUE, FALSE, 890, 123, 4.4, 156),

('Premium Cotton T-Shirt', 'premium-cotton-tshirt', 'CLOTH-003', 'Soft and breathable cotton t-shirt. Available in multiple colors with a comfortable regular fit.',
(SELECT category_id FROM categories WHERE slug = 'clothing'),
(SELECT brand_id FROM brands WHERE slug = 'uniqlo'),
39.99, 29.99, TRUE, TRUE, 1234, 234, 4.3, 289),

('Casual Hoodie', 'casual-hoodie', 'CLOTH-004', 'Comfortable hoodie perfect for casual wear. Soft fleece interior and adjustable drawstring hood.',
(SELECT category_id FROM categories WHERE slug = 'clothing'),
(SELECT brand_id FROM brands WHERE slug = 'nike'),
89.99, NULL, TRUE, FALSE, 456, 67, 4.6, 89),

('Sports Running Shoes', 'sports-running-shoes', 'CLOTH-005', 'Lightweight running shoes with cushioned sole. Breathable mesh upper for maximum comfort.',
(SELECT category_id FROM categories WHERE slug = 'clothing'),
(SELECT brand_id FROM brands WHERE slug = 'adidas'),
129.99, 99.99, TRUE, TRUE, 789, 89, 4.7, 123),

-- Accessories
('Minimalist Backpack', 'minimalist-backpack', 'ACC-001', 'Sleek and functional backpack perfect for work or travel. Water-resistant material with multiple compartments.',
(SELECT category_id FROM categories WHERE slug = 'accessories'),
(SELECT brand_id FROM brands WHERE slug = 'local-brand'),
89.99, 79.99, TRUE, TRUE, 567, 78, 4.7, 98),

('Luxury Sunglasses', 'luxury-sunglasses', 'ACC-002', 'Designer sunglasses with UV protection. Stylish frames that complement any outfit.',
(SELECT category_id FROM categories WHERE slug = 'accessories'),
(SELECT brand_id FROM brands WHERE slug = 'zara'),
199.99, 149.99, TRUE, FALSE, 345, 45, 4.8, 67),

('Stainless Steel Water Bottle', 'stainless-steel-water-bottle', 'ACC-003', 'Insulated water bottle keeps drinks cold for 24 hours or hot for 12 hours. Leak-proof and eco-friendly.',
(SELECT category_id FROM categories WHERE slug = 'accessories'),
(SELECT brand_id FROM brands WHERE slug = 'local-brand'),
34.99, 29.99, TRUE, TRUE, 678, 123, 4.7, 145),

('Leather Wallet', 'leather-wallet', 'ACC-004', 'Genuine leather wallet with RFID protection. Multiple card slots and bill compartment.',
(SELECT category_id FROM categories WHERE slug = 'accessories'),
(SELECT brand_id FROM brands WHERE slug = 'local-brand'),
49.99, NULL, TRUE, FALSE, 234, 56, 4.5, 78),

('Smart Fitness Band', 'smart-fitness-band', 'ACC-005', 'Track your activity, heart rate, and sleep. Water-resistant with 7-day battery life.',
(SELECT category_id FROM categories WHERE slug = 'accessories'),
(SELECT brand_id FROM brands WHERE slug = 'samsung'),
79.99, 59.99, TRUE, FALSE, 456, 67, 4.4, 89),

-- Home
('Modern Table Lamp', 'modern-table-lamp', 'HOME-001', 'Elegant table lamp with adjustable brightness. Perfect for reading or creating ambiance in any room.',
(SELECT category_id FROM categories WHERE slug = 'home'),
(SELECT brand_id FROM brands WHERE slug = 'ikea'),
129.99, 99.99, TRUE, TRUE, 345, 45, 4.6, 67),

('Decorative Throw Pillows', 'decorative-throw-pillows', 'HOME-002', 'Set of 2 premium throw pillows with removable covers. Add comfort and style to any living space.',
(SELECT category_id FROM categories WHERE slug = 'home'),
(SELECT brand_id FROM brands WHERE slug = 'ikea'),
49.99, 39.99, TRUE, FALSE, 567, 89, 4.4, 123),

('Ceramic Coffee Mug Set', 'ceramic-coffee-mug-set', 'HOME-003', 'Set of 4 elegant ceramic mugs. Microwave and dishwasher safe. Perfect for coffee or tea.',
(SELECT category_id FROM categories WHERE slug = 'home'),
(SELECT brand_id FROM brands WHERE slug = 'ikea'),
29.99, NULL, TRUE, FALSE, 234, 67, 4.3, 89),

('Wall Art Canvas', 'wall-art-canvas', 'HOME-004', 'Modern abstract canvas art. Ready to hang, adds personality to any room.',
(SELECT category_id FROM categories WHERE slug = 'home'),
(SELECT brand_id FROM brands WHERE slug = 'local-brand'),
79.99, 59.99, TRUE, FALSE, 345, 34, 4.5, 56),

('Aromatherapy Diffuser', 'aromatherapy-diffuser', 'HOME-005', 'Ultrasonic essential oil diffuser with LED lights. Creates a relaxing atmosphere in your home.',
(SELECT category_id FROM categories WHERE slug = 'home'),
(SELECT brand_id FROM brands WHERE slug = 'local-brand'),
39.99, 34.99, TRUE, TRUE, 456, 78, 4.6, 98);

-- ============================================
-- PRODUCT IMAGES
-- ============================================

-- Electronics Images
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
-- Premium Wireless Headphones
((SELECT product_id FROM products WHERE sku = 'ELEC-001'), 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800', TRUE, 1),
((SELECT product_id FROM products WHERE sku = 'ELEC-001'), 'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=800', FALSE, 2),

-- Smart Watch Pro
((SELECT product_id FROM products WHERE sku = 'ELEC-002'), 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800', TRUE, 1),
((SELECT product_id FROM products WHERE sku = 'ELEC-002'), 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=800', FALSE, 2),

-- Wireless Earbuds
((SELECT product_id FROM products WHERE sku = 'ELEC-003'), 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=800', TRUE, 1),
((SELECT product_id FROM products WHERE sku = 'ELEC-003'), 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=800', FALSE, 2),

-- Bluetooth Speaker
((SELECT product_id FROM products WHERE sku = 'ELEC-004'), 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=800', TRUE, 1),

-- 4K Smart TV
((SELECT product_id FROM products WHERE sku = 'ELEC-005'), 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=800', TRUE, 1),

-- Laptop Pro
((SELECT product_id FROM products WHERE sku = 'ELEC-006'), 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800', TRUE, 1),

-- Clothing Images
-- Designer Leather Jacket
((SELECT product_id FROM products WHERE sku = 'CLOTH-001'), 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=800', TRUE, 1),
((SELECT product_id FROM products WHERE sku = 'CLOTH-001'), 'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=800', FALSE, 2),

-- Classic Denim Jeans
((SELECT product_id FROM products WHERE sku = 'CLOTH-002'), 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=800', TRUE, 1),

-- Premium Cotton T-Shirt
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800', TRUE, 1),

-- Casual Hoodie
((SELECT product_id FROM products WHERE sku = 'CLOTH-004'), 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=800', TRUE, 1),

-- Sports Running Shoes
((SELECT product_id FROM products WHERE sku = 'CLOTH-005'), 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800', TRUE, 1),

-- Accessories Images
-- Minimalist Backpack
((SELECT product_id FROM products WHERE sku = 'ACC-001'), 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=800', TRUE, 1),

-- Luxury Sunglasses
((SELECT product_id FROM products WHERE sku = 'ACC-002'), 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800', TRUE, 1),

-- Stainless Steel Water Bottle
((SELECT product_id FROM products WHERE sku = 'ACC-003'), 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=800', TRUE, 1),

-- Leather Wallet
((SELECT product_id FROM products WHERE sku = 'ACC-004'), 'https://images.unsplash.com/photo-1627123424574-724758594e93?w=800', TRUE, 1),

-- Smart Fitness Band
((SELECT product_id FROM products WHERE sku = 'ACC-005'), 'https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?w=800', TRUE, 1),

-- Home Images
-- Modern Table Lamp
((SELECT product_id FROM products WHERE sku = 'HOME-001'), 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=800', TRUE, 1),

-- Decorative Throw Pillows
((SELECT product_id FROM products WHERE sku = 'HOME-002'), 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=800', TRUE, 1),

-- Ceramic Coffee Mug Set
((SELECT product_id FROM products WHERE sku = 'HOME-003'), 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=800', TRUE, 1),

-- Wall Art Canvas
((SELECT product_id FROM products WHERE sku = 'HOME-004'), 'https://images.unsplash.com/photo-1561214115-f2f134cc4912?w=800', TRUE, 1),

-- Aromatherapy Diffuser
((SELECT product_id FROM products WHERE sku = 'HOME-005'), 'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=800', TRUE, 1);

-- ============================================
-- PRODUCT VARIANTS (Simple variants for demo)
-- ============================================

-- Add basic variants for some products
INSERT INTO product_variants (product_id, sku, variant_name, price_adjustment, stock_quantity, is_active) VALUES
-- Headphones colors
((SELECT product_id FROM products WHERE sku = 'ELEC-001'), 'ELEC-001-BLACK', 'Black', 0, 50, TRUE),
((SELECT product_id FROM products WHERE sku = 'ELEC-001'), 'ELEC-001-WHITE', 'White', 0, 30, TRUE),
((SELECT product_id FROM products WHERE sku = 'ELEC-001'), 'ELEC-001-SILVER', 'Silver', 10, 20, TRUE),

-- Smart Watch sizes
((SELECT product_id FROM products WHERE sku = 'ELEC-002'), 'ELEC-002-40MM', '40mm', 0, 40, TRUE),
((SELECT product_id FROM products WHERE sku = 'ELEC-002'), 'ELEC-002-44MM', '44mm', 50, 35, TRUE),

-- T-Shirt sizes and colors
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-S-BLACK', 'Size S - Black', 0, 100, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-M-BLACK', 'Size M - Black', 0, 150, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-L-BLACK', 'Size L - Black', 0, 120, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-S-WHITE', 'Size S - White', 0, 80, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-M-WHITE', 'Size M - White', 0, 130, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-003'), 'CLOTH-003-L-WHITE', 'Size L - White', 0, 100, TRUE),

-- Jeans sizes
((SELECT product_id FROM products WHERE sku = 'CLOTH-002'), 'CLOTH-002-30', 'Waist 30', 0, 50, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-002'), 'CLOTH-002-32', 'Waist 32', 0, 70, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-002'), 'CLOTH-002-34', 'Waist 34', 0, 60, TRUE),
((SELECT product_id FROM products WHERE sku = 'CLOTH-002'), 'CLOTH-002-36', 'Waist 36', 0, 40, TRUE),

-- Backpack colors
((SELECT product_id FROM products WHERE sku = 'ACC-001'), 'ACC-001-BLACK', 'Black', 0, 60, TRUE),
((SELECT product_id FROM products WHERE sku = 'ACC-001'), 'ACC-001-GRAY', 'Gray', 0, 45, TRUE),
((SELECT product_id FROM products WHERE sku = 'ACC-001'), 'ACC-001-NAVY', 'Navy Blue', 5, 30, TRUE);

-- ============================================
-- SUCCESS MESSAGE
-- ============================================

SELECT 'Sample data inserted successfully!' AS Status,
       (SELECT COUNT(*) FROM products) AS Total_Products,
       (SELECT COUNT(*) FROM product_images) AS Total_Images,
       (SELECT COUNT(*) FROM product_variants) AS Total_Variants;

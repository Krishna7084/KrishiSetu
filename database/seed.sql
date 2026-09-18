-- ============================================================
-- KrishiSetu — Sample Seed Data (for demo/testing)
-- Run AFTER schema.sql
-- ============================================================

-- Users
INSERT INTO users (full_name, phone, email, password_hash, role, village, district, state, kyc_verified, trust_score)
VALUES
('Ramesh Yadav', '9990001111', 'ramesh@example.com', 'demo_hash', 'farmer', 'Barhalganj', 'Gorakhpur', 'Uttar Pradesh', TRUE, 4.5),
('Sita Devi', '9990002222', 'sita@example.com', 'demo_hash', 'farmer', 'Campierganj', 'Gorakhpur', 'Uttar Pradesh', TRUE, 4.2),
('Aarav Sharma', '9990003333', 'aarav@example.com', 'demo_hash', 'buyer', NULL, 'Lucknow', 'Uttar Pradesh', TRUE, 4.8),
('Green Basket Retail', '9990004444', 'contact@greenbasket.com', 'demo_hash', 'buyer', NULL, 'Lucknow', 'Uttar Pradesh', TRUE, 4.6),
('FastTrack Logistics', '9990005555', 'ops@fasttrack.com', 'demo_hash', 'logistics_partner', NULL, 'Gorakhpur', 'Uttar Pradesh', TRUE, 4.3),
('Admin User', '9990006666', 'admin@krishisetu.com', 'demo_hash', 'admin', NULL, NULL, NULL, TRUE, 5.0);

-- Produce Listings
INSERT INTO produce_listings (farmer_id, crop_name, quantity_kg, quality_grade, price_per_kg, harvest_date, status)
VALUES
(1, 'Tomato', 500, 'A', 22.50, '2026-09-10', 'available'),
(1, 'Potato', 800, 'B', 15.00, '2026-09-05', 'available'),
(2, 'Onion', 600, 'A', 28.00, '2026-09-12', 'available');

-- Orders
INSERT INTO orders (listing_id, buyer_id, quantity_kg, total_price, status, tracking_id)
VALUES
(1, 3, 50, 1125.00, 'confirmed', 'KS-TRK-0001'),
(3, 4, 100, 2800.00, 'pending', 'KS-TRK-0002');

-- Payments (escrow)
INSERT INTO payments (order_id, amount, status, transaction_id)
VALUES
(1, 1125.00, 'held', 'RZP_TEST_0001'),
(2, 2800.00, 'held', 'RZP_TEST_0002');

-- Logistics Jobs
INSERT INTO logistics_jobs (order_id, partner_id, pickup_point, drop_point, status)
VALUES
(1, 5, 'Barhalganj Collection Centre', 'Lucknow Hub - Aarav Sharma', 'assigned');

-- Price History (sample, for AI model training)
INSERT INTO price_history (crop_name, mandi_name, region, price_date, price_per_kg, source)
VALUES
('Tomato', 'Gorakhpur Mandi', 'Uttar Pradesh', '2026-09-01', 20.00, 'agmarknet'),
('Tomato', 'Gorakhpur Mandi', 'Uttar Pradesh', '2026-09-08', 21.50, 'agmarknet'),
('Tomato', 'Gorakhpur Mandi', 'Uttar Pradesh', '2026-09-15', 22.00, 'agmarknet'),
('Onion', 'Gorakhpur Mandi', 'Uttar Pradesh', '2026-09-01', 26.00, 'agmarknet'),
('Onion', 'Gorakhpur Mandi', 'Uttar Pradesh', '2026-09-15', 27.50, 'agmarknet');

-- Ratings & Feedback
INSERT INTO ratings_feedback (order_id, rated_by, rating, comments)
VALUES
(1, 3, 5, 'Fresh produce, delivered on time!');

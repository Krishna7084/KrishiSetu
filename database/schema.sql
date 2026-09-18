-- ============================================================
-- KrishiSetu — Database Schema (PostgreSQL)
-- Matches the core entities described in the SIH report
-- (Section 10: Database & System Architecture)
-- ============================================================

-- Clean slate (safe to re-run during development)
DROP TABLE IF EXISTS ratings_feedback CASCADE;
DROP TABLE IF EXISTS price_history CASCADE;
DROP TABLE IF EXISTS logistics_jobs CASCADE;
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS produce_listings CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- ------------------------------------------------------------
-- USERS  (Farmers, Buyers, Logistics Partners, Admins)
-- ------------------------------------------------------------
CREATE TABLE users (
    id              SERIAL PRIMARY KEY,
    full_name       VARCHAR(120) NOT NULL,
    phone           VARCHAR(15) UNIQUE NOT NULL,
    email           VARCHAR(150) UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    role            VARCHAR(20) NOT NULL CHECK (role IN ('farmer', 'buyer', 'logistics_partner', 'admin')),
    village         VARCHAR(120),
    district        VARCHAR(120),
    state           VARCHAR(120),
    kyc_verified    BOOLEAN DEFAULT FALSE,
    trust_score     NUMERIC(3,2) DEFAULT 0.0,
    created_at      TIMESTAMP DEFAULT NOW()
);

-- ------------------------------------------------------------
-- PRODUCE LISTINGS
-- ------------------------------------------------------------
CREATE TABLE produce_listings (
    id              SERIAL PRIMARY KEY,
    farmer_id       INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    crop_name       VARCHAR(120) NOT NULL,
    quantity_kg     NUMERIC(10,2) NOT NULL CHECK (quantity_kg > 0),
    quality_grade   VARCHAR(10),           -- e.g. A, B, C
    price_per_kg    NUMERIC(10,2) NOT NULL CHECK (price_per_kg > 0),
    harvest_date    DATE,
    status          VARCHAR(20) DEFAULT 'available' CHECK (status IN ('available', 'sold', 'expired')),
    created_at      TIMESTAMP DEFAULT NOW()
);

-- ------------------------------------------------------------
-- ORDERS
-- ------------------------------------------------------------
CREATE TABLE orders (
    id              SERIAL PRIMARY KEY,
    listing_id      INTEGER NOT NULL REFERENCES produce_listings(id) ON DELETE CASCADE,
    buyer_id        INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    quantity_kg     NUMERIC(10,2) NOT NULL CHECK (quantity_kg > 0),
    total_price     NUMERIC(12,2) NOT NULL,
    status          VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'delivered', 'cancelled')),
    tracking_id     VARCHAR(40) UNIQUE,
    created_at      TIMESTAMP DEFAULT NOW()
);

-- ------------------------------------------------------------
-- PAYMENTS / ESCROW
-- ------------------------------------------------------------
CREATE TABLE payments (
    id              SERIAL PRIMARY KEY,
    order_id        INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    amount          NUMERIC(12,2) NOT NULL,
    status          VARCHAR(20) DEFAULT 'held' CHECK (status IN ('held', 'released', 'refunded')),
    transaction_id  VARCHAR(100),
    created_at      TIMESTAMP DEFAULT NOW(),
    released_at     TIMESTAMP
);

-- ------------------------------------------------------------
-- LOGISTICS JOBS
-- ------------------------------------------------------------
CREATE TABLE logistics_jobs (
    id                  SERIAL PRIMARY KEY,
    order_id            INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    partner_id          INTEGER REFERENCES users(id),   -- role = logistics_partner
    pickup_point        VARCHAR(255),
    drop_point          VARCHAR(255),
    route_details       JSONB,
    status              VARCHAR(20) DEFAULT 'assigned' CHECK (status IN ('assigned', 'picked_up', 'in_transit', 'delivered', 'failed')),
    created_at          TIMESTAMP DEFAULT NOW()
);

-- ------------------------------------------------------------
-- PRICE HISTORY & MARKET DATA (for AI training)
-- ------------------------------------------------------------
CREATE TABLE price_history (
    id          SERIAL PRIMARY KEY,
    crop_name   VARCHAR(120) NOT NULL,
    mandi_name  VARCHAR(120),
    region      VARCHAR(120),
    price_date  DATE NOT NULL,
    price_per_kg NUMERIC(10,2) NOT NULL,
    source      VARCHAR(50) DEFAULT 'agmarknet'   -- e-NAM / Agmarknet / manual
);

-- ------------------------------------------------------------
-- RATINGS & FEEDBACK
-- ------------------------------------------------------------
CREATE TABLE ratings_feedback (
    id          SERIAL PRIMARY KEY,
    order_id    INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    rated_by    INTEGER NOT NULL REFERENCES users(id),
    rating      SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comments    TEXT,
    created_at  TIMESTAMP DEFAULT NOW()
);

-- ------------------------------------------------------------
-- Helpful indexes
-- ------------------------------------------------------------
CREATE INDEX idx_listings_status ON produce_listings(status);
CREATE INDEX idx_listings_crop ON produce_listings(crop_name);
CREATE INDEX idx_orders_buyer ON orders(buyer_id);
CREATE INDEX idx_price_history_crop_date ON price_history(crop_name, price_date);

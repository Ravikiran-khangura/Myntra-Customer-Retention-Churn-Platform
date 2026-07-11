USE myntra_db;
drop table if exists customers;
CREATE TABLE customers (
    customer_id VARCHAR(20),
    session_id VARCHAR(30) PRIMARY KEY,
    visit_date VARCHAR(20),
    device_type VARCHAR(30),
    user_type VARCHAR(30),
    marketing_channel VARCHAR(50),
    product_id VARCHAR(20),
    product_category VARCHAR(100),
    unit_price DECIMAL(10,2),
    quantity INT,
    discount_percent DECIMAL(5,2),
    discount_amount DECIMAL(10,2),
    revenue DECIMAL(10,2),
    pages_viewed INT,
    time_on_site_sec INT,
    added_to_cart BOOLEAN,
    purchased BOOLEAN,
    cart_abandoned BOOLEAN,
    rating DECIMAL(3,2),
    review_text TEXT,
    review_helpful_votes INT,
    payment_method VARCHAR(30),
    visit_day INT,
    visit_month INT,
    visit_weekday VARCHAR(20),
    visit_season VARCHAR(20),
    session_duration_bucket VARCHAR(30),
    revenue_normalized DECIMAL(10,4),
    location VARCHAR(100)
);

SELECT COUNT(*) FROM customers;
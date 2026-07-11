DROP TABLE IF EXISTS customer_features;
CREATE TABLE customer_features AS
SELECT
    customer_id,
    COUNT(session_id) AS total_sessions,
    SUM(CASE WHEN purchased = 1 THEN 1 ELSE 0 END) AS total_orders,
    SUM(revenue) AS total_spend,
    ROUND(
        SUM(revenue) /
        NULLIF(SUM(CASE WHEN purchased = 1 THEN 1 ELSE 0 END), 0),
        2
    ) AS average_order_value,
    ROUND(
        AVG(CASE WHEN cart_abandoned = 1 THEN 1 ELSE 0 END),
        2
    ) AS cart_abandonment_rate,
    ROUND(AVG(discount_percent), 2) AS average_discount_used,
    ROUND(AVG(rating), 2) AS customer_satisfaction,
    MAX(device_type) AS preferred_device,
    MAX(location) AS city,
    MAX(product_category) AS preferred_category,
    SUM(quantity) AS total_products_purchased,
    SUM(pages_viewed) AS total_pages_viewed,
    ROUND(AVG(time_on_site_sec), 2) AS average_time_on_site,
    SUM(review_helpful_votes) AS total_review_votes,
    MAX(payment_method) AS preferred_payment_method
FROM customers
GROUP BY customer_id;

SELECT COUNT(*) FROM customer_features;

SELECT *
FROM customer_features
LIMIT 10;
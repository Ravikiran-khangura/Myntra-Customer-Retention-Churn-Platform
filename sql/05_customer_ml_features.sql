DROP TABLE IF EXISTS customer_ml_dataset;

CREATE TABLE customer_ml_dataset AS
SELECT
    cf.customer_id,

    -- Customer behavior features
    cf.total_sessions,
    cf.total_orders,
    cf.total_spend,
    cf.average_order_value,
    cf.cart_abandonment_rate,
    cf.average_discount_used,
    cf.customer_satisfaction AS behavior_customer_satisfaction,
    cf.preferred_device,
    cf.city,
    cf.preferred_category,
    cf.total_products_purchased,
    cf.total_pages_viewed,
    cf.average_time_on_site,
    cf.total_review_votes,
    cf.preferred_payment_method,

    -- Customer profile features
    cl.signup_date,
    cl.age,
    cl.gender,
    cl.annual_income,
    cl.education,
    cl.marital_status,
    cl.dependents,
    cl.tenure,
    cl.contract,
    cl.payment_method AS churn_payment_method,
    cl.paperless_billing,
    cl.senior_citizen,
    cl.monthlycharges,
    cl.totalcharges,
    cl.num_services,
    cl.has_phone_service,
    cl.has_internet_service,
    cl.has_online_security,
    cl.has_online_backup,
    cl.has_device_protection,
    cl.has_tech_support,
    cl.has_streaming_tv,
    cl.has_streaming_movies,
    cl.customer_satisfaction AS churn_customer_satisfaction,
    cl.num_complaints,
    cl.num_service_calls,
    cl.late_payments,
    cl.avg_monthly_gb,
    cl.days_since_last_interaction,
    cl.credit_score,

    -- Target variable
    cl.churn

FROM customer_features cf
LEFT JOIN churn_labels cl
    ON cf.customer_id = cl.customer_id;


SELECT customer_id
FROM customer_features
LIMIT 10;

SELECT customer_id
FROM churn_labels
LIMIT 10;

DROP TABLE IF EXISTS customer_ml_dataset;

CREATE TABLE customer_ml_dataset AS
SELECT
    cf.*,
    cl.churn
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY customer_id) AS rn
    FROM customer_features
) cf
LEFT JOIN
(
    SELECT
        churn,
        ROW_NUMBER() OVER (ORDER BY customer_id) AS rn
    FROM churn_labels
) cl
ON cf.rn = cl.rn;

SELECT
    churn,
    COUNT(*) AS customers
FROM customer_ml_dataset
GROUP BY churn;
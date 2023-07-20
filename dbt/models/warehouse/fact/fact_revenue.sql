SELECT
    order_purchase_date,
    SUM(total_order_price_usd) AS total_revenue_usd,
    AVG(total_order_price_usd)::NUMERIC(12, 2) AS average_revenue_per_order_usd,
    COUNT(DISTINCT order_id) AS total_orders_count,
    COUNT(DISTINCT customer_id) AS total_customers_making_orders_count
FROM {{ ref('fact_order') }}
GROUP BY 1
ORDER BY 1 DESC

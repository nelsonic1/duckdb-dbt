SELECT
    {{ dbt_utils.generate_surrogate_key(['order_id']) }} AS fact_order_key,
    order_key,
    order_id,
    order_purchase_date,
    customer_id,
    order_status,
    order_approved_at,
    ROUND(SUM(price), 2) AS total_order_price_usd,
    ROUND(AVG(price), 2) AS avg_order_price_usd,
    ROUND(MIN(price), 2) AS min_price_usd,
    ROUND(MAX(price), 2) AS max_price_usd,
    ROUND(SUM(freight_value), 2) AS total_order_freight_usd,
    ROUND(AVG(freight_value), 2) AS avg_order_freight_usd,
    ROUND(MIN(freight_value), 2) AS min_freight_usd,
    ROUND(MAX(freight_value), 2) AS max_freight_usd,
    COUNT(DISTINCT product_id) AS total_products,
    COUNT(DISTINCT product_category_name) AS total_product_categories,
    COUNT(DISTINCT seller_id) AS total_sellers,
    COUNT(order_item_id) AS total_order_items
FROM {{ ref('dim_order') }}
WHERE order_status NOT IN ('unavailable', 'canceled')
GROUP BY
    fact_order_key,
    order_key,
    order_id,
    order_purchase_date,
    customer_id,
    order_status,
    order_approved_at
ORDER BY
    order_purchase_date DESC,
    order_id ASC

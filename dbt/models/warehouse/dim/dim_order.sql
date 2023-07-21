-- add comment

SELECT
    {{ dbt_utils.generate_surrogate_key(['o.order_id']) }} AS order_key,
    {{ dbt_utils.generate_surrogate_key(['o.order_id', 'oi.order_item_id']) }} AS order_item_key,
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    DATE_TRUNC('day', o.order_purchase_timestamp) AS order_purchase_date,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,
    oi.seller_id,
    oi.price::NUMERIC(12, 2) AS price,
    oi.freight_value::NUMERIC(12, 2) AS freight_value
FROM {{ ref('staging_olist_orders') }} o
JOIN {{ ref('staging_olist_order_items') }} oi
    ON o.order_id = oi.order_id
JOIN {{ ref('dim_product') }} p
    ON p.product_id = oi.product_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')

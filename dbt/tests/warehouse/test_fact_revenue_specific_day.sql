SELECT *
FROM {{ ref('fact_revenue') }}
WHERE order_purchase_date = '2017-01-06'
AND total_revenue_usd <>  916.38
AND average_revenue_per_order_usd <>  229.1
AND total_orders_count <>  4
AND total_customers_making_orders_count <>  4
SELECT * 
FROM {{ ref('fact_order') }}
WHERE order_id = '674eb13687ba86abeaee12ece9ce0309'
AND total_order_price_usd <> 127.00
AND avg_order_price_usd <> 21.17
AND min_price_usd <> 16.80
AND max_price_usd <> 29.90
AND total_order_freight_usd <> 21.00
AND avg_order_freight_usd <> 3.5
AND min_freight_usd <> 2.10
AND max_freight_usd <> 4.20
AND total_products <> 2
AND total_product_categories <> 1
AND total_sellers <> 2
AND total_order_items <> 6

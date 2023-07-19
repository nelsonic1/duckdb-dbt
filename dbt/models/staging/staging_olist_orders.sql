-- this join eliminates orders that are not in the order_items table. if an order
-- is not in the order_items table, it is not a valid order
SELECT 
	o.order_id,
	o.customer_id,
	o.order_status,
	o.order_purchase_timestamp,
	o.order_approved_at,
	o.order_delivered_carrier_date,
	o.order_delivered_customer_date,
	o.order_estimated_delivery_date
FROM {{ ref('raw_olist_orders') }} o
JOIN {{ ref('raw_olist_order_items') }} oi 
	ON o.order_id = oi.order_id
GROUP BY 1,2,3,4,5,6,7,8
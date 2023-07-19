  SELECT 
		order_id,
		order_item_id::INT AS order_item_id,
		product_id,
		seller_id,
		shipping_limit_date,
		price,
		freight_value
 FROM {{ source('brooklyn_data', 'olist_order_items') }}

SELECT 
	order_id,
	payment_sequential,
	payment_type,
	payment_installments,
	payment_value
FROM {{ source('brooklyn_data', 'olist_order_payments') }}

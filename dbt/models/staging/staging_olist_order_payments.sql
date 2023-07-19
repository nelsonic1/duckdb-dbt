SELECT 
	order_id,
	payment_sequential,
	payment_type,
	payment_installments,
	payment_value
  FROM {{ ref('raw_olist_order_payments') }}

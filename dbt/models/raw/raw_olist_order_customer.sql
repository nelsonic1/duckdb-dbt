SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix::VARCHAR AS customer_zip_code_prefix,
    customer_city,
    customer_state
FROM {{ source('brooklyn_data', 'olist_order_customer') }}

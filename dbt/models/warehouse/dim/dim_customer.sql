SELECT 
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} AS customer_key,
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM {{ ref('staging_olist_order_customer') }}

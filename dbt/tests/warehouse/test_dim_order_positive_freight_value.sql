SELECT * FROM {{ ref('dim_order') }}
WHERE freight_value < 0
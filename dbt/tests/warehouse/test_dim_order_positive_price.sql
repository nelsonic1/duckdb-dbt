SELECT * FROM {{ ref('dim_order') }}
WHERE price < 0
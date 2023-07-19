SELECT *
FROM {{ ref('fact_order') }}
WHERE total_order_price_usd < 0
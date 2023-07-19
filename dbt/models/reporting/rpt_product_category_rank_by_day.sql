-- generates a daily ranking of product categories by revenue

SELECT
    order_purchase_date,
    product_category_name,
    SUM(price) AS revenue_usd,
    RANK() OVER(PARTITION BY order_purchase_date ORDER BY SUM(price) DESC) AS category_rank
FROM {{ ref('dim_order') }}
GROUP BY 1, 2
ORDER BY order_purchase_date DESC, category_rank ASC

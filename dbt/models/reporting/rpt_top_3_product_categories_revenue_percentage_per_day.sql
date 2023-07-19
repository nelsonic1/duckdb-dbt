-- top_3_ranked_categories selects the top 3 product categories by revenue for each day
-- final joins the top 3 product categories by revenue for each day with the total revenue
-- for each day and performs calculations to determine the percentage of revenue
-- that is attributed to the top 3 product categories

WITH top_3_ranked_categories AS (
  SELECT 
    order_purchase_date,
    product_category_name,
    revenue_usd,
    category_rank
  FROM {{ ref('rpt_product_category_rank_by_day') }}
  WHERE category_rank <= 3
),

final AS (
  SELECT
    r.order_purchase_date,
    LIST(ROUND((c.revenue_usd / r.total_revenue_usd) * 100, 2))::VARCHAR AS top_3_product_categories_revenue_percentage
  FROM top_3_ranked_categories c
  JOIN {{ ref('fact_revenue') }} r
    ON r.order_purchase_date = c.order_purchase_date
  GROUP BY 1
)

SELECT * FROM final
--top_3_categories_by_day: selects the top 3 product categories by revenue for each day
--final: concatenates the top 3 product categories per day into an array

WITH top_3_categories_by_day AS (
  SELECT order_purchase_date,
      product_category_name,
      revenue_usd,
      category_rank
  FROM {{ ref('rpt_product_category_rank_by_day') }}
  WHERE category_rank <= 3
),

final AS (
  SELECT
    order_purchase_date,
    LIST(product_category_name ORDER BY category_rank ASC)::VARCHAR AS top_3_product_categories_by_revenue,
    LIST(revenue_usd ORDER BY category_rank ASC)::VARCHAR AS top_3_product_categories_revenue,
    LIST(category_rank ORDER BY category_rank ASC)::VARCHAR AS top_3_product_categories_rank
  FROM top_3_categories_by_day
  GROUP BY 1
  ORDER BY order_purchase_date DESC
)

SELECT * FROM final
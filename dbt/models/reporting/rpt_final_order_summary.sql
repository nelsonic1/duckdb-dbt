-- brings everything together and formats it correctly for the final report

SELECT
    r.order_purchase_date AS order_purchase_date,
    r.total_orders_count AS orders_count,
    r.total_customers_making_orders_count AS customers_making_orders_count,
    r.total_revenue_usd AS revenue_usd,
    r.average_revenue_per_order_usd AS average_revenue_per_order_usd,
    top_3_rev.top_3_product_categories_by_revenue,
    top_3_pct.top_3_product_categories_revenue_percentage
FROM {{ ref('fact_revenue') }} r
JOIN {{ ref('rpt_top_3_product_categories_by_revenue_by_day') }} top_3_rev
    ON top_3_rev.order_purchase_date = r.order_purchase_date
JOIN {{ ref('rpt_top_3_product_categories_revenue_percentage_per_day') }} top_3_pct
    ON top_3_pct.order_purchase_date = r.order_purchase_date

-- brings everything together and formats it correctly for the final report

SELECT
    r.order_purchase_date AS order_purchase_date,
    r.total_orders_count AS orders_count,
    r.total_customers_making_orders_count AS customers_making_orders_count,
    r.total_revenue_usd AS revenue_usd,
    r.average_revenue_per_order_usd AS average_revenue_per_order_usd,
    top_3_rev.top_3_product_categories_by_revenue ,
    top_3_pct.top_3_product_categories_revenue_percentage
FROM {{ ref('fact_revenue') }} r
JOIN {{ ref('rpt_top_3_product_categories_by_revenue_by_day') }} top_3_rev
    ON top_3_rev.order_purchase_date = r.order_purchase_date
JOIN {{ ref('rpt_top_3_product_categories_revenue_percentage_per_day') }} top_3_pct
    ON top_3_pct.order_purchase_date = r.order_purchase_date



-- 1. Create DBT models and lineage that result in and produces the following metrics at order
-- purchase date grain in descending date order:
-- a. Total orders
-- b. Total customers making orders
-- c. Total revenue
-- d. Average revenue per order
-- e. Top 3 product categories by revenue (by day)
-- f. Percent of day’s revenue associated with each of the top 3 product categories


-- Column Name Format/Type
-- order_purchase_date date
-- orders_count number
-- customers_making_orders_count number - two decimal places
-- revenue_usd number
-- average_revenue_per_order_usd number - two decimal places
-- top_3_product_categories_by_revenue string - comma separated list, in
-- descending order of revenue

-- top_3_product_categories_revenue_percentage string - comma separated list of numbers
-- to two decimal places, in descending
-- order of revenue percentage
WITH category_ranks AS (
    SELECT
        order_purchase_date,
        product_category_name,
        SUM(price) AS revenue_usd,
        RANK() OVER(PARTITION BY order_purchase_date ORDER BY SUM(price) DESC) AS category_rank
    FROM {{ ref('dim_order') }}
    WHERE order_purchase_date = '2018-01-01'
    GROUP BY 1, 2
    ORDER BY order_purchase_date DESC, category_rank ASC
),

top_10 AS (
    SELECT
        order_purchase_date,
        LIST(product_category_name ORDER BY category_rank ASC) as top_10_list
    FROM category_ranks WHERE category_rank <= 10
    GROUP BY 1
)

SELECT top_10_list
FROM top_10
WHERE top_10_list <> '[relogios_presentes, beleza_saude, cool_stuff, esporte_lazer, bebes, telefonia, cama_mesa_banho, ferramentas_jardim, malas_acessorios, pet_shop]'




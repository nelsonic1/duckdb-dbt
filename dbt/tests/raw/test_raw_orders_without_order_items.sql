{{ config(severity='warn') }}

SELECT * FROM {{ ref('raw_olist_orders') }}
WHERE order_id NOT IN (SELECT order_id FROM {{ ref('raw_olist_order_items') }})
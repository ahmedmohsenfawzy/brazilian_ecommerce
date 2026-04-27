with cte as(
    select * from {{ ref('stg_order_items') }}
),
cte2 as(
    select product_id
    from {{ ref('stg_products') }}
    where product_category_name is null
)

select
    cte.*,
    (price + freight_value) as total_price
from cte
where cte.product_id not in (select product_id from cte2)
with cte as(
    select * from {{ref('stg_products')}}
),
cte2 as(
    select * from {{ref('stg_product_category_translation')}}
)

select
    cte.product_id,
    cte2.product_category_name_english as product_name,
    cte.product_name_lenght,
    cte.product_description_lenght,
    cte.product_photos_qty,
    cte.product_weight_g,
    cte.product_length_cm,
    cte.product_height_cm,
    cte.product_width_cm
from cte
left join cte2
using(product_category_name)
where product_category_name_english is not null
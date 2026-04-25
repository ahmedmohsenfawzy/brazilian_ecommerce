with cte as(
    select * from {{ source('brazilian_ecommerce', 'product_category_translation') }}
)

select
    product_category_name,
    product_category_name_english
from cte
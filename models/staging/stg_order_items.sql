with cte as(
    select * from {{ source('brazilian_ecommerce', 'order_items') }}
)

select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    price,
    freight_value,
    {{convert_datatype('shipping_limit_date', 'timestamp')}} as shipping_limit_date
from cte
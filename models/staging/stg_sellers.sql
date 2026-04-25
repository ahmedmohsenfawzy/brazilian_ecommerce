with cte as(
    select * from {{ source('brazilian_ecommerce', 'sellers') }}
)

select
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
from cte
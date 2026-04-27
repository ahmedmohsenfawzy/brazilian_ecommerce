with cte as(
    select * from {{ source('brazilian_ecommerce', 'sellers') }}
)

select
    seller_id,
    {{convert_datatype('seller_zip_code_prefix','int')}} as seller_zip_code_prefix,
    seller_city,
    seller_state
from cte
with cte as(
    select * from {{ source('brazilian_ecommerce', 'customers') }}
)

select
    customer_id as customer_SK,
    customer_unique_id as customer_BK,
    customer_zip_code_prefix,
    customer_city,
    customer_state
from cte
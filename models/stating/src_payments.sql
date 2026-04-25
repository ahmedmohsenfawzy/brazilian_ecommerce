with cte as(
    select * from {{ source('brazilian_ecommerce', 'payments') }}
)

select
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
from cte
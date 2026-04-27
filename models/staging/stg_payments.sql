with cte as(
    select * from {{ source('brazilian_ecommerce', 'payments') }}
)

select
    order_id,
    {{convert_datatype('payment_sequential', 'smallint')}}  as payment_sequential,
    payment_type,
    {{convert_datatype('payment_installments', 'smallint')}} as payment_installments,
    {{convert_datatype('payment_value', 'float')}} as payment_value
from cte
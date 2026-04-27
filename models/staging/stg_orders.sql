with cte as(
    select * from {{ source('brazilian_ecommerce', 'orders') }}
)

select
    order_id,
    customer_id as customer_SK,
    order_status,
    {{convert_datatype('order_purchase_timestamp', 'timestamp')}} as order_purchase_timestamp,
    {{convert_datatype('order_approved_at', 'timestamp')}} as order_approved_at,
    {{convert_datatype('order_delivered_carrier_date', 'timestamp')}} as order_delivered_carrier_date,
    {{convert_datatype('order_delivered_customer_date', 'timestamp')}} as order_delivered_customer_date,
    {{convert_datatype('order_estimated_delivery_date', 'timestamp')}}  as order_estimated_delivery_date
from cte
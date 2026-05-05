with cte as(
    select * from {{ ref('int_order_items') }}
)

select * from cte
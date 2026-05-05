with cte as(
    select * from {{ ref('stg_orders') }}
)

select * from cte
with cte as(
    select * from {{ ref('int_products') }}
)

select * from cte
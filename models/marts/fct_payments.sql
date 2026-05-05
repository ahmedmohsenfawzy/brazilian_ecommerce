with cte as(
    select * from {{ ref('stg_payments') }}
)

select * from cte
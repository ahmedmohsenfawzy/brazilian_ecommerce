with cte as (
    select * from {{ ref('stg_customers') }}
)

select * from cte

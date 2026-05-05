with cte as(
    select * from {{ ref('stg_sellers') }}
)

select * from cte
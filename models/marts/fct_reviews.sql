with cte as(
    select * from {{ ref('stg_reviews') }}
)

select * from cte
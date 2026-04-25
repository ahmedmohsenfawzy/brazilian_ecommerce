with cte as(
    select * from {{ source('brazilian_ecommerce', 'reviews') }}
)

select
    review_id,
    order_id,
    review_score,
    review_creation_date,
    review_answer_timestamp
from cte
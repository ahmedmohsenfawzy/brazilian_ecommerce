with cte as(
    select * from {{ source('brazilian_ecommerce', 'reviews') }}
)

select
    review_id,
    order_id,
    {{convert_datatype('review_score', 'smallint')}} as review_score,
    {{convert_datatype('review_creation_date', 'timestamp')}} as review_creation_date,
    {{convert_datatype('review_answer_timestamp', 'timestamp')}} as review_answer_timestamp
from cte
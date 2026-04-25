with cte as(
    select * from {{ source('brazilian_ecommerce', 'geolocation') }}
)

select
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
from cte
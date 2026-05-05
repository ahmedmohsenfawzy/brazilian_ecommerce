with cte as(
    select * from {{ ref('stg_geolocation') }}
),
cte2 as(
    select * from {{ ref('brazil_states') }}
)

select
    cte.geolocation_zip_code_prefix,
    cte.geolocation_lat,
    cte.geolocation_lng,
    cte.geolocation_city,
    cte2.state as geolocation_state
from cte
left join cte2
on cte.geolocation_state = cte2.code
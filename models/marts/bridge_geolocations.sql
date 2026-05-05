with cte as(
    select * from {{ ref('int_geolocations') }}
)

select * from cte
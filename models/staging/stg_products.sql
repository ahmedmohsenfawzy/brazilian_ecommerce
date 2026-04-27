with cte as(
    select * from {{ source('brazilian_ecommerce', 'products') }}
)

select
    product_id,
    product_category_name,
    {{convert_datatype('product_name_lenght', 'float')}} as product_name_lenght,
    {{convert_datatype('product_description_lenght', 'float')}} as product_description_lenght,
    {{convert_datatype('product_photos_qty', 'float')}} as product_photos_qty,
    {{convert_datatype('product_weight_g', 'float')}} as product_weight_g,
    {{convert_datatype('product_length_cm', 'float')}} as product_length_cm,
    {{convert_datatype('product_height_cm', 'float')}} as product_height_cm,
    {{convert_datatype('product_width_cm', 'float')}} as product_width_cm
from cte
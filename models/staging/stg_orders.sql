with cte as(
    select * from {{ source('brazilian_ecommerce', 'orders') }}
)


SELECT
    order_id,

    customer_id                 AS customer_SK,


    order_status,

    {{ convert_datatype('order_purchase_timestamp', 'timestamp') }}         AS order_purchase_date_SK,
    {{ convert_datatype('order_approved_at', 'timestamp') }}                AS order_approved_date_SK,
    {{ convert_datatype('order_delivered_carrier_date', 'timestamp') }}     AS order_shipped_date_SK,
    {{ convert_datatype('order_delivered_customer_date', 'timestamp') }}    AS order_delivered_date_SK,
    {{ convert_datatype('order_estimated_delivery_date', 'timestamp') }}    AS order_estimated_delivery_date_SK,

    DATEDIFF(

        {{ convert_datatype('order_purchase_timestamp', 'timestamp') }},
        {{ convert_datatype('order_approved_at', 'timestamp') }}
    )                                                                        AS days_to_approval,

    DATEDIFF(

        {{ convert_datatype('order_approved_at', 'timestamp') }},
        {{ convert_datatype('order_delivered_carrier_date', 'timestamp') }}
    )                                                                        AS days_approval_to_ship,

    DATEDIFF(

        {{ convert_datatype('order_delivered_carrier_date', 'timestamp') }},
        {{ convert_datatype('order_delivered_customer_date', 'timestamp') }}
    )                                                                        AS days_ship_to_delivery,

    DATEDIFF(

        {{ convert_datatype('order_estimated_delivery_date', 'timestamp') }},
        {{ convert_datatype('order_delivered_customer_date', 'timestamp') }}
    )                                                                        AS delivery_delay_days   -- negative = early, positive = late

FROM cte
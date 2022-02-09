with payments as (

    select 
        id payment_id, 
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 amount,
        created as created_at
    from {{ source ('stripe','payment')}}  --"dev"."stripe"."payment"
)
select * from payments
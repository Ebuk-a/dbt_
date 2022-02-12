with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),


final as (
    select
        orders.order_id order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(payments.amount,0) as amount
    from orders 
    left join payments  ON orders.order_id = payments.order_id
)

select * from final

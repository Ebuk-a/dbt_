
with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),


final as (

    select
        orders.order_id,
        customers.customer_id,
        customers.first_name + ' '+ customers.last_name as name,
        orders.order_date,
        orders.status
        
    from orders

    left join customers using (customer_id)

)

select * from final
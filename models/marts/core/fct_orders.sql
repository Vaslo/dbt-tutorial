with payment as (
     select * from {{ ref('stg_payment')}}
),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_orders as (

    select 
        order_id,
        customer_id
    
    from orders


),

customer_payments as (

    select 
        order_id,
        amount

    from payment
),

final as (

    select 
        customer_orders.order_id,
        customer_orders.customer_id,
        sum(amount) as amount
    
    from
        customer_orders

    left join customer_payments using (order_id)

    group by 
        customer_orders.order_id,
        customer_orders.customer_id
)

select * from final
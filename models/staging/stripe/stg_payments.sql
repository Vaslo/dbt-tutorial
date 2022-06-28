with payment as (
    select 
        orderid as order_id,
        amount
    from dbt.stripe.payment
)

select * from payment
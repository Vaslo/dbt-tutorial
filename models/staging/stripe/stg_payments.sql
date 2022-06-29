with payment as (
    select 
        orderid as order_id,
        amount
    from dbt.jaffle_shop.payment
)

select * from payment
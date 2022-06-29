with payment as (
    select 
        orderid as order_id,
        amount
    from jaffle_shop.payment
)

select * from payment
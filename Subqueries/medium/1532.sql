select
  name customer_name,
  customer_id,
  order_id,
  order_date
from
  (
    select
      customer_id,
      order_id,
      order_date,
      rank() over (
        partition by
          customer_id
        order by
          customer_id,
          order_date desc
      )
    from
      orders
  )
  join customers using (customer_id)
where
  rank <= 3
order by
  name,
  customer_id,
  order_date desc
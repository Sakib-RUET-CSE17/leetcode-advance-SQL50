select
  o1.customer_id,
  o1.product_id,
  product_name
from
  (
    select
      customer_id,
      product_id,
      count(order_id)
    from
      orders
    group by
      customer_id,
      product_id
  ) o1
  join (
    select
      customer_id,
      max(count)
    from
      (
        select
          customer_id,
          product_id,
          count(order_id)
        from
          orders
        group by
          customer_id,
          product_id
      )
    group by
      customer_id
  ) o2 on o1.customer_id = o2.customer_id
  and o1.count = o2.max
  join products using (product_id)
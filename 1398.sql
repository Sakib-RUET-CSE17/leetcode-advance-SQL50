select
  customer_id,
  customer_name
from
  customers
where
  customer_id not in (
    select
      customer_id
    from
      orders
      join customers using (customer_id)
    where
      product_name = 'C'
    group by
      customer_id
  )
  and customer_id in (
    select
      customer_id
    from
      orders
      join customers using (customer_id)
    where
      product_name = 'A'
    group by
      customer_id
  )
  and customer_id in (
    select
      customer_id
    from
      orders
      join customers using (customer_id)
    where
      product_name = 'B'
    group by
      customer_id
  )
order by
  customer_id
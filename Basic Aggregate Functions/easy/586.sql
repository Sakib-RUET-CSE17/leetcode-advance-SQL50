select
  customer_number
from
  orders
group by
  customer_number
having
  count(customer_number) = (
    select
      max(orderCount)
    from
      (
        select
          customer_number,
          count(customer_number) orderCount
        from
          orders
        group by
          customer_number
      )
  )
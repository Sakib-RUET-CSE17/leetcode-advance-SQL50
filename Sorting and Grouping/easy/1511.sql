select
  customer_id,
  name
from
  orders
  join product using (product_id)
  join customers using (customer_id)
  join (
    select
      customer_id
    from
      orders
      join product using (product_id)
    where
      extract(
        month
        from
          order_date
      ) = 7
      and extract(
        year
        from
          order_date
      ) = 2020
    group by
      customer_id
    having
      sum(price * quantity) >= 100
  ) julyOrders using (customer_id)
where
  extract(
    month
    from
      order_date
  ) = 6
  and extract(
    year
    from
      order_date
  ) = 2020
group by
  customer_id,
  name
having
  sum(price * quantity) >= 100
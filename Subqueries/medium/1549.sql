select
  product_name,
  orders.product_id,
  orders.order_id,
  orders.order_date
from
  orders
  join (
    select
      product_id,
      max(order_date) maxOrderDate
    from
      orders
    group by
      product_id
  ) productOrder on orders.product_id = productOrder.product_id
  and productOrder.maxOrderDate = orders.order_date
  join products on orders.product_id = products.product_id
order by
  product_name,
  orders.product_id,
  orders.order_id
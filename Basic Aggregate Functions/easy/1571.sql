select
  name warehouse_name,
  sum(units * volume) volume
from
  warehouse
  join (
    select
      product_id,
      width * length * height volume
    from
      products
  ) products using (product_id)
group by
  name
select
  name Customers
from
  customers
  left join orders on customers.id = orders.customerid
where
  orders.id is null
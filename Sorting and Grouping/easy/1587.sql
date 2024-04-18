select
  name,
  sum(amount) balance
from
  transactions
  join users using (account)
group by
  name
having
  sum(amount) > 10000
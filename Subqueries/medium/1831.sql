select
  transaction_id
from
  transactions
  join (
    select
      day,
      max(amount) max_amount
    from
      transactions
    group by
      day
  ) dayMax on dayMax.day = transactions.day
  and dayMax.max_amount = transactions.amount
order by
  transactions.transaction_id
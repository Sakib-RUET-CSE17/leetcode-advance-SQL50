select
  name
from
  salesperson
where
  sales_id not in(
    select distinct
      sales_id
    from
      salesperson
      join orders using (sales_id)
      join company using (com_id)
    where
      company.name = 'RED'
  )
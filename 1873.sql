select
  employee_id,
  CASE
    WHEN employee_id % 2 != 0
    and name not like 'M%' then salary
    ELSE 0
  END bonus
from
  employees
order by
  employee_id
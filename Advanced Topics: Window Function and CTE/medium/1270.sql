select
  employees.employee_id
from
  employees
  join employees e1 on employees.manager_id = e1.employee_id
  join employees e2 on e1.manager_id = e2.employee_id
  join employees e3 on e2.manager_id = e3.employee_id
where
  e3.employee_id = 1
  and employees.employee_id != 1
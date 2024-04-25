select
  department.name Department,
  employee.name Employee,
  salary
from
  employee
  join (
    select
      departmentId,
      max(salary) maxSalary
    from
      employee
    group by
      departmentId
  ) deptSalary on deptSalary.departmentId = employee.departmentid
  and deptSalary.maxSalary = employee.salary
  join department on employee.departmentid = department.id
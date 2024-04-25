select
  employee_id,
  team_size
from
  employee
  join (
    select
      team_id,
      count(team_id) team_size
    from
      employee
    group by
      team_id
  ) t2 on employee.team_id = t2.team_id
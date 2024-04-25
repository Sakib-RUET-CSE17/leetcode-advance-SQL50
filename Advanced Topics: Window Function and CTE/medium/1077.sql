select
  project.project_id,
  employee_id
from
  project
  join employee using (employee_id)
  join (
    select
      project_id,
      max(experience_years) max_experience
    from
      project
      join employee using (employee_id)
    group by
      project_id
  ) project_experience on project_experience.project_id = project.project_id
  and project_experience.max_experience = employee.experience_years
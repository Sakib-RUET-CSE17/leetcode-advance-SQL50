select
  enrollments.student_id,
  min(course_id) course_id,
  enrollments.grade
from
  enrollments
  join (
    select
      student_id,
      max(grade) grade
    from
      enrollments
    group by
      student_id
  ) e on e.student_id = enrollments.student_id
  and e.grade = enrollments.grade
group by
  enrollments.student_id,
  enrollments.grade
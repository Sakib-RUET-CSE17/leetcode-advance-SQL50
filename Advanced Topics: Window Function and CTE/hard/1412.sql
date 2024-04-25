select distinct
  student_id,
  student_name
from
  exam
  join student using (student_id)
where
  student_id not in(
    select distinct
      student_id
    from
      exam
      join (
        select
          exam_id,
          max(score),
          min(score)
        from
          exam
        group by
          exam_id
      ) min_max_exam on min_max_exam.exam_id = exam.exam_id
      and (
        exam.score = min_max_exam.min
        or exam.score = min_max_exam.max
      )
  )
order by
  student_id
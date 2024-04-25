select
  all_table.task_id,
  all_table.subtask_id
from
  executed
  right join (
    select
      tasks.task_id,
      subtask.subtask_id
    from
      tasks
      join (
        select
          1 subtask_id
        union
        select
          2
        union
        select
          3
        union
        select
          4
        union
        select
          5
        union
        select
          6
        union
        select
          7
        union
        select
          8
        union
        select
          9
        union
        select
          10
        union
        select
          11
        union
        select
          12
        union
        select
          13
        union
        select
          14
        union
        select
          15
        union
        select
          16
        union
        select
          17
        union
        select
          18
        union
        select
          19
        union
        select
          20
      ) subtask on subtask.subtask_id <= subtasks_count
  ) all_table on (
    all_table.task_id = executed.task_id
    and all_table.subtask_id = executed.subtask_id
  )
where
  executed.task_id is null
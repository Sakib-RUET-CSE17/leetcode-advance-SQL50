select
  start_id,
  end_id
from
  (
    select
      *,
      rank() over (
        order by
          start_id
      ) rank_id
    from
      (
        select
          log_id start_id
        from
          (
            select
              *,
              lag(log_id) over (
                order by
                  log_id
              )
            from
              logs
          )
        where
          lag + 1 != log_id
        union
        select
          min(log_id)
        from
          logs
      )
  ) start_table
  join (
    select
      *
    from
      (
        select
          *,
          rank() over (
            order by
              end_id
          ) rank_id
        from
          (
            select
              lag end_id
            from
              (
                select
                  *,
                  lag(log_id) over (
                    order by
                      log_id
                  )
                from
                  logs
              )
            where
              lag + 1 != log_id
            union
            select
              max(log_id)
            from
              logs
          )
      )
  ) end_table using (rank_id)
select
  user_id,
  max(visit_date - lag) biggest_window
from
  (
    select
      *,
      lag(visit_date) over (
        order by
          user_id,
          visit_date
      ),
      rank() over (
        partition by
          user_id
        order by
          visit_date
      )
    from
      (
        select
          *
        from
          uservisits
        union
        (
          select distinct
            user_id,
            date ('2021-1-1')
          from
            uservisits
        )
      )
  )
where
  rank > 1
group by
  user_id
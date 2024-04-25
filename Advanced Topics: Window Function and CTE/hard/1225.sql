select
  'succeeded' period_state,
  start_date,
  end_date
from
  (
    select
      *,
      rank() over (
        order by
          start_date
      )
    from
      (
        select
          success_date start_date
        from
          (
            select
              success_date,
              success_date - lag diff
            from
              (
                select
                  *,
                  lag(success_date) over (
                    order by
                      success_date
                  )
                from
                  succeeded
                where
                  success_date between '2019-01-01' and '2019-12-31'
              )
            where
              lag between '2019-01-01' and '2019-12-31'
          )
        where
          diff != 1
        union
        select
          min(success_date)
        from
          succeeded
        where
          success_date between '2019-01-01' and '2019-12-31'
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
              end_date
          )
        from
          (
            select
              lag end_date
            from
              (
                select
                  lag,
                  success_date - lag diff
                from
                  (
                    select
                      *,
                      lag(success_date) over (
                        order by
                          success_date
                      )
                    from
                      succeeded
                    where
                      success_date between '2019-01-01' and '2019-12-31'
                  )
                where
                  lag between '2019-01-01' and '2019-12-31'
              )
            where
              diff != 1
            union
            select
              max(success_date)
            from
              succeeded
            where
              success_date between '2019-01-01' and '2019-12-31'
          )
      )
  ) end_table using (rank)
  where start_date is not null and end_date is not null
union
select
  'failed' period_state,
  start_date,
  end_date
from
  (
    select
      *,
      rank() over (
        order by
          start_date
      )
    from
      (
        select
          fail_date start_date
        from
          (
            select
              fail_date,
              fail_date - lag diff
            from
              (
                select
                  *,
                  lag(fail_date) over (
                    order by
                      fail_date
                  )
                from
                  failed
                where
                  fail_date between '2019-01-01' and '2019-12-31'
              )
            where
              lag between '2019-01-01' and '2019-12-31'
          )
        where
          diff != 1
        union
        select
          min(fail_date)
        from
          failed
        where
          fail_date between '2019-01-01' and '2019-12-31'
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
              end_date
          )
        from
          (
            select
              lag end_date
            from
              (
                select
                  lag,
                  fail_date - lag diff
                from
                  (
                    select
                      *,
                      lag(fail_date) over (
                        order by
                          fail_date
                      )
                    from
                      failed
                    where
                      fail_date between '2019-01-01' and '2019-12-31'
                  )
                where
                  lag between '2019-01-01' and '2019-12-31'
              )
            where
              diff != 1
            union
            select
              max(fail_date)
            from
              failed
            where
              fail_date between '2019-01-01' and '2019-12-31'
          )
      )
  ) end_table using (rank)
  where start_date is not null and end_date is not null
order by
  start_date
select
  min(nextX.x - currentX.x) shortest
from
  (
    select
      RANK() OVER (
        ORDER BY
          point.x
      ),
      *
    from
      point
  ) currentX
  join (
    select
      *
    from
      (
        select
          RANK() OVER (
            ORDER BY
              x
          ),
          *
        from
          point
      )
  ) nextX on currentX.rank + 1 = nextX.rank
select
  *
from
  (
    select
      cinema.seat_id
    from
      cinema
      join (
        select
          *
        from
          cinema
        where
          free = 1
      ) consecutive on consecutive.seat_id + 1 = cinema.seat_id
    where
      cinema.free = 1
  )
union
(
  select
    consecutive.seat_id
  from
    cinema
    join (
      select
        *
      from
        cinema
      where
        free = 1
    ) consecutive on consecutive.seat_id + 1 = cinema.seat_id
  where
    cinema.free = 1
)
order by
  seat_id
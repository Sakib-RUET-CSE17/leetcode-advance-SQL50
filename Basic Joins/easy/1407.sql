select
  name,
  coalesce(sum(distance), 0) travelled_distance
from
  rides
  right join users on users.id = rides.user_id
group by
  user_id,
  name
order by
  travelled_distance desc,
  name
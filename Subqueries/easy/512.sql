select
  activity.player_id,
  device_id
from
  activity
  join (
    select
      player_id,
      min(event_date) first_login
    from
      activity
    group by
      player_id
  ) f on f.player_id = activity.player_id
  and activity.event_date = f.first_login
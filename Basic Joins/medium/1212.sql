select
  team_id,
  team_name,
  coalesce(sum(num_points), 0) num_points
from
  (
    select
      host_team team_id,
      count(host_team) * 3 num_points,
      'hostWin' remark
    from
      matches
    where
      host_goals > guest_goals
    group by
      host_team
    union
    select
      guest_team team_id,
      count(guest_team) * 3 num_points,
      'guestWin' remark
    from
      matches
    where
      guest_goals > host_goals
    group by
      guest_team
    union
    select
      host_team team_id,
      count(host_team) num_points,
      'drawAsHost' remark
    from
      matches
    where
      host_goals = guest_goals
    group by
      host_team
    union
    select
      guest_team team_id,
      count(guest_team) num_points,
      'drawAsGuest' remark
    from
      matches
    where
      host_goals = guest_goals
    group by
      guest_team
  ) teamPoint
  right join teams using (team_id)
group by
  team_id,
  team_name
order by
  num_points desc,
  team_id
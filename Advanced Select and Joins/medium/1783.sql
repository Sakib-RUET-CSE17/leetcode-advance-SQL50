select
  player_id,
  player_name,
  sum(grand_slams_count) grand_slams_count
from
  (
    select
      coalesce(w.player_id, f.fr_open, u.us_open, a.au_open) player_id,
      player_name,
      coalesce(w.grand_slams_count, 0) + coalesce(f.grand_slams_count, 0) + coalesce(u.grand_slams_count, 0) + coalesce(a.grand_slams_count, 0) grand_slams_count
    from
      (
        select
          wimbledon player_id,
          count(wimbledon) grand_slams_count
        from
          championships
        group by
          wimbledon
      ) w
      full join (
        select
          fr_open,
          count(fr_open) grand_slams_count
        from
          championships
        group by
          fr_open
      ) f on f.fr_open = w.player_id
      full join (
        select
          us_open,
          count(us_open) grand_slams_count
        from
          championships
        group by
          us_open
      ) u on u.us_open = w.player_id
      full join (
        select
          au_open,
          count(au_open) grand_slams_count
        from
          championships
        group by
          au_open
      ) a on a.au_open = w.player_id
      join players on players.player_id = coalesce(w.player_id, f.fr_open, u.us_open, a.au_open)
  )
group by
  player_id,
  player_name
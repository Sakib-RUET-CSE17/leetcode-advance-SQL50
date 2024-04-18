select
  from_id person1,
  to_id person2,
  count(from_id) call_count,
  sum(duration) total_duration
from
  (
    select
      case
        when from_id > to_id then to_id
        else from_id
      end,
      case
        when from_id > to_id then from_id
        else to_id
      end,
      duration
    from
      calls
  )
group by
  from_id,
  to_id
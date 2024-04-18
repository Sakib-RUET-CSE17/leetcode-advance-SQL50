select
  name country
from
  (
    select
      *
    from
      (
        select
          callerCountry.country_code,
          callerCountry.name,
          sum(duration) duration,
          count(callerCountry.country_code) callCount
        from
          calls
          join person caller on calls.caller_id = caller.id
          join country callerCountry on callerCountry.country_code = left(caller.phone_number, 3)
          join person callee on calls.callee_id = callee.id
          join country calleeCountry on calleeCountry.country_code = left(callee.phone_number, 3)
        group by
          callerCountry.country_code,
          callerCountry.name
      )
    union
    (
      select
        calleeCountry.country_code,
        calleeCountry.name,
        sum(duration),
        count(calleeCountry.country_code)
      from
        calls
        join person caller on calls.caller_id = caller.id
        join country callerCountry on callerCountry.country_code = left(caller.phone_number, 3)
        join person callee on calls.callee_id = callee.id
        join country calleeCountry on calleeCountry.country_code = left(callee.phone_number, 3)
      group by
        calleeCountry.country_code,
        calleeCountry.name
    )
  )
group by
  country_code,
  name
having
  sum(duration) / sum(callCount) > (
    select
      avg(duration)
    from
      calls
  )
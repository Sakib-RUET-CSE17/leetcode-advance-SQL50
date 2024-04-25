select
  id,
  'Root'
type
from
  tree
where
  p_id is null
union
select
  id,
  'Leaf'
from
  tree
where
  id not in (
    select distinct
      p_id
    from
      tree
    where
      p_id is not null
    union
    select
      id
    from
      tree
    where
      p_id is null
  )
union
select
  id,
  'Inner'
from
  tree
where
  id not in (
    select
      id
    from
      tree
    where
      id not in (
        select distinct
          p_id
        from
          tree
        where
          p_id is not null
      )
    union
    select
      id
    from
      tree
    where
      p_id is null
  )
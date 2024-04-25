select distinct
  page_id recommended_page
from
  friendship
  join likes on user_id = user1_id
  or user_id = user2_id
where
  (
    user1_id = 1
    or user2_id = 1
  )
  and page_id not in(
    select
      page_id
    from
      likes
    where
      user_id = 1
  )
select
  distinct title
from
  tvprogram
  join content using (content_id)
where
  program_date between '2020-06-01' and '2020-06-30'
  and kids_content = 'Y' and content_type = 'Movies'
select distinct
  l1.account_id
from
  loginfo l1
  join loginfo l2 on l1.account_id = l2.account_id
  and not (l2.logout < l1.login)
  and not (l2.login > l1.logout)
  and l1.ip_address != l2.ip_address
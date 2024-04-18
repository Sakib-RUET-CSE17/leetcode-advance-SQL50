select
  round(
    (
      (
        select
          count(delivery_id)
        from
          delivery
        where
          order_date = customer_pref_delivery_date
      ) * 100.0
    ) / (
      select
        count(delivery_id)
      from
        delivery
    ),
    2
  ) immediate_percentage
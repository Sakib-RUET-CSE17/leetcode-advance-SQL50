select
  sale_date,
  coalesce(appleSale.sold_num, 0) - coalesce(orangeSale.sold_num, 0) diff
from
  sales appleSale
  full join (
    select
      sale_date,
      sold_num
    from
      sales
    group by
      sale_date,
      sold_num,
      fruit
    having
      fruit like 'o%'
  ) orangeSale using (sale_date)
group by
  sale_date,
  appleSale.sold_num,
  orangeSale.sold_num,
  fruit
having
  fruit like 'a%'
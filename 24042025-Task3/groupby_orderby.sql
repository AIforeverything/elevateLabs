select * from product
order by P_ID desc;

select name, sum(price) as totalSales
from product
group by name
order by totalSales desc;

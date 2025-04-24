-- A view is like a virtual table based on a query. It doesn't store data itself, but it can simplify complex queries and make analytics easier
create view cart_customer as
select
c.cart_id 
from cart c
join customer cu on c.User_ID=cu.User_ID;

select * from cart_customer;
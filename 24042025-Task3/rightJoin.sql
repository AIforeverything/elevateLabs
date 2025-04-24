-- 3. RIGHT JOIN – All from the right table, match from left if possible
select Name,Email
from customer
right join cart on cart.User_ID=customer.User_ID;
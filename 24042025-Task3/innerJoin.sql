-- 1. INNER JOIN – Only matching rows in both tables: cart and customer
select Name,Email,Password,Cart_ID
from customer
inner join cart on cart.User_ID=customer.User_ID;

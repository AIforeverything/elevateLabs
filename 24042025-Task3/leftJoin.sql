-- 2. LEFT JOIN – All from the left table, match from right if possible
select Cart_ID
from cart
left join customer on cart.User_ID=customer.User_ID;
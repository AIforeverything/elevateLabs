-- Subquery in WHERE Clause
select * from customer
where User_ID in (select User_ID from cart)  	

select p_id,
sum(price) as total_price from product
group by p_id
having sum(price)>150000;
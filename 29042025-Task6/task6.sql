create database task6;
use task6;

create table sales_order;

CREATE TABLE sales_order (
    ORDERNO     VARCHAR(6) PRIMARY KEY,
    CLIENTNO    VARCHAR(6),
    ORDERDATE   DATE,
    DELYADDR    VARCHAR(25),
    SALESMANNO  VARCHAR(6),
    DELYTYPE    CHAR(1),
    BILLYN      CHAR(1),
    DELYDATE    DATE,
    ORDERSTATUS VARCHAR(10)
);

show tables;

#adding data to the sales_order table 
INSERT INTO sales_order (
    ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, 
    SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS
) VALUES
('O10001', 'C1001', '2025-04-01', '123 Maple St', 'S1001', 'D', 'Y', '2025-04-05', 'Shipped'),
('O10002', 'C1002', '2025-04-03', '456 Oak St',   'S1002', 'P', 'N', '2025-04-04', 'Pending'),
('O10003', 'C1003', '2025-04-05', '789 Pine St',  'S1001', 'D', 'Y', '2025-04-08', 'Delivered'),
('O10004', 'C1004', '2025-04-07', '321 Birch St', 'S1003', 'D', 'N', '2025-04-10', 'Pending'),
('O10005', 'C1005', '2025-04-09', '654 Cedar St', 'S1002', 'P', 'Y', '2025-04-09', 'Cancelled'),
('O10006', 'C1006', '2025-04-11', '987 Elm St',   'S1004', 'D', 'N', '2025-04-14', 'Shipped'),
('O10007', 'C1001', '2025-04-13', '123 Maple St', 'S1001', 'P', 'Y', '2025-04-13', 'Delivered'),
('O10008', 'C1007', '2025-04-15', '159 Spruce St','S1005', 'D', 'N', '2025-04-18', 'Processing'),
('O10009', 'C1008', '2025-04-17', '753 Willow St','S1003', 'D', 'Y', '2025-04-21', 'Delivered'),
('O10010', 'C1009', '2025-04-19', '258 Ash St',   'S1002', 'P', 'N', '2025-04-20', 'Pending');

# accessing table
select * from sales_order;

#1.Use EXTRACT(MONTH FROM order_a. date) for month.
SELECT 
    *,
    EXTRACT(MONTH FROM ORDERDATE) AS ORDER_MONTH
FROM 
    sales_order;

# b.GROUP BY year/month.
Select 
	year(ORDERDATE) as order_year,
    month(ORDERDATE) as order_month,
    count(*) as total_orders
from sales_order
group by
	year(orderdate),
    month(orderdate)
order by
	order_year,order_month;
    
-- c.Use SUM() for revenue
alter table sales_order
add column revenue decimal(10,2);

UPDATE sales_order SET REVENUE = 1500.00 WHERE ORDERNO = 'O10001';
UPDATE sales_order SET REVENUE = 1200.00 WHERE ORDERNO = 'O10002';
UPDATE sales_order SET REVENUE = 1800.50 WHERE ORDERNO = 'O10003';
UPDATE sales_order SET REVENUE = 950.00  WHERE ORDERNO = 'O10004';
UPDATE sales_order SET REVENUE = 0.00    WHERE ORDERNO = 'O10005';  -- Cancelled order
UPDATE sales_order SET REVENUE = 1750.75 WHERE ORDERNO = 'O10006';
UPDATE sales_order SET REVENUE = 1600.00 WHERE ORDERNO = 'O10007';
UPDATE sales_order SET REVENUE = 1100.00 WHERE ORDERNO = 'O10008';
UPDATE sales_order SET REVENUE = 1900.25 WHERE ORDERNO = 'O10009';
UPDATE sales_order SET REVENUE = 1000.00 WHERE ORDERNO = 'O10010';

#c.Use SUM() for revenue.
select sum(revenue) as total_revenue from sales_order;

#d.COUNT(DISTINCT order_id) for volume.
select distinct ORDERNO from sales_order;

#e.Use ORDER BY for sorting.
select * from sales_order
order by revenue desc;

#f.Limit results for specific time periods.
SELECT *
FROM sales_order
WHERE DAY(ORDERDATE) < 10
ORDER BY revenue desc;

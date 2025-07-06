Create database KMS_Project_db

select * from [KMS Sql Case Study]
select * from [dbo].[Order_Status]

---PRODUCT CATEGORY WITH HIGHEST SALES

select Top 1 Product_Category, sum(Sales)as Total_sales 
from [KMS Sql Case Study]
group by Product_Category
Order by Total_sales desc 

---TOP 3 REGION IN TERMS OF SALES

select top 3 Region, Sum(Sales) as total_sales 
from [KMS Sql Case Study]
group by Region
Order by total_Sales desc

---BOTTOM 3 REGION IN TERMS OF SALES

select top 3 Region, Sum(Sales) as total_sales 
from [KMS Sql Case Study]
group by Region
Order by total_Sales asc

---TOTAL SALES OF APPLIANCES IN ONTARIO

select Province, Product_sub_category,sum(Sales)
from [KMS Sql Case Study]
where Province in ('Ontario')
and
Product_Sub_Category = ('Appliances')
Group by Product_sub_category, Province

---REVENUE FROM THE BOTTOM 10 CUSTOMER
--It could been seen that Office Supplies under Product Category is the part with lowest revenue from year 2009-2012, 
--so I suggest there should be strongly improve the quality of products in Office supplies So that customer may find more interest in it.

select top 10 * from [KMS Sql Case Study]
order by sales, Order_date desc


---THE MOST SHIPPINIG COST METHOD

select top 1 Ship_Mode, Sum(shipping_cost)as total_ship_cost
from [KMS Sql Case Study]
group by Ship_Mode
order by total_ship_cost desc


select* from [KMS Sql Case Study]

---THE MOST VALUEABLE CUSTOMERS WITH PRODUCT AND SERVICES TYPICAL PURCHASED

--The corporate customer segment are the most valuable in terms of revenue to the company 
--with different product purchase rangeing from 800+ - 600+ thousand of revenue of four different products.
--The most purchase product is 'Telephone and Communication' while product with highest income is 'Office Machines'


select top 10 count(distinct row_id), customer_segment, Product_Sub_category, sum(sales) as total_sales
 from [KMS Sql Case Study]
 group by customer_segment, Product_Sub_category
 order by total_sales desc


---SMALL BUSINESS CUSTOMER WITH THE HIGHEST SALES

select top 1 customer_name, customer_segment, sales
from [KMS Sql Case Study]
where Customer_Segment ='Small business'
order by sales desc

---THE HIGHEST NUMBER OF ORDERS FROM CORPORATE CUSTOMER IN 2009 - 2012


select top 1 customer_name, customer_segment,  count(distinct row_id) as No_of_order
from [KMS Sql Case Study]
where Customer_Segment ='corporate'
group by Customer_Name, Customer_Segment
order by No_of_order desc

---MOST PROFITABLE CONSUMER CUSTOMER


select top 3 customer_name, customer_segment, sum(Profit) as total_profit
from [KMS Sql Case Study]
where Customer_Segment ='Consumer'
group by Customer_Name, Customer_Segment
order by total_profit desc


---CUSTOMERS THAT RETURNS ITEMS
--They belong to segement of: Consumer, corporate, Home Office and Small Business


select count(kms.order_id)as no_of_customer, kms.customer_name,
	   Kms.customer_segment, [order].[status]
from [KMS Sql Case Study] kms 
join order_status [order]
on kms.[order_id] = [order].[order_id]
group by Kms.customer_segment, [order].[status], kms.customer_name


--AMOUNT OF SHIPING COST BASE ON ORDER PRIORITY

select count(order_id), order_priority, ship_mode, sum(Sales) as total_sales,
	Sum(sales-profit) AS Estimated_Shipping_Cost,
	Avg(Datediff(day, [order_date], [ship_date])) as Avg_ship_date,
	sum(shipping_cost), Product_container
from [KMS Sql Case Study]
group by order_priority, ship_mode, Product_container




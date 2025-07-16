create database KMS_db

select * from KMS

----Case Scenario I----

------Product Category with Highest Sales------
select top 1 product_category, sum(sales) as HighestSales
from kms	
group by product_category
order by HighestSales desc


------Top 3 Regions in terms of Sales------
select top 3 Region, sum(sales) as HighestSales
from kms
group by Region
order by HighestSales desc


------Bottom 3 Regions in terms of Sales------
select top 3 Region, sum(sales) as LowestSales
from kms
group by Region
order by LowestSales asc


------Total Sales of Appliances in Ontario------
select Province = 'Ontario', round(sum(sales), 3) as TotalSales
from kms 
where Province = 'Ontario' 
   and Product_category = 'Technology'
 


 ------Revenue from bottom 10 Customers------
 select top 10 Order_ID, Customer_Name, round(sum(sales), 1) as TotalRevenue
 from kms
 group by Order_ID, Customer_Name
 order by TotalRevenue asc 



 ------Most Costly Shipping Method------
 select top 1 Order_ID, Ship_Mode, round(sum(Shipping_Cost), 3) as Shipping_Cost
 from kms 
 group by Order_ID, Ship_Mode
 Order by Shipping_Cost desc 



 ----Case Scenario II
------Top Customers and Products------
select top 10 Order_ID, Customer_Name, Product_Category, Product_Sub_Category, Product_Name, round(sum(sales), 2) as TotalSpent 
from kms
group by Order_ID, Customer_Name, Product_Category, Product_Sub_Category, Product_Name  
order by TotalSpent desc



------Small Business Customer with the Highest Sales------
select top 1 Order_ID, Customer_Segment = 'Small business', Customer_Name, round(sum(sales), 2) as Highest_Sales
from kms 
group by Order_ID, Customer_Segment, Customer_Name



------Highest Corporate Customer Order in 2009-2012------
select top 1 
Order_Id,  
Customer_Segment = 'Corporate', 
Customer_Name, 
round(sum(sales), 2) as Total_Order_Value
from kms 
where Customer_Segment = 'Corporate'
     and Ship_Date between '2009-01-01' and '2012-12-31' 
group by Order_ID, Customer_Segment, Customer_Name
order by Total_Order_Value desc



-------Most Profitable Consumer Customer------
select top 1 Order_ID, Customer_Segment = 'Consumer', Customer_Name, round(Sum(profit), 2) as Total_Profit
from kms 
group by Order_ID, Customer_Segment, Customer_Name
order by Total_Profit desc



-------Returned Items------
select Order_ID, Customer_Segment
from kms 


------Order Priority and Shipping Expenses------
select Order_ID, Order_Priority, Ship_Mode, round(sum(Shipping_Cost), 2)  as Total_Shipping_Expense
from kms
group by Order_ID, Order_Priority, Ship_Mode 
order by Order_Priority

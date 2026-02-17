   -- ------------------------------------------------------------------------------------------------------------    
                                            --  KPIs Queries -- 
   -- ------------------------------------------------------------------------------------------------------- 
    Select  * from master_sales ;
    
    # Total Sales(Revenue)
    Select sum(salesAmount)Revenue
     from master_sales ;
     
# Total Profit
     Select sum(Profit)TotalProfit
     from master_sales ;
     
# Total Production Cost
   Select sum(ProductionCost) AS Total_Production_Cost
  FROM master_sales;

# Sales vs Cost Comparison
	select 
    sum(SalesAmount) AS TotalSales,
    sum(ProductionCost) AS TotalCost,
    sum(Profit) AS TotalProfit
    from master_sales ;
    
# Total Orders(Count of unique orders)
Select count(distinct SalesOrderNumber)TotalOrders
from master_sales ;

# total Customers
select  count(distinct CustomerKey)TotalCustomers
from master_sales;

# Sales per Customer
select sum(SalesAmount) / count(distinct CustomerKey)Sales_Per_Customer
from master_sales;

# Total Quantity Sold
select sum(OrderQuantity)Total_Units_Sold
from master_sales;

 # Average Order Value
select sum(SalesAmount) / count(distinct SalesOrderNumber)Avg_Order_Value
FROM master_sales;

# Overall Profit Margin %
select (SUM(Profit) / SUM(SalesAmount)) * 100 AS Profit_Margin_Percent
from master_sales;
 

  -- ----------------------------------------------------------------------------------------------
                                       --  Business KPIs Queries -- 
     # Monthly Sales
     select  MonthName, TotalSales 
     from (select month(Dates)monthno,MonthName,sum(SalesAmount) as TotalSales
     from master_sales
     group by monthno,MonthName
     order by monthno)shaily ;
     
     # Yearly Sales
     select year,sum(SalesAmount) as TotalSales
     from master_sales
     group by year
     order by year ;
     
	# TotalSales by Year-Month
     select YearMonth,sum(SalesAmount) as TotalSales
     from master_sales
     group by YearMonth
     order by YearMonth ;
     
     # Quarter-Wise Sales    
     select Quarter,sum(SalesAmount) as TotalSales
     from master_sales
     group by  Quarter
     order by Quarter;
    
       # Financial Quarter-Wise Sales  
     select FinancialQuarter,sum(SalesAmount) as TotalSales
     from master_sales
     group by FinancialQuarter
     order by FinancialQuarter;
    
     # Sales by Region   
    select Region , sum(SalesAmount)TotalSales
    from master_sales
    group by Region
    order by TotalSales desc ;
    
     # Profit by Region   
    select Region , sum(Profit)Profit
    from master_sales
    group by Region
    order by Profit desc ;
    
 #  Category by Sales
	select Category,sum(SalesAmount)TotalSales
	from master_sales
	group by Category
	order by TotalSales desc ;
    
     
#  Top 10 SubCategory by Sales
	select SubCategory,sum(SalesAmount)TotalSales
     from master_sales
     group by SubCategory
     order by TotalSales desc
     limit 10;
     
     # Top 10 Products by Sales
     select ProductName,sum(Profit)Profit
     from master_sales
     group by ProductName
     order by Profit desc
     limit 10;
     
	 # Least 10 Profitable Product
     select ProductName,sum(Profit)Profit
     from master_sales
     group by ProductName
     order by Profit 
     limit 10;
     
	# Top 10 Customers by Sales
     select  CustomerKey,CustomerName,sum(SalesAmount)TotalSales
     from master_sales
     group by CustomerKey,CustomerName
     order by TotalSales desc
     limit 10;
   


-- ---------------------------------------------------------------------------------------------------------------------------
                                -- Performing joins to join all dimension table to fact table(sales table)--
 -- ----------------------------------------------------------------------------------------------------------------------------                               
# Creating Unified Fact Table named as Sales

create table Sales AS
select * from fact_internet_sales
union all 
select * from fact_internet_sales_new ;

select * from sales ;

#  creating Final MASTER TABLE using JOINS named as master_sales

create table master_sales as
select 
       s.*,
       p.EnglishProductName as ProductName , p.UnitPrice as ProductUnitPrice ,p.StandardCost as standardcost,
       ps.EnglishProductSubCategoryName as SubCategory,
       pc.EnglishProductCategoryName as Category,
       c.FullName as CustomerName , c.Gender,
       d.DateKey as Dates,
       t.SalesTerritoryRegion as Region, t.SalesTerritoryCountry as Country ,t.SalesTerritoryGroup 
	
       from Sales s
	   join dimproduct_2 p
        on s.ProductKey = p.ProductKey
       
       join  dimprodsubcategory  ps
       on p.ProductSubcategoryKey=ps.ProductSubcategoryKey
       
       join  dimprodcategory pc
       on ps.ProductCategoryKey=pc.ProductCategoryKey
       
      join dimcustomer c
      on s.CustomerKey = c.CustomerKey
       
       join  dimdate d
       on s.OrderDateKey=d.DateKey
       
       join  dimsalesterritory t
       on s.SalesTerritoryKey =t.SalesTerritoryKey ;
       
	
      select * from master_sales ;
      
      select count(*) from master_sales ;
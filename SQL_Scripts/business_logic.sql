-- ---------------------------------------------------------------------------------------------------------------------    
                                     -- altering thr final master_sales table for business calculation --
    -- ------------------------------------------------------------------------------------------------------------------
    
       select * from master_sales ;
       
       select DiscountAmount from master_sales
       where DiscountAmount > 0 ;
       
       alter table master_sales
     drop column ExtendedAmount,
	   drop column DiscountAmount ,
         drop column ProductStandardCost,
       drop column TaxAmt ,
         drop column Freight,
       drop column SalesAmount,
        drop column ProductUnitPrice ;
     
      select * from master_sales ;
     
     alter table master_sales 
     change column finalSalesAmount SalesAmount decimal(10,2);

     -- ------------------------------------------------------------------------------------------------------------    
						--     Business logic calculations on master_sales table --
   -- -------------------------------------------------------------------------------------------------------         
   
ALTER TABLE master_sales
ADD COLUMN finalSalesAmount DECIMAL(12,2),
ADD COLUMN ProductionCost DECIMAL(12,2),
ADD COLUMN Profit DECIMAL(12,2),
ADD COLUMN ProfitMargin DECIMAL(5,2),
ADD COLUMN Year INT,
ADD COLUMN MonthName VARCHAR(20),
ADD COLUMN Quarter VARCHAR(5),
ADD COLUMN FinancialQuarter VARCHAR(5),
ADD COLUMN YearMonth VARCHAR(10);

select * from master_sales ;

set sql_safe_updates=0 ;
UPDATE master_sales
SET 
    finalSalesAmount = OrderQuantity * UnitPrice ,
    ProductionCost = OrderQuantity * StandardCost ,
    Profit = (OrderQuantity * UnitPrice) - (OrderQuantity * StandardCost),
    ProfitMargin = ROUND(((OrderQuantity * UnitPrice) - (OrderQuantity * StandardCost)) / (OrderQuantity * UnitPrice) * 100,2),
      Year = YEAR(OrderDateKey),
    MonthName = MONTHNAME(OrderDateKey),
    Quarter = CONCAT('Q', QUARTER(OrderDateKey)),
    YearMonth = DATE_FORMAT(OrderDateKey, '%Y-%b'),
    FinancialQuarter = CASE 
        WHEN MONTH(OrderDateKey) IN (4,5,6) THEN 'FQ1'
        WHEN MONTH(OrderDateKey) IN (7,8,9) THEN 'FQ2'
        WHEN MONTH(OrderDateKey) IN (10,11,12) THEN 'FQ3'
        ELSE 'FQ4'
    END ;

select * from master_sales ;

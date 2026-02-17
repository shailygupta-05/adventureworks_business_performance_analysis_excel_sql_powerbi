-- ---------------------------------------------------------------------------------------------------------------------
                           -- creating a database for this adventure works end-to-end project --
-- ---------------------------------------------------------------------------------------------------------------------


create database adventureworks_clean;

use  adventureworks_clean;

-- ---------------------------------------------------------------------------------------------------------------------
                           -- loading the tables's data in sql and ensuring the datatype of each column--
-- ---------------------------------------------------------------------------------------------------------------------

select * from fact_internet_sales_new ;

SHOW VARIABLES LIKE 'secure_file_priv';

# 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\'

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/fact_internet_sales_new.csv'
INTO TABLE fact_internet_sales_new
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from fact_internet_sales_new ;

truncate table fact_internet_sales_new ;
select * from fact_internet_sales_new ;

desc  fact_internet_sales_new ;

alter table  fact_internet_sales_new
modify column OrderDateKey date ,
modify column DueDateKey date,
modify column ShipDateKey date,
 modify column UnitPrice decimal(10,2),
modify column ExtendedAmount decimal(10,2),
modify column ProductStandardCost decimal(10,2),
 modify column SalesAmount decimal(10,2),
modify column TaxAmt decimal(10,2),
modify column Freight decimal(10,2) ;

-- ----------------------------------------------------------------------------------------

select * from fact_internet_sales ;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/fact_internet_sales.csv'
INTO TABLE fact_internet_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from fact_internet_sales;

truncate table fact_internet_sales;

select * from fact_internet_sales;

desc  fact_internet_sales ;

alter table  fact_internet_sales
modify column OrderDateKey date ,
modify column DueDateKey date,
modify column ShipDateKey date,
 modify column UnitPrice decimal(10,2),
modify column ExtendedAmount decimal(10,2),
modify column ProductStandardCost decimal(10,2),
 modify column SalesAmount decimal(10,2),
modify column TaxAmt decimal(10,2),
modify column Freight decimal(10,2) ;


-- ------------------------------------------------------------------------------------

select * from dimproduct_2;

desc  dimproduct_2 ;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimproduct_2.csv'
INTO TABLE dimproduct_2
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimproduct_2;

truncate table dimproduct_2;

select * from dimproduct_2;

-- ---------------------------------------------------------------------------------

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimcustomer.csv'
INTO TABLE dimcustomer
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimcustomer;

desc  dimcustomer;

alter table   dimcustomer
modify column BirthDate date,
modify column DateFirstPurchase date;

-- ---------------------------------------------------------------------------------
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimdate.csv'
INTO TABLE dimdate
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimdate;

desc dimdate;

alter table   dimdate
modify column DateKey date,
modify column FullDateAlternateKey date;

alter table   dimdate
modify column DateKey date;
-- --------------------------------------------------------------------------------
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimsalesterritory.csv'
INTO TABLE dimsalesterritory
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimsalesterritory;

desc  dimsalesterritory ;
-- ----------------------------------------------------------------------------

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimprodcategory.csv'
INTO TABLE dimprodcategory
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimprodcategory;

desc dimprodcategory ;
-- ----------------------------------------------------------------------------------------

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adventureworkscsvfiles/dimprodsubcategory.csv'
INTO TABLE dimprodsubcategory
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from dimprodsubcategory;

desc dimprodsubcategory ;


   

  
  
 
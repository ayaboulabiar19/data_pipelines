-- use the dataset AdventureWorksDW2016 
       USE [AdventureWorksDW2016];
EXEC sp_changedbowner 'sa';


--1/Write a query to display the revenue by year and then by country 
       select  
              d.CalendarYear ,
              DST.SalesTerritoryCountry ,
              sum(SalesAmount) 

       from  FactInternetSales as FIS 

       join  DimSalesTerritory as DST on FIS.SalesTerritoryKey = DST.SalesTerritoryKey 

       join DimDate as d  on  FIS.DueDateKey = d.DateKey

       group by
       ROLLUP (CalendarYear ,SalesTerritoryCountry ) ;



 --2/ Display Quantities Sold in the United States by Month of Each Year, by Year, and in Total

       select 
                     CalendarYear ,
                     DT.EnglishMonthName  , 
                     sum(OrderQuantity) 

       from FactInternetSales as FIS 
       join DimSalesTerritory as DST on DST.SalesTerritoryKey  = FIS.SalesTerritoryKey 

       join DimDate as DT  on DT.DateKey = FIS.DueDateKey
       group by grouping sets ((DT.EnglishMonthName , CalendarYear) , (CalendarYear) ,() ); 





 --3/ Display Revenue by Year, Country, and Customer Gender with All Possible Groupings

       SELECT  d.CalendarYear ,
       s.SalesTerritoryCountry , 
       c.Gender,
       SUM(f.SalesAmount) as Revenue

       FROM FactInternetSales as f
       JOIN DimDate as d ON d.DateKey=f.DueDateKey -- join for date
       JOIN DimSalesTerritory as s ON s.SalesTerritoryKey = f.SalesTerritoryKey-- join for country 
       JOIN DimCustomer as c ON c.CustomerKey = f.CustomerKey -- join for customer 

       GROUP BY  CUBE (d.CalendarYear, s.SalesTerritoryCountry,c.Gender);--They are orderd then  in select 

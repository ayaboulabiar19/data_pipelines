--Question 1
--Write a query to calculate the total sales amount by country.
    SELECT  c.country, SUM(s.amount) as total_sales_amount
    FROM Sales as s
    Join Client as c 
    on c.idcli=s.idcli
    GROUP BY  c.country;

--Question 2
--Write a query to calculate the total sales amount by month of each year, then by year, and finally the grand total.

    SELECT d.year, d.month, SUM(s.amount) as total_sales_amount
    FROM Sales as s
    Join Date as d
     on d.idDate=s.idDate
    GROUP BY ROLLUP (d.year, d.month)
    ORDER BY  d.year, d.month;


--Question 3
--Write a query to calculate the quantities of the product "2-inch Screen" sold:

  -- - By country,  

  -- - By year,  

   --- By year for each country,  

   --- And the grand total.
    SELECT 
        c.country,
        d.year,
        SUM(s.quantity) AS total_quantity_sold
    FROM 
        SALES s
    JOIN 
        PRODUCT p 
        ON s.idproduct = p.idproduct
    JOIN 
        CLIENT c 
        ON s.idcli = c.idcli
    JOIN 
        DATE d 
        ON s.idDate = d.idDate
    WHERE 
        p.name = '22-inch Screen'
    GROUP BY 
        ROLLUP(c.country, d.year)
    ORDER BY 
        GROUPING(c.country), c.country,
        GROUPING(d.year), d.year;

--Question 4
--Write a query to calculate the total sales amount:

  -- - By country,  

 --  - By year,  

 --  - And by product. 

    SELECT 
        c.country,
        d.year,
        p.name AS product_name,
        SUM(s.amount) AS total_sales_amount
    FROM 
        SALES s
    JOIN 
        CLIENT c ON s.idcli = c.idcli
    JOIN 
        PRODUCT p ON s.idproduct = p.idproduct
    JOIN 
        DATE d ON s.idDate = d.idDate
    GROUP BY 
        CUBE(c.country, d.year, p.name)
    ORDER BY 
        GROUPING(c.country), c.country,
        GROUPING(d.year), d.year,
        GROUPING(p.name), p.name;
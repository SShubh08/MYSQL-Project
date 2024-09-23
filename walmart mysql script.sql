
SELECT * FROM walmart.walmart;

#Retrieve the store numbers where the weekly sales exceeded 1.5 million dollars.
select store from walmart.walmart where weekly_sales > 1500000;


select * from walmart.walmart;

#Calculate the average weekly sales for all stores.
select store, avg(weekly_sales) from walmart.walmart group by store;

#List the store numbers that had a holiday flag set to 1.
select store from walmart.walmart where holiday_flag = 1;
select sum(weekly_sales) from walmart.walmart where holiday_flag = 0;
select sum(weekly_sales) from walmart.walmart where holiday_flag in(1,0) group by holiday_flAG;

SELECT Holiday_Flag, SUM(Weekly_Sales) AS Total_Sales
FROM walmart.walmart
GROUP BY Holiday_Flag;


select store, sum(weekly_sales)as total_weekly_sales from walmart.walmart group by store;

select store,temperature from walmart.walmart where temperature<40;

select date from walmart.walmart where CPI = (select max(CPI) from walmart.walmart);

SELECT Store, AVG(Weekly_Sales) AS Average_Weekly_Sales
FROM walmart.walmart
GROUP BY Store
ORDER BY Average_Weekly_Sales
LIMIT 1;

select store,sum(weekly_sales)
 from walmart.walmart 
 group by store
 order by store
 desc limit 1;
 
 select holiday_flag,sum(weekly_sales) as total_weekly_sales from walmart.walmart group by holiday_flag;
 
 select store,holiday_flag, weekly_sales from walmart.walmart limit 5;
 
 
 #List the stores with consistently increasing weekly sales over the years (no weeks with decreasing sales)
 SELECT Store
FROM (
    SELECT
        Store,
        YEAR(Date) AS Sales_Year,
        SUM(Weekly_Sales) AS Total_Sales,
        SUM(Weekly_Sales) - LAG(SUM(Weekly_Sales), 52) OVER (PARTITION BY Store ORDER BY Sales_Year) AS YoY_Growth
    FROM
        walmart.walmart
    WHERE
        YEAR(Date) > YEAR(CURDATE()) - 2
    GROUP BY
        Store, Sales_Year
    HAVING
        COUNT(*) = 52
) AS Subquery
WHERE YoY_Growth >= 0
GROUP BY Store;

    
    #Identify the store with the highest weekly sales during holiday weeks.
select store from walmart.walmart where weekly_sales = (select max(weekly_sales) from walmart.walmart where holiday_flag = 1);

#Calculate the average weekly sales for each store, but only consider weeks with temperatures above 70 degrees.
select store, avg(weekly_sales) as avg_weekly_sales from walmart.walmart  where temperature =70 group by store;


#Find the week with the highest total sales and the week with the lowest total sales.
SELECT Date
FROM walmart.walmart
GROUP BY Date
ORDER BY SUM(Weekly_Sales) DESC
LIMIT 1;

SELECT Date
FROM walmart.walmart
GROUP BY Date
ORDER BY SUM(Weekly_Sales)
LIMIT 1;


#Find the store that had the highest sales increase from the previous year during the holiday season.
select store from walmart.walmart where weekly_sales = (select store, year(date) as sales_year  lag(max(weekly_sales)) from walmart.walmart;

    
   

    

 



CREATE TABLE blinkit_data(
"Item Fat Content" VARCHAR(50),
"Item Identifier" VARCHAR(50),
"Item Type" VARCHAR(50),
"Outlet Establishment Year" INT,
"Outlet Identifier" VARCHAR(50),
"Outlet Location Type" VARCHAR(50),
"Outlet Size" VARCHAR(50),
"Outlet Type" VARCHAR(50),
"Item Visibility" FLOAT,
"Item Weight" FLOAT,
Sales FLOAT,
Rating NUMERIC
);

SELECT * FROM blinkit_data;

UPDATE blinkit_data
SET "Item Fat Content"=
CASE 
WHEN "Item Fat Content" IN('LF','low fat') THEN 'Low Fat'
WHEN "Item Fat Content" ='reg'THEN 'Regular'
ELSE "Item Fat Content"
END;

SELECT DISTINCT ("Item Fat Content") FROM blinkit_data;

'TOTAL SALES'
SELECT  CAST (SUM (sales)/1000000 AS DECIMAL(10,2)) AS "Total Sales Million"
FROM blinkit_data;

'AVG SALES'
SELECT CAST(AVG(sales) AS DECIMAL(10,1)) AS "Total Avg Sales"
FROM blinkit_data;

'TOTAL LOW FAT CATEGORY SALES'
SELECT CAST(SUM(sales)/1000000 AS DECIMAL(10,2)) AS "Total LOW FAT Sales"
FROM blinkit_data
WHERE "Item Fat Content" ='Low Fat';

'TOTAL SALES OF  CATEGORY OUTLET ESTABLISHMENT YEAR 2017 '
SELECT CAST(SUM(sales)/1000000 AS DECIMAL(10,1)) AS "Total 2017 YEAR Sales"
FROM blinkit_data
WHERE "Outlet Establishment Year"=2017;

'AVG RATING'
SELECT CAST (AVG(Rating) AS DECIMAL(10,2)) AS "AVG RATING" FROM blinkit_data;

'TOTAL SALES,AVG SALES,RATING AND NO OF ITEMS BY ITEM FAT CONTENT'
SELECT "Item Fat Content",
                      CAST (SUM(Sales)AS DECIMAL(10,2)) AS "Total Sales",
                      CAST (AVG(Sales)AS DECIMAL(10,2)) AS "Avg Sales",
			    	  CAST (AVG(Rating)AS DECIMAL(10,2)) AS "Avg Rating",
					  COUNT(*)AS "No Of items"
FROM blinkit_data
GROUP BY "Item Fat Content"
ORDER BY "Total Sales" DESC

'TOTAL SALES BY ITEM TYPE,AVG SALES,AVG RATING'
SELECT "Item Type",
              CONCAT(ROUND(SUM(Sales)::NUMERIC/1000, 2),'k') AS "Total sales By Item Type",
			  CAST(AVG(Sales) AS DECIMAL(10,2)) AS "Total avg Sales By Item Type",
			  CAST (AVG(Rating) AS DECIMAL(10,2)) AS "Avg Rating By Item Type",
			  COUNT(*) AS "No Of Items"			  
FROM blinkit_data			  
WHERE "Outlet Location Type" = 'Tier 2'		  
GROUP BY "Item Type"
ORDER BY "Total sales By Item Type" ASC
LIMIT 5 

'TOTAL SALES BY OUTLET AND FAT CONTENT'

SELECT "Outlet Location Type","Item Fat Content",
               CONCAT(ROUND(SUM(Sales)::NUMERIC/1000,2),'K')AS "TOTAL SALES",
			   CONCAT(ROUND(AVG(Sales)::NUMERIC/1000,2),'K') AS"AVG SALES",
			   CAST(AVG(Rating) AS DECIMAL(10,2)) AS "AVG RATING",
			   COUNT(*) AS "NO OF ITEMS"
FROM blinkit_data
GROUP BY "Outlet Location Type","Item Fat Content";

'FAT CONTENT BY OUTLET FOR TOTAL SALES'
SELECT  "Outlet Location Type",
    CONCAT(ROUND(SUM(CASE WHEN "Item Fat Content" = 'Low Fat' THEN Sales ELSE 0 END)::NUMERIC / 1000, 2), 'K') AS "LOW FAT",
    CONCAT(ROUND(SUM(CASE WHEN "Item Fat Content" = 'Regular' THEN Sales ELSE 0 END)::NUMERIC / 1000, 2), 'K') AS "REGULAR"
FROM blinkit_data
GROUP BY "Outlet Location Type"
ORDER BY "Outlet Location Type";

'TOTAL SALES BY OUTLET ESTABLISHMENT YEAR WISE'

SELECT "Outlet Establishment Year",
         CONCAT(ROUND(SUM(sales)::NUMERIC/1000,2),'K') AS "Total Sales",
		 CONCAT(ROUND(AVG(Sales)::NUMERIC/1000,2),'K') AS "AVG SALES",
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS "AVG RATING",
		 COUNT(*)AS "No of Items"
FROM blinkit_data
GROUP BY "Outlet Establishment Year"
ORDER BY SUM(Sales) DESC

'PERCENTAGE OF SALES BY OUTLET SIZE'
SELECT "Outlet Size",
        CONCAT(ROUND(SUM(Sales)::NUMERIC/1000,2),'K')AS "TOTAL SALES",
		CAST((SUM(Sales)*100.0/SUM(SUM(Sales))OVER())AS DECIMAL(10,2)) AS "Sales Percentage"
FROM blinkit_data
GROUP BY "Outlet Size"
ORDER BY SUM(Sales) DESC

'TOTAL SALES BY OUTLET LOCATION TYPE'
SELECT "Outlet Location Type",
       CONCAT(ROUND(SUM(Sales)::NUMERIC/1000,2),'K') AS "Total Sales",
	   CONCAT(ROUND(AVG(Sales)::NUMERIC/1000,2),'K') AS "AVG SALES",
	   CAST((SUM(Sales)*100.0/SUM(SUM(Sales))OVER()) AS DECIMAL(10,2)) AS "Sales percentage",
	   COUNT(*)"NO OF ITEMS",
	   CAST(AVG(Rating)AS DECIMAL(10,2)) AS" AVG RATING"
FROM blinkit_data
WHERE "Outlet Establishment Year"=2020
GROUP BY "Outlet Location Type"
ORDER BY SUM(Sales) DESC

'ALL METRIC BY OUTLET TYPE'
SELECT "Outlet Type",
       CONCAT(ROUND(SUM(Sales)::NUMERIC/1000,2),'K') AS "TOTAL SALES",
	   CONCAT(ROUND(AVG(Sales)::NUMERIC/1000,2),'K') AS "AVG SALES",
	   CAST((SUM(Sales)*100.0/SUM(SUM(Sales))OVER()) AS DECIMAL(10,2)) AS" SALES PERCENTAGE",
	   COUNT(*)"NO OF ITEMS",
	   CAST(AVG(Rating) AS DECIMAL(10,2)) AS "AVG RATING"
FROM blinkit_data
GROUP BY "Outlet Type"
ORDER BY SUM(Sales) DESC
 

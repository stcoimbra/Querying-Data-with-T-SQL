-- LAB 2 --
/*
-- L2 | C1 | Q1 --
SELECT DISTINCT
    City, 
    StateProvince
FROM
    Address    

------------------
-- L2 | C1 | Q2 --
SELECT TOP 10 PERCENT 
    Name, Weight 
FROM Product 
ORDER BY Weight DESC   

------------------
-- L2 | C1 | Q3 --
SELECT 
    Name, Weight 
FROM Product 
ORDER BY Weight DESC 
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY 

------------------
-- L2 | C2 | Q1 --

SELECT
    Name,
    Color,
    Size 
FROM 
    Product
WHERE ProductModelID = 1    

------------------
-- L2 | C2 | Q2 --

SELECT
    ProductNumber,
    Name ,
    Color,
    Size
FROM Product
WHERE color IN ('black', 'red', 'white')  AND 
      size IN ('S','M')
ORDER BY Color, Size 

------------------
-- L2 | C2 | Q3 --

SELECT
    ProductNumber,
    Name,
    ListPrice
FROM Product
WHERE ProductNumber LIKE 'BK-%'    

------------------
-- L2 | C2 | Q4 --

SELECT
    ProductNumber,
    Name,
    ListPrice
FROM Product
WHERE ProductNumber LIKE 'BK-%' AND ProductNumber NOT LIKE '___R%' */
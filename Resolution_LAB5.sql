-- LAB 5 --
-- L5 | C1 | Q1 --

SELECT 
ProductID,
UPPER(Name) AS Name, 
CAST(ROUND(Weight, 0) AS INT) AS ApproxWeight
FROM Product
ORDER BY ProductID

--------------------------
-- L5 | C1 | Q2 --

SELECT 
ProductID,
UPPER(Name) AS Name, 
CAST(ROUND(Weight, 0) AS INT) AS ApproxWeight,
YEAR(SellStartDate) AS SellStartYear,
DATENAME(month, SellStartDate) AS SellStartMonth
FROM Product
ORDER BY ProductID

--------------------------
-- L5 | C1 | Q3 --

SELECT ProductID, UPPER(Name) AS Name,
CAST(ROUND(Weight, 0) AS INT) AS ApproxWeight,
LEFT(ProductNumber,2) AS ProductType, --AN ALTERNATIVE WOULD BE TO USE SUBSTRING(column, Start_Pos, Lenght)-In this case it would be substring(ProductNumber,1,2)
YEAR(SellStartDate) AS SellStartYear,
DATENAME(month, SellStartDate) AS SellStartMonth
FROM Product
ORDER BY ProductID

--------------------------
-- L5 | C1 | Q4 --

SELECT ProductID, UPPER(Name) AS Name,
CAST(ROUND(Weight, 0) AS INT) AS ApproxWeight,
LEFT(ProductNumber,2) AS ProductType, -AN ALTERNATIVE WOULD BE TO USE SUBSTRING(column, Start_Pos, Lenght)-In this case it would be substring(ProductNumber,1,2)
YEAR(SellStartDate) AS SellStartYear,
DATENAME(month, SellStartDate) AS SellStartMonth
FROM Product
WHERE ISNUMERIC(Size) = 1
ORDER BY ProductID

--------------------------
-- L5 | C2 | Q1 --

SELECT  c.CompanyName, TotalDue,
RANK() OVER(ORDER BY soh.TotalDue DESC) AS RankByTotalDue
FROM Customer AS c 
JOIN SalesOrderHeader AS soh 
ON c.CustomerID = soh.CustomerID
ORDER BY RankByTotalDue;

--------------------------
-- L5 | C3 | Q1 --

SELECT 
p.Name, SUM(LineTotal) AS 'Total Revenue',
RANK() OVER(ORDER BY SUM(LineTotal) DESC) AS RankByLINETOTAL
FROM Product AS p 
JOIN SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY SUM(LineTotal) DESC

--------------------------
-- L5 | C3 | Q2 --

SELECT 
p.Name, SUM(LineTotal) AS 'Total Revenue',
RANK() OVER(ORDER BY SUM(LineTotal) DESC) AS RankByLINETOTAL, AVG(p.ListPrice)
FROM Product AS p 
JOIN SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
WHERE 'p.ListPrice' > 1000
GROUP BY p.Name
ORDER BY SUM(LineTotal) DESC

--------------------------
-- L5 | C3 | Q3 --

SELECT 
p.Name, SUM(LineTotal) AS 'Total Revenue',
RANK() OVER(ORDER BY SUM(LineTotal) DESC) AS RankByLINETOTAL, AVG(p.ListPrice)
FROM Product AS p 
JOIN SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING SUM(LineTotal) > 20000
ORDER BY SUM(LineTotal) DESC
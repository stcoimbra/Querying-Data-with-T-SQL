-- LAB 7 --
-- L7 | C1 | Q1 --

SELECT * FROM SalesLT.vProductModelCatalogDescription

SELECT p.ProductID, p.Name, pm.Name, pmd.Summary
FROM Product AS p 
JOIN ProductModel AS pm 
ON p.ProductModelID = pm.ProductModelID
JOIN SalesLT.vProductModelCatalogDescription AS pmd 
ON p.ProductModelID= pmd.ProductModelID
ORDER BY p.ProductID

-- L7 | C1 | Q2 --

-- SELECT * from Product

DECLARE @Prod_Colors AS TABLE (Color VARCHAR(15))
INSERT INTO @Prod_Colors
SELECT DISTINCT Color 
FROM Product 

SELECT ProductID, Name, Color 
FROM Product
WHERE Color IN (SELECT Color
                FROM @Prod_Colors)

-- L7 | C1 | Q3 --

SELECT p.ProductID, 
par_cat.ParentProductCategoryName AS ParentCategory,
par_cat.ProductCategoryName AS Category,
p.Name AS ProductName
FROM Product AS p 
JOIN dbo.ufnGetAllCategories() AS par_cat 
ON p.ProductCategoryID = par_cat.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName

-- L7 | C2 | Q1 --

SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM	
(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue	 
FROM SalesOrderHeader AS SOH	 
JOIN Customer AS c	 
ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)
GROUP BY CompanyContact
ORDER BY CompanyContact;




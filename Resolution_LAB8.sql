-- LAB 8 --
-- L8 | C1 | Q1 --

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM Address AS a
JOIN CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY IsNull(a.CountryRegion,'zzzzz'), IsNull(a.StateProvince,'zzzzz');

 -- L8 | C1 | Q2 --

SELECT a.CountryRegion, a.StateProvince,
SUM(soh.TotalDue) AS Revenue,
GROUPING_ID(a.CountryRegion, a.StateProvince)  AS Level_ID,
IIF(GROUPING_ID(a.CountryRegion, a.StateProvince) = 0,a.StateProvince + ' SubTotal',
IIF(GROUPING_ID(a.CountryRegion, a.StateProvince) = 1,a.CountryRegion + ' SubTotal','Total')) AS Level_Dscr
FROM Address AS a
JOIN CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY IsNull(a.CountryRegion,'zzzzz'), IsNull(a.StateProvince,'zzzzz');

-- L8 | C1 | Q3 --

SELECT a.CountryRegion, a.StateProvince, a.City,
SUM(soh.TotalDue) AS Revenue,
IIF(GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 0, a.City + ', '+ a.StateProvince + ' SubTotal',
IIF(GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 1, a.StateProvince + ' SubTotal',
IIF(GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 3, a.CountryRegion + ' SubTotal','Total'))) AS Level_Dscr
FROM Address AS a
JOIN CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince,a.City)
ORDER BY a.CountryRegion, a.StateProvince,a.City

-- L8 | C2 | Q1 --

SELECT * FROM (
SELECT p_cat.ParentProductCategoryName, CompanyName,  LineTotal 
FROM SalesOrderDetail AS sod
JOIN SalesOrderHeader AS soh
ON sod.SalesOrderID = soh.SalesOrderID
JOIN Customer as c  
ON c.CustomerID = soh.CustomerID
JOIN Product AS p 
ON sod.ProductID = p.ProductID
JOIN SalesLT.vGetAllCategories AS p_cat
ON p.ProductCategoryID = p_cat.ProductCategoryID) AS cat_sales
PIVOT (SUM(LineTotal)FOR ParentProductCategoryName
IN ([Accessories], [Bikes], [Clothing], [Components])) AS pivotedsales
ORDER BY CompanyName
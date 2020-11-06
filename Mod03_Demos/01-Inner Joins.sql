SELECT * FROM Product 
SELECT * FROM ProductCategory
SELECT * FROM SalesOrderHeader
SELECT * FROM SalesOrderDetail

--Basic inner join
SELECT p.Name As ProductName, pc.Name AS Category, pc.ProductCategoryID
FROM Product p
INNER JOIN ProductCategory pc
ON p.ProductCategoryID = pc.ProductCategoryID;

-- Table aliases
SELECT p.Name As ProductName, pc.Name AS Category, pc.ParentProductCategoryID
FROM Product AS p
JOIN ProductCategory As pc
ON p.ProductCategoryID = pc.ProductCategoryID;

-- Joining more than 2 tables
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name As ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN Product AS p
ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;

-- Multiple join predicates
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name As ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesOrderHeader AS oh
JOIN SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN Product AS p
ON od.ProductID = p.ProductID AND od.UnitPrice = p.ListPrice --Note multiple predicates
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID; 

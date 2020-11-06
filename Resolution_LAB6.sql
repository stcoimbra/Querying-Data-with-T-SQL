-- LAB 6 --
-- L6 | C1 | Q1 --

SELECT ProductID, Name, ListPrice
From Product 
WHERE ListPrice > (SELECT AVG(ListPrice)
                   FROM Product)
ORDER BY ProductID,ListPrice ASC                

-- L6 | C1 | Q2 --

SELECT ProductID, Name, ListPrice
FROM Product AS p
WHERE ListPrice >= 100 AND ProductID IN (SELECT ProductID
                                         FROM SalesOrderDetail
                                         WHERE UnitPrice < 100) 
ORDER BY ProductID                                          

-- L6 | C1 | Q3 --

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice)
                                                  FROM SalesOrderDetail AS sod
                                                  WHERE p.ProductID = sod.ProductID) AS 'Avg Unit Price'
FROM Product p
ORDER BY CASE WHEN 
        (SELECT AVG(UnitPrice)
        FROM SalesOrderDetail AS sod
        WHERE p.ProductID = sod.ProductID) IS NULL 
       THEN 1 ELSE 0 
       END, 'Avg Unit Price'

-- L6 | C1 | Q4 --

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice)
                                                  FROM SalesOrderDetail AS sod
                                                  WHERE p.ProductID = sod.ProductID) AS 'Avg Unit Price'
FROM Product p
WHERE p.StandardCost > (SELECT AVG(UnitPrice)
                        FROM SalesOrderDetail AS sod
                        WHERE p.ProductID = sod.ProductID)
ORDER BY CASE WHEN 
        (SELECT AVG(UnitPrice)
        FROM SalesOrderDetail AS sod
        WHERE p.ProductID = sod.ProductID) IS NULL 
        THEN 1 ELSE 0 
        END, 'Avg Unit Price'


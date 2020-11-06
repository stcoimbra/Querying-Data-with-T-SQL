-- LAB 3 --
-- L3 | C1 | Q1 --

SELECT
    c.CompanyName,
    soh.SalesOrderID,
    soh.TotalDue
FROM Customer AS c
INNER JOIN SalesOrderHeader soh --INNER pode não se por
ON c.CustomerID = soh.CustomerID

----------------------------- 
-- L3 | C1 | Q2 --

SELECT
    c.CompanyName,  
    soh.SalesOrderID, soh.TotalDue,
    ad.AddressLine1, ISNULL(ad.AddressLine2, '') AS AddressLine2,
    ad.PostalCode, ad.CountryRegion,
    ad.City, ad.StateProvince
FROM Customer AS c
JOIN SalesOrderHeader AS soh --INNER pode não se pôr
ON c.CustomerID = soh.CustomerID
JOIN CustomerAddress AS custAdd 
ON c.CustomerID = custAdd.CustomerID AND AddressType = 'Main Office'
JOIN Address AS ad 
ON custAdd.AddressID = ad.AddressID


------------------- 
-- L3 | C2 | Q1 --

SELECT
    c.CompanyName AS 'Company',
    c.FirstName, + ' ' + c.LastName AS 'Contact',
    soh.SalesOrderID,
    soh.TotalDue AS 'Total Due'
FROM Customer AS c
LEFT JOIN SalesOrderHeader AS soh 
ON c.CustomerID = soh.CustomerID
ORDER BY soh.TotalDue DESC  

------------------- 
-- L3 | C2 | Q2 --

SELECT
    c.CustomerID, c.CompanyName, 
    c.FirstName +' '+ c.LastName AS 'Contact',
    c.Phone
FROM Customer AS c 
LEFT JOIN CustomerAddress AS custAdd 
ON c.CustomerID = custAdd.CustomerID 
LEFT JOIN Address AS ad 
ON custAdd.AddressID = ad.AddressID
WHERE ad.AddressLine1 IS NULL

------------------- 
-- L3 | C2 | Q3 --

SELECT
    c.CustomerID,
    p.ProductID, soh.SalesOrderID
FROM Customer AS c 
FULL JOIN SalesOrderHeader AS soh 
ON c.CustomerID = soh.CustomerID
FULL JOIN SalesOrderDetail AS sod 
ON soh.SalesOrderID = sod.SalesOrderID
FULL JOIN Product AS p 
ON sod.ProductID = p.ProductID
WHERE c.CustomerID IS NULL OR p.ProductID IS NULL
ORDER BY 
    CASE 
        WHEN c.CustomerID IS NULL 
        THEN 1 ELSE 0 
        END, 
        c.CustomerID,p.ProductID 
-- LAB 4 --
-- L4 | C1 | Q1 --

SELECT 
    c.CompanyName, ad.AddressLine1,
    ad.City,
    'Billing' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN Address AS ad 
ON ca.AddressID = ad.AddressID
WHERE ca.AddressType = 'Main Office'    

------------------
-- L4 | C1 | Q2 --

SELECT 
    ca.AddressID,c.CompanyName, ad.AddressLine1,
    ad.City, 
    'Shipping' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN Address AS ad 
ON ca.AddressID = ad.AddressID
WHERE ca.AddressType != 'Main Office'    
Order BY AddressID
------------------
-- L4 | C1 | Q3 --

SELECT 
    c.CompanyName, ad.AddressLine1,
    ad.City,
    'Billing' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
JOIN Address AS ad ON ca.AddressID = ad.AddressID
WHERE ca.AddressType = 'Main Office'    
UNION 
SELECT 
    c.CompanyName, ad.AddressLine1,  ad.City, 
    'Shipping' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
JOIN Address AS ad ON ca.AddressID = ad.AddressID
WHERE ca.AddressType != 'Main Office'
ORDER BY c.CompanyName

--AALTERNATIVE MORE SIMPLE - USES THE CASE

/*SELECT  c.CompanyName, ad.AddressLine1,
    ad.City,
    CASE WHEN ca.AddressType = 'Main Office'
               THEN 'Billing'
               ELSE 'Shipping'
          END AS 'AddressType'
FROM Customer AS c 
JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
JOIN Address AS ad ON ca.AddressID = ad.AddressID
ORDER BY c.CompanyName 

THE SECOND EVEN MORE INTELLIGENT ALTERNATIVE WOULD BE TO CREATE TWO TABLES.
EVEN FOR THE FOLLOWING EXERCISES IT WILL COME IN HANDY */ 

/*CREATE TABLE Address_Shiping 
(AddressID int PRIMARY KEY,
CompanyName VARCHAR(50) NOT NULL,
Address1 VARCHAR(100),
City VARCHAR(50),
AddresType VARCHAR(50) NOT NULL)

INSERT INTO Address_Shiping
SELECT ca.AddressID,c.CompanyName, ad.AddressLine1,
    ad.City, 
    'Shipping' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN Address AS ad 
ON ca.AddressID = ad.AddressID
WHERE ca.AddressType != 'Main Office' 

CREATE TABLE Address_MainOffice 
(AddressID int PRIMARY KEY,
CompanyName VARCHAR(50) NOT NULL,
Address1 VARCHAR(100),
City VARCHAR(50),
AddresType VARCHAR(50) NOT NULL)

INSERT INTO Address_MainOffice
SELECT ca.AddressID,c.CompanyName, ad.AddressLine1,
    ad.City, 
    'Billing' AS 'AddresType'
FROM Customer AS c 
JOIN CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN Address AS ad 
ON ca.AddressID = ad.AddressID
WHERE ca.AddressType = 'Main Office'

SELECT * FROM Address_Shiping
UNION ALL
SELECT * FROM Address_MainOffice
ORDER BY CompanyName, AddresType */

--------------------------
-- L4 | C2 | Q1 --

SELECT CompanyName FROM Address_MainOffice
WHERE CompanyName NOT IN (SELECT CompanyName from Address_Shiping)
ORDER BY CompanyName

--------------------------
-- L4 | C2 | Q2 --


SELECT CompanyName FROM Address_MainOffice
WHERE CompanyName IN (SELECT CompanyName from Address_Shiping)
ORDER BY CompanyName
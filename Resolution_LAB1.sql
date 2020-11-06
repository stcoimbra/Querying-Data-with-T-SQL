--LAB 1 --
-- L1 | C1 | Q1 -- 
/* 

SELECT *
FROM Customer

--Select only the name of columns --

SELECT TOP 0 *
FROM Customer

------------------
-- L1 | C1 | Q2 -- 

SELECT 
    FirstName + ' '+
    ISNULL(MiddleName + ' ',' ') +
    LastName + ' '+
    ISNULL(Suffix+' ','') AS 'Full Name'
FROM
    Customer


------------------
-- L1 | C1 | Q3 -- 
SELECT  
    SalesPerson AS 'Sales Person',
    iSNULL(Title,'') + 
    FirstName AS CustomerName,
    Phone As 'Phone Number'
From Customer 


------------------
--L1 | C2 | Q1 ---

SELECT
     CAST(CustomerID AS VARCHAR(10)) + ' : ' + CompanyName AS "Customer's Company"
    --Alternativa a "CAST": CONVERT(varchar(10), CustomerID)
FROM
    Customer 

-----------------
--L1 | C2 | Q2 --

SELECT
   CAST(SalesOrderNumber AS varchar(50))+ '(' + 
   CAST(RevisionNumber AS varchar(50))+ ')' AS 'Sales Order',
   CONVERT(varchar, OrderDate, 102) AS 'Order Date'
FROM
    SalesOrderHeader   

--------------------
-- L1 | C3 | Q1 --
SELECT 
    FirstName + ' '+
    ISNULL(MiddleName+ ' ','')+
    LastName AS 'Full Name'
FROM  
    Customer

--------------------------
-- L1 | C3 | Q2 --
UPDATE Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1 --Numbers where the rest of the division gives 1

SELECT
    CustomerID,
    ISNULL(EmailAddress,Phone) AS ' PrimaryContact'
FROM
    Customer */

----------------------------
-- L1 | C3 | Q3 --

UPDATE SalesOrderHeader 
SET ShipDate = NULL 
WHERE SalesOrderID > 71899;


SELECT SalesOrderID,
    OrderDate,
    CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS ShippingStatus
FROM SalesOrderHeader


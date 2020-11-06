-- LAB 10 --
-- L10 | C1 | Q1 --

DECLARE @Order_Date DATE  = GETDATE() 
DECLARE @Due_Date DATE =  DATEADD(dd , 7 , @Order_Date )
DECLARE @Customer_ID INTEGER = 1
DECLARE @SalesOrderID INTEGER = (SELECT COUNT(SalesOrderNumber) + 1
FROM SalesOrderHeader)

INSERT INTO 
    SalesOrderHeader(
        SalesOrderID,  OrderDate, DueDate, CustomerID,  ShipMethod)
VALUES (@SalesOrderID,@Order_Date,@Due_Date,@Customer_ID, 'CARGO TRANSPORT 5')


SELECT SalesOrderID, OrderDate, DueDate, CustomerID, ShipMethod
FROM SalesOrderHeader
WHERE
SHipMethod ='CARGO TRANSPORT 5'

-- L10 | C1 | Q2 --
SELECT * FROM SalesOrderHeader
SELECT * FROM SalesOrderDetail

DECLARE  @salesorderID integer = 0
DECLARE @ProductID integer = 760
DECLARE @Quantity INTEGER = 1
DECLARE @UnitPrice SMALLMONEY = 782.99
DECLARE @salesorderdetailID integer = (SELECT MAX(SalesOrderDetailID) + 1 FROM SalesOrderDetail)

IF EXISTS(
    SELECT * FROM SalesOrderHeader
    WHERE SalesOrderID = (@salesorderID))
BEGIN --Quando só temos uma condição, esta parte não era necessária
INSERT INTO 
    SalesOrderDetail
    (
        ProductID, UnitPrice, OrderQty, SalesOrderID, SalesOrderDetailID)       
VALUES(@ProductID,@UnitPrice,@Quantity,@salesorderID,@salesorderdetailID)
END --When we only have one condition, this part is not necessary
ELSE
PRINT 'The order does not exist'

-- L10 | C2 | Q2 --

SELECT * FROM SalesLT.vGetAllCategories

DECLARE @AVG_Bike_Price SMALLMONEY = 2000
DECLARE @MXM_Bike_Price SMALLMONEY = 5000
DECLARE @parProCatName VARCHAR(50) = 'Bikes'

DECLARE @actual_bike_AVG MONEY = (
    SELECT AVG(ListPrice)
    FROM Product prod
    WHERE ProductCategoryID IN (SELECT ProductCategoryID
                                FROM SalesLT.vGetAllCategories
                                WHERE ParentProductCategoryName = @parProCatName))

DECLARE @actual_bike_MAX MONEY = (
    SELECT MAX(ListPrice)
    FROM Product prod
    WHERE ProductCategoryID IN (SELECT ProductCategoryID
                                FROM SalesLT.vGetAllCategories
                                WHERE ParentProductCategoryName = @parProCatName))

PRINT 'New average bike price:' + CONVERT(varchar, @actual_bike_AVG);
PRINT 'New maximum bike price:' + CONVERT(varchar, @actual_bike_MAX)                              

WHILE
   @actual_bike_AVG < @AVG_Bike_Price  AND  @actual_bike_MAX < @MXM_Bike_Price
BEGIN   
UPDATE Product
    SET ListPrice = (ListPrice * 1.1)
    WHERE ProductCategoryID IN (SELECT ProductCategoryID
                                FROM Saleslt.vGetAllCategories
                                WHERE ParentProductCategoryName = @parProCatName)

SELECT @actual_bike_AVG =  AVG(ListPrice), @actual_bike_MAX = MAX(ListPrice)
FROM Product
WHERE ProductCategoryID IN (SELECT ProductCategoryID
                            FROM saleslt.vGetAllCategories
                            WHERE ParentProductCategoryName = @parProCatName);
PRINT 'New average bike price:' + CONVERT(varchar, @actual_bike_AVG);
PRINT 'New maximum bike price:' + CONVERT(varchar, @actual_bike_MAX);
END


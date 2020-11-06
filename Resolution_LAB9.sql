-- LAB 9 --
-- L9 | C1 | Q1 --

INSERT INTO Product (
ProductID,Name, ProductNumber, StandardCost,ListPrice, ProductCategoryID, SellStartDate)
VALUES((SELECT MAX(ProductID) + 1 FROM Product), 'LED Lights_t2','LT-L123_t2',2.56,12.99,37,GETDATE())

select * from Product
WHERE NAME LIKE 'LED %'
Order BY ProductID DESC

------------------------
-- L9 | C1 | Q2 --

select * from Product
SELECT * from ProductCategory
ORDER BY ModifiedDate DESC

INSERT INTO ProductCategory (
     ProductCategoryID,ParentProductCategoryID, Name)
     VALUES(42,4,'Bells and Horns')


INSERT INTO Product (
ProductID ,Name, ProductNumber, StandardCost,ListPrice, ProductCategoryID, SellStartDate)
VALUES
    ((SELECT MAX(ProductID) + 1 FROM Product), 'Bicycle Bell','BB-RING', 2.47, 4.99, 42, GETDATE()),
    ((SELECT MAX(ProductID) + 2 FROM Product), 'Bicycle Horn','BB-PARP', 1.29, 3.75, 42, GETDATE())


------------------------
-- L9 | C2 | Q1 --   

DECLARE @cat_1 VARCHAR(50)
SET @cat_1 = (SELECT ProductCategoryID
            FROM ProductCategory
            WHERE Name = 'Bells and Horns')

PRINT @cat_1

UPDATE Product 
 SET ListPrice = ListPrice * 1.1
 WHERE ProductCategoryID = @cat_1

------------------------
-- L9 | C2 | Q2 -- 

UPDATE Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = (SELECT ProductCategoryID
                           FROM ProductCategory
                           WHERE Name = 'Lights')
AND ProductNumber NOT IN ('LT-L123','LT-L1234','LT-L123_t2')


------------------------
-- L9 | C3 | Q1 --                           

DELETE FROM Product
WHERE ProductCategoryID = (SELECT ProductCategoryID
                            FROM ProductCategory
                            WHERE Name = 'Bells and Horns')

SELECT * FROM Product                            
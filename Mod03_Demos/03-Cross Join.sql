--Call each customer once per product
SELECT * FROM Customer
Select * FROM Product

SELECT p.Name, c.FirstName, c.LastName, c.Phone
FROM Product as p
CROSS JOIN Customer as c;

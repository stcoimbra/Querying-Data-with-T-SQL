--note there's no employee table, so we'll create one for this example
SELECT * from customer
drop table Employee
CREATE TABLE Employee
(EmployeeID int IDENTITY PRIMARY KEY,
EmployeeName nvarchar(256),
ManagerID int);
GO
-- Get salesperson from Customer table and generate managers
INSERT INTO Employee (EmployeeName, ManagerID)
SELECT DISTINCT Salesperson, NULLIF(CAST(RIGHT(SalesPerson, 1) as INT), 0)
FROM Customer;
GO
UPDATE Employee
SET ManagerID = (SELECT MIN(EmployeeID) FROM Employee WHERE ManagerID IS NULL)
WHERE ManagerID IS NULL
AND EmployeeID > (SELECT MIN(EmployeeID) FROM Employee WHERE ManagerID IS NULL);
GO
 
-- Here's the actual self-join demo
SELECT * FROM Employee

SELECT e.EmployeeName, m.EmployeeName AS ManagerName
FROM Employee AS e
LEFT JOIN Employee AS m
ON e.ManagerID = m.EmployeeID
ORDER BY e.ManagerID;

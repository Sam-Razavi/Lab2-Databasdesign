SELECT FirstName, LastName
FROM Employees;

-- Exercise 12: Find the category of product 'Lakkalikööri'
SELECT p.ProductName, c.CategoryName, c.CategoryID
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductName = 'Lakkalikööri';

-- Exercise 16: Total order sum on 1996-12-12 (with discounts)
SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalOrderSum
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate = '1996-12-12';

-- Exercise 19: Prices before and after 20% increase for products in CategoryID 4

-- Before increase
SELECT ProductName, UnitPrice AS OldPrice
FROM Products
WHERE CategoryID = 4;

-- Update (commented out for safety)
-- UPDATE Products
-- SET UnitPrice = UnitPrice * 1.2
-- WHERE CategoryID = 4;

-- After increase (calculated view, not actually updated)
SELECT ProductName, 
       UnitPrice AS CurrentPrice,
       UnitPrice * 1.2 AS NewPrice
FROM Products
WHERE CategoryID = 4;

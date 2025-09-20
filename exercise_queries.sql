USE Northwind;
GO

-- Uppgift 12: Till vilken kategori (CategoryName, CategoryID, Categories) hör produkten 'Lakkalikööri'
SELECT p.ProductName, c.CategoryName, c.CategoryID
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductName = 'Lakkalikööri';

-- Output:
-- ProductName   CategoryName   CategoryID
-- Lakkalikööri  Beverages      1

-- Uppgift 16: Hur stor var den totala ordersumman 96-12-12 med tanke på rabatetn

SELECT SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalOrderSum
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate = '1996-12-12';

-- Output:
-- TotalOrderSum
-- 1425.81996

-- Uppgift 19: Priserna på alla produkter i kategorin 4 före och efter en 20% prishöjning
--Innan prishöjningen
SELECT ProductName, UnitPrice AS OldPrice
FROM Products
WHERE CategoryID = 4;

-- Output:

-- ProductName                     OldPrice
-- Queso Cabrales                 21.0000
-- Queso Manchego La Pastora      38.0000
-- Gorgonzola Telino              12.5000
-- Mascarpone Fabioli             32.0000
-- Geitost                        2.5000
-- Raclette Courdavault           55.0000
-- Camembert Pierrot              34.0000
-- Gudbrandsdalsost               36.0000
-- Flotemysost                    21.5000
-- Mozzarella di Giovanni         34.8000

-- Efter prishöjningen
SELECT ProductName, UnitPrice AS CurrentPrice, UnitPrice * 1.2 AS NewPrice
FROM Products
WHERE CategoryID = 4;

-- Output:
-- ProductName                     CurrentPrice   NewPrice
-- Queso Cabrales                 21.0000        25.2000
-- Queso Manchego La Pastora      38.0000        45.6000
-- Gorgonzola Telino              12.5000        15.0000
-- Mascarpone Fabioli             32.0000        38.4000
-- Geitost                        2.5000         3.0000
-- Raclette Courdavault           55.0000        66.0000
-- Camembert Pierrot              34.0000        40.8000
-- Gudbrandsdalsost               36.0000        43.2000
-- Flotemysost                    21.5000        25.8000
-- Mozzarella di Giovanni         34.8000        41.7600

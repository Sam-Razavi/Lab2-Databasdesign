USE Northwind;
GO

--Uppgift 21: Priserna på alla produkter höjs med 15%

-- We check for the prodecur and drop it if it exists
IF OBJECT_ID('dbo.spRaisePrices', 'P') IS NOT NULL
    DROP PROCEDURE dbo.spRaisePrices;
GO

-- We then create the stored procedure
CREATE PROCEDURE dbo.spRaisePrices
AS
BEGIN
    UPDATE Products
    SET UnitPrice = UnitPrice * 1.05;
END
GO

-- Test for demo purposes with ROLLBACK to avoid permanent changes
BEGIN TRANSACTION;

    -- Before
    SELECT TOP 5 ProductName, UnitPrice AS BeforePrice
    FROM Products
    ORDER BY ProductID;

    -- We run the procedure 
    EXEC dbo.spRaisePrices;

    -- After 
    SELECT TOP 5 ProductName, UnitPrice AS AfterPrice
    FROM Products
    ORDER BY ProductID;

-- we now undo everything so the database stays clean
ROLLBACK TRANSACTION;

-- Verify rollback worked (prices should be back to original)
SELECT TOP 5 ProductName, UnitPrice AS PriceAfterRollback
FROM Products
ORDER BY ProductID;

-- output:

-- ProductName                     BeforePrice
--Chai	                           18.00
--Chang	                           19.00
--Aniseed Syrup	                   10.00
--Chef Anton's Cajun Seasoning	   22.00
--Chef Anton's Gumbo Mix	       21.35

--ProductName	                   AfterPrice
--Chai	                           18.90
--Chang	                           19.95
--Aniseed Syrup	                   10.50
--Chef Anton's Cajun Seasoning	   23.10
--Chef Anton's Gumbo Mix	       22.4175

--ProductName	                   PriceAfterRollback
--Chai	                           18.00
--Chang	                           19.00
--Aniseed Syrup	                   10.00
--Chef Anton's Cajun Seasoning	   22.00
--Chef Anton's Gumbo Mix	       21.35

--Uppgift 23: Skapa en vy som visar produktnamn, kategorinamn och pris
-- Drop the view if it already exists 
IF OBJECT_ID('dbo.vProductCategoryPrice', 'V') IS NOT NULL
    DROP VIEW dbo.vProductCategoryPrice;
GO

-- We the create the view
CREATE VIEW dbo.vProductCategoryPrice
AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    p.UnitPrice AS Price
FROM dbo.Products AS p
JOIN dbo.Categories AS c
  ON p.CategoryID = c.CategoryID;
GO

-- We test the view
SELECT TOP 10 * 
FROM dbo.vProductCategoryPrice
ORDER BY ProductID;

-- Output:

--ProductID	                  ProductName	                         CategoryName	         Price
--1	                          Chai	                                 Beverages	             18.00
--2	                          Chang	                                 Beverages	             19.00
--3	                          Aniseed Syrup	                         Condiments	             10.00
--4	                          Chef Anton's Cajun Seasoning	         Condiments	             22.00
--5	                          Chef Anton's Gumbo Mix	             Condiments	             21.35
--6	                          Grandma's Boysenberry Spread	         Condiments	             25.00
--7	                          Uncle Bob's Organic Dried Pears	     Produce	             30.00
--8	                          Northwoods Cranberry Sauce	         Condiments	             40.00
--9	                          Mishi Kobe Niku	                     Meat/Poultry	         97.00
--10	                      Ikura	                                 Seafood	             31.00
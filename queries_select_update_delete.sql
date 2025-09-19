-- Read
USE MoviesLab2;
GO

-- we get all genres
SELECT * FROM dbo.Genre;

-- get all thr movies
SELECT * FROM dbo.Movie;

-- See all the movies with their genre name 
SELECT m.Title, m.ReleaseYear, g.Name AS Genre
FROM dbo.Movie m
JOIN dbo.Genre g ON m.GenreId = g.GenreId;

--Update
UPDATE dbo.Movie
SET Rating = 10
WHERE Title = 'The Matrix';

--Verfy to see the results
SELECT Title, Rating FROM dbo.Movie WHERE Title = 'The Matrix';

--Delete
DELETE FROM dbo.Movie
WHERE Title = 'Die Hard';

-- To check if it worked
SELECT Title FROM dbo.Movie;

-- To check our referential integrity
DELETE FROM dbo.Genre WHERE Name = 'Drama';
-- we get an error as expected
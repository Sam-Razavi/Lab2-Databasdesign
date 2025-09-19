

USE MoviesLab2;
GO

-- Inserting Genres
INSERT INTO dbo.Genre (Name) VALUES
('Action'),
('Comedy'),
('Drama'),
('Sci-Fi'),
('Horror');

-- We then insert Movies
INSERT INTO dbo.Movie (Title, ReleaseYear, LengthMinutes, Rating, GenreId) VALUES
('The Matrix', 1999, 136, 9, 4),     -- Sci-Fi
('The Godfather', 1972, 175, 10, 3), -- Drama
('Die Hard', 1988, 132, 8, 1),       -- Action
('Toy Story', 1995, 81, 8, 2),       -- Comedy
('The Conjuring', 2013, 112, 7, 5);  -- Horror

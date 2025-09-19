
USE MoviesLab2;
GO


IF OBJECT_ID('dbo.Movie', 'U') IS NOT NULL DROP TABLE dbo.Movie;
IF OBJECT_ID('dbo.Genre', 'U') IS NOT NULL DROP TABLE dbo.Genre;
GO


CREATE TABLE dbo.Genre (
    GenreId INT IDENTITY(1,1) PRIMARY KEY,   -- auto-numbered ID
    Name    NVARCHAR(50) NOT NULL UNIQUE     -- must exist, no duplicates
);
GO


CREATE TABLE dbo.Movie (
    MovieId        INT IDENTITY(1,1) PRIMARY KEY,  -- auto-numbered ID
    Title          NVARCHAR(200) NOT NULL,         -- required
    ReleaseYear    INT NULL,                       -- optional
    LengthMinutes  INT NULL,                       -- optional
    Rating         INT NULL,                       -- optional (1..10)
    GenreId        INT NOT NULL,                   -- required link to Genre


    CONSTRAINT FK_Movie_Genre
        FOREIGN KEY (GenreId) REFERENCES dbo.Genre(GenreId)
        ON DELETE NO ACTION   -- block delete if movies still point to that genre
        ON UPDATE NO ACTION,


    CONSTRAINT CK_Movie_Year
        CHECK (ReleaseYear IS NULL OR (ReleaseYear BETWEEN 1900 AND 2100)),
    CONSTRAINT CK_Movie_Rating
        CHECK (Rating IS NULL OR (Rating BETWEEN 1 AND 10))
);
GO


CREATE INDEX IX_Movie_Title   ON dbo.Movie(Title);
CREATE INDEX IX_Movie_GenreId ON dbo.Movie(GenreId);
GO

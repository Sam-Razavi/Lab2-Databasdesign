--we connect it to our database
USE MoviesLab2;
GO


IF OBJECT_ID('dbo.Movie', 'U') IS NOT NULL DROP TABLE dbo.Movie;
IF OBJECT_ID('dbo.Genre', 'U') IS NOT NULL DROP TABLE dbo.Genre;
GO

--we create the tables for the genres
CREATE TABLE dbo.Genre (
    GenreId INT IDENTITY(1,1) PRIMARY KEY,   
    Name    NVARCHAR(50) NOT NULL UNIQUE     
);
GO

-- we create another table for movies
CREATE TABLE dbo.Movie (
    MovieId        INT IDENTITY(1,1) PRIMARY KEY,  
    Title          NVARCHAR(200) NOT NULL,         
    ReleaseYear    INT NULL,                       
    LengthMinutes  INT NULL,                       
    Rating         INT NULL,                       
    GenreId        INT NOT NULL,                   


    CONSTRAINT FK_Movie_Genre
        FOREIGN KEY (GenreId) REFERENCES dbo.Genre(GenreId)
        ON DELETE NO ACTION   
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

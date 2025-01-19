CREATE SCHEMA IF NOT EXISTS MoviesDB;
USE MoviesDB;

CREATE TABLE MoviesDB.Film (
ID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Language VARCHAR(50) NOT NULL,
RelaseDate DATE NOT NULL,
Director_ID INT NOT NULL,
Genre_ID INT NOT NULL,
FOREIGN KEY (Director_ID) REFERENCES Director(ID) ON DELETE CASCADE,
FOREIGN KEY (Genre_ID) REFERENCES Genre(ID) ON DELETE CASCADE
);

CREATE TABLE Actor (
    ID INT PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender IN ('M', 'F'))
);

CREATE TABLE Cast (
    ID INT PRIMARY KEY,
    Film_ID INT,
    Actor_ID INT,
    RoleName VARCHAR(20) NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actor(Actor_ID),
    CHECK (RoleName IN ('Main actor', 'Supporting actor'))
);
CREATE TABLE IF NOT EXISTS Directors (
directorID INT(5) NOT NULL,
fName VARCHAR(50),
lName VARCHAR(50),
gender VARCHAR (1)CHECK (gender IN ('M','F')),
CONSTRAINT PK_directorID PRIMARY KEY (directorID)
);

INSERT INTO Directors (directorID, fName, lName, gender)
VALUES 
(101, 'Christopher', 'Nolan', 'M'),  -- Interstellar
(102, 'Alexander', 'Payne', 'M'),   -- The Holdovers
(103, 'David', 'Fincher', 'M'),     -- Gone Girl
(104, 'Chris', 'Columbus', 'M'),    -- Home Alone
(105, 'Richard', 'Kelly', 'M'),     -- Donnie Darko
(106, 'Mel', 'Gibson', 'M');        -- Hacksaw Ridge
(107, 'Denis', 'Villeneuve', 'M'),  -- Dune
(108, 'Charlotte', 'Wells', 'F'),  -- Aftersun
(109, 'Hang-jun', 'Jang', 'M'),    -- Forgotten
(110, 'Guy', 'Ritchie', 'M'),      -- Sherlock Holmes
(111, 'Ridley', 'Scott', 'M');     -- Black Hawk Down

CREATE TABLE IF NOT EXISTS Genres(
genreID INT(2) NOT NULL,
genreName VARCHAR(50) NOT NULL,
CONSTRAINT PK_genreID PRIMARY KEY (genreID)
); 
INSERT INTO Genres (genreID, genreName ) VALUES
    (1,'Science Fiction '), 
    (2,'Drama'),
    (3,'Thriller'),
    (4,'Comedy'),
    (5,'Mystery'), 
    (6,'War');

CREATE TABLE Rating (
    ID INT(10) PRIMARY KEY,
    Film_ID INT,
    Ratings VARCHAR(20),
    FOREIGN KEY (Film_ID) REFERENCES Film(ID)
);

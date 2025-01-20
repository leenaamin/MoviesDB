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

DROP TABLE IF EXISTS Actor;
CREATE TABLE IF NOT EXISTS Actor (
    ActorID INT(5) NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender IN ('M' , 'F')),
    CONSTRAINT PK_ActorID PRIMARY KEY (ActorID)
);

INSERT INTO Actor (ActorID ,Fname, Lname, Gender)
VALUES
(1, 'Matthew', 'McConaughey', 'M'),  -- Interstellar
(2, 'Anne', 'Hathaway', 'F'),
(3, 'Jessica', 'Chastain', 'F'),
(4, 'Mackenzie', 'Foy', 'F'),
(5, 'Paul', 'Giamatti', 'M'),       -- The Holdovers
(6, 'Maya', 'Hawke', 'F'),
(7, 'Ben', 'Affleck', 'M'),         -- Gone Girl
(8, 'Tyler', 'Perry', 'M'),
(9, 'Rosamund', 'Pike', 'F'),
(10, 'Macaulay', 'Culkin', 'M'),    -- Home Alone
(11, 'Joan', 'Cusack', 'F'),
(12, 'Jake', 'Gyllenhaal', 'M'),    -- Donnie Darko
(13, 'Jena', 'Malone', 'F'),
(14, 'Andrew', 'Garfield', 'M'),    -- Hacksaw Ridge
(15, 'Hugo', 'Weaving', 'M'),
(16, 'Vera', 'Farmiga', 'F'),
(17, 'Timothée', 'Chalamet', 'M'),  -- Dune
(18, 'Zendaya', 'Coleman', 'F'),
(19, 'Oscar', 'Isaac', 'M'),
(20, 'Paul', 'Mescal', 'M'),        -- Aftersun
(21, 'Tessa', 'Thompson', 'F'),
(22, 'Colin', 'Farrell', 'M'),
(23, 'Kang', 'Ha-neul', 'M'),       -- Forgotten
(24, 'Jeon', 'Hye-jin', 'F'),
(25, 'Lee', 'Joon', 'M'),
(26, 'Robert', 'Downey Jr.', 'M'),  -- Sherlock Holmes
(27, 'Jude', 'Law', 'M'),
(28, 'Mark', 'Strong', 'M'),
(29, 'Josh', 'Hartnett', 'M'),      -- Black Hawk Down
(30, 'Tom', 'Sizemore', 'M'),
(31, 'Ewan', 'McGregor', 'M');

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
(106, 'Mel', 'Gibson', 'M'),       -- Hacksaw Ridge
(107,'Denis', 'Villeneuve', 'M'), -- Dune
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
    Ratings DECIMAL (1.1),
    FOREIGN KEY (Film_ID) REFERENCES Film(ID)
);
INSERT INTO Ratings (ID,Ratings) VALUES
(1,9.5),
(2,8),
(3,9),
(4,8.5),
(5,9),
(6,8.5),
(7,8.5),
(8,8.5),
(9,8.5),
(10,8,5),
(11,8);
SELECT * 
FROM Ratings
WHERE Ratings > 8;

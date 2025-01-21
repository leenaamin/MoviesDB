CREATE SCHEMA IF NOT EXISTS MoviesDB;
USE MoviesDB;



CREATE TABLE IF NOT EXISTS Actor (
    ActorID INT(5) NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender IN ('M' , 'F')),
    CONSTRAINT PK_ActorID PRIMARY KEY (ActorID)
);



CREATE TABLE IF NOT EXISTS Directors (
directorID INT(5) NOT NULL,
fName VARCHAR(50),
lName VARCHAR(50),
gender VARCHAR (1)CHECK (gender IN ('M','F')),
CONSTRAINT PK_directorID PRIMARY KEY (directorID)
);

CREATE TABLE IF NOT EXISTS Genres(
genreID INT(2) NOT NULL,
genreName VARCHAR(50) NOT NULL,
CONSTRAINT PK_genreID PRIMARY KEY (genreID)
); 


CREATE TABLE MoviesDB.Film (
ID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Language VARCHAR(50) NOT NULL,
RelaseDate DATE NOT NULL,
Director_ID INT NOT NULL,
Genre_ID INT NOT NULL,
FOREIGN KEY (Director_ID) REFERENCES Directors(directorID) ON DELETE CASCADE,
FOREIGN KEY (Genre_ID) REFERENCES Genres(genreID) ON DELETE CASCADE
);

CREATE TABLE Cast (
    ID INT PRIMARY KEY,
    Film_ID INT,
    Actor_ID INT,
    RoleName VARCHAR(20) NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Film(ID),
    FOREIGN KEY (Actor_ID) REFERENCES Actor(ActorID),
    CHECK (RoleName IN ('Main actor', 'Supporting actor'))
);

CREATE TABLE Rating (
    ID INT(10) PRIMARY KEY,
    Film_ID INT,
    Ratings DECIMAL(3,1), 
    FOREIGN KEY (Film_ID) REFERENCES Film(ID)
);

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


INSERT INTO Genres (genreID, genreName ) VALUES
    (1,'Science Fiction '), 
    (2,'Drama'),
    (3,'Thriller'),
    (4,'Comedy'),
    (5,'Mystery'),
    (6,'War');


INSERT INTO Cast (ID, Film_ID, Actor_ID, RoleName)
VALUES
    -- Interstellar (Film_ID = 1)
    (1, 1, 1, 'Main actor'),           -- Matthew McConaughey
    (2, 1, 2, 'Supporting actor'),     -- Anne Hathaway
    (3, 1, 3, 'Supporting actor'),     -- Jessica Chastain
    (4, 1, 4, 'Supporting actor'),     -- Mackenzie Foy

    -- The Holdovers (Film_ID = 2)
    (5, 2, 5, 'Main actor'),           -- Paul Giamatti
    (6, 2, 6, 'Supporting actor'),     -- Maya Hawke

    -- Gone Girl (Film_ID = 3)
    (7, 3, 7, 'Main actor'),           -- Ben Affleck
    (8, 3, 8, 'Supporting actor'),     -- Tyler Perry
    (9, 3, 9, 'Supporting actor'),     -- Rosamund Pike

    -- Home Alone (Film_ID = 4)
    (10, 4, 10, 'Main actor'),         -- Macaulay Culkin
    (11, 4, 11, 'Supporting actor'),   -- Joan Cusack

    -- Donnie Darko (Film_ID = 5)
    (12, 5, 12, 'Main actor'),         -- Jake Gyllenhaal
    (13, 5, 13, 'Supporting actor'),   -- Jena Malone

    -- Hacksaw Ridge (Film_ID = 6)
    (14, 6, 14, 'Main actor'),         -- Andrew Garfield
    (15, 6, 15, 'Supporting actor'),   -- Hugo Weaving
    (16, 6, 16, 'Supporting actor'),   -- Vera Farmiga

    -- Dune (Film_ID = 7)
    (17, 7, 17, 'Main actor'),         -- Timothée Chalamet
    (18, 7, 18, 'Supporting actor'),   -- Zendaya Coleman
    (19, 7, 19, 'Supporting actor'),   -- Oscar Isaac

    -- Aftersun (Film_ID = 8)
    (20, 8, 20, 'Main actor'),         -- Paul Mescal
    (21, 8, 21, 'Supporting actor'),   -- Tessa Thompson
    (22, 8, 22, 'Supporting actor'),   -- Colin Farrell

    -- Forgotten (Film_ID = 9)
    (23, 9, 23, 'Main actor'),         -- Kang Ha-neul
    (24, 9, 24, 'Supporting actor'),   -- Jeon Hye-jin
    (25, 9, 25, 'Supporting actor'),   -- Lee Joon

    -- Sherlock Holmes (Film_ID = 10)
    (26, 10, 26, 'Main actor'),        -- Robert Downey Jr.
    (27, 10, 27, 'Supporting actor'),  -- Jude Law
    (28, 10, 28, 'Supporting actor'),  -- Mark Strong

    -- Black Hawk Down (Film_ID = 11)
    (29, 11, 29, 'Main actor'),        -- Josh Hartnett
    (30, 11, 30, 'Supporting actor'),  -- Tom Sizemore
    (31, 11, 31, 'Supporting actor');  -- Ewan McGregor

INSERT INTO Rating (ID, Film_ID, Ratings) VALUES
(1, 101, 9.5),
(2, 102, 8.0),
(3, 103, 9.0),
(4, 104, 8.5),
(5, 105, 9.0),
(6, 106, 8.5),
(7, 107, 8.5),
(8, 108, 8.5),
(9, 109, 8.5),
(10, 110, 8.5),
(11, 111, 8.0);

SELECT * 
FROM Rating
WHERE Ratings > 8;

SELECT genreName, COUNT(*) AS FilmCount
FROM Film
INNER JOIN Genres ON Film.Genre_ID = Genres.genreID
GROUP BY genreName
ORDER BY FilmCount DESC;

SELECT * 
FROM Directors
ORDER BY lName ASC;

SELECT Film_ID, COUNT(Actor_ID) AS ActorCount
FROM Cast
GROUP BY Film_ID
HAVING COUNT(Actor_ID) > 2;

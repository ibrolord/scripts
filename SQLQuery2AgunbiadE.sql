CREATE TABLE MOVIE (

movieID INT IDENTITY,
movieName VARCHAR(50),
moviePrice DEC(3,2),
--movieFormat VARCHAR(30),
movieRunTime INT,
movieDirector VARCHAR(50),
movieAspectRatio CHAR(10),
movieNoDisk INT,
movieRelease INT,
movieBoxSetID INT NULL,


CONSTRAINT pk_MOVIE_movieID PRIMARY KEY(movieID),

CONSTRAINT fK_MOVIE_movieBoxSetID FOREIGN KEY(movieBoxSetID) REFERENCES MOVIE(movieID)
);


--TO REMOVE COLORS USE THE []

CREATE TABLE [FORMAT] (

formatID INT IDENTITY,
formatType VARCHAR(20),

CONSTRAINT pk_FORMAT_formatID PRIMARY KEY(formatID)

);


CREATE TABLE MOVIE_FORMAT (
--nO IDENTITY
movieID INT,
formatID INT,

CONSTRAINT pk_MOVIE_FORMAT_movieID_formatID PRIMARY KEY(movieID, formatID),

CONSTRAINT fK_MOVIE_movieID FOREIGN KEY(movieID) REFERENCES MOVIE(movieID),

CONSTRAINT Fk_FORMAT_formatID FOREIGN KEY(formatID) REFERENCES FORMAT(formatID)


);





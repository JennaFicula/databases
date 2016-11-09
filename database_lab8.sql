DROP TABLE IF EXISTS movieActors;
DROP TABLE IF EXISTS movieDirectors;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS People;

--SQL create statements

create table people(
pid		TEXT NOT NULL PRIMARY KEY
name		TEXT
address		TEXT
spouseNAME	TEXT
);

create table actors(
	pid		TEXT NOT NULL  REFERENCES people(pid)	
	DOB		DATE
	hairColor	TEXT
	eyeColor	TEXT
	heightIn	INT
	weightLbs	INT
	favoriteColor	TEXT
	sagDate	DATE
);

create table movies(	
	mid			TEXT NOT NULL  PRIMARY KEY
	title			TEXT NOT NULL	
	yearReleased		INT
	mpaaNum		INT
	domesticSalesUSD	FLOAT
	foreignSalesUSD	FLOAT
	dvdBluraySalesUSD	FLOAT
);

create table directors(
	pid		TEXT NOT NULL  REFERENCES people(pid)
	filmSchool	TEXT
	dgDate		DATE
	lensMaker	TEXT
);

create table movieDirectors(
mid			TEXT NOT NULL REFERENCES movies(mid)
	pid			TEXT NOT NULL REFERENCES people (pid)
primary key (mid, pid)
);

create table movieActors(
mid			TEXT NOT NULL REFERENCES movies(mid)
	pid			TEXT NOT NULL REFERENCES people (pid)
primary key (mid, pid)
);



-- 4. Write a query to show all the directors with whom actor “Sean Connery” has worked

SELECT directors.name 
FROM Directors d INNER JOIN movieDirectors ON d.pid = movieDirectors.pid
WHERE mid in (SELECT mid
    FROM movieDirectors c INNER JOIN People p ON p.pid = movieActors.pid
    WHERE name = "Sean Connery");

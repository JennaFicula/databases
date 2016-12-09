DROP TABLE IF EXISTS charactersInSketch CASCADE;
DROP TABLE IF EXISTS playsCharacter CASCADE;
DROP TABLE IF EXISTS sketchesInEpisode;
DROP TABLE IF EXISTS scheduleEachEpisode CASCADE;
DROP TABLE IF EXISTS spinOffSketches;
DROP TABLE IF EXISTS SpinOffs;
DROP TABLE IF EXISTS snlCast CASCADE;
DROP TABLE IF EXISTS Crew;
DROP TABLE IF EXISTS Sketches;
DROP TABLE IF EXISTS Episodes;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS musicalGuest;
DROP TABLE IF EXISTS Hosts;
DROP TABLE IF EXISTS People;

-- Create statements for tables

CREATE TABLE People(
	pid		integer not null,
	fname		text not null,
	lname		text not null,
	DOB		date, 
	salaryUSD	integer,
	primary key(pid)	

);

CREATE TABLE snlCast(
       	pid			integer not null references People(pid),
	startSeason		integer not null,
	endSeason		integer not null,
	numOfImpressions	integer,
	bestImpression	text
--foreign key(pid)
);

CREATE TABLE Crew(
	pid			integer not null references People(pid),
	role			text not null,
	startDate		date,
primary key(pid)

);

CREATE TABLE Hosts(	
	pid			integer not null references People(pid),
	occupation		text not null, 
	numShowsHosted		integer not null,	
	prevCastMemb		boolean,
primary key(pid)

);

CREATE TABLE Sketches(
	sketchID	integer not null,
	title		text not null,  
	sketchType	text not null check(sketchType ='coldOpen' or sketchType ='commercial' or sketchType ='weekendUpdate' or sketchType ='skit'),
	lengthMin	decimal (3,2) not null,
primary key(sketchID)	

);

CREATE TABLE musicalGuest(
	musicID		integer not null,	
	artistName		text not null,	
	genre			text,
primary key(musicID)

);

CREATE TABLE Episodes(
	eid		decimal(4,2) not null,
	airDate		date not null,
primary key(eid)

);

CREATE TABLE Characters(
	charID		integer not null references Characters(charID),
	name		text not null,
	numAppearances		integer,
primary key(charID)
);

CREATE TABLE charactersInSketch(
	charID		integer not null references Characters(charID),
	sketchID	integer not null references Sketches(sketchID),
	primary key(charID, sketchID)	
);

CREATE TABLE playsCharacter(
	pid		integer not null references People(pid),
	charID		integer not null references Characters(charID),
primary key(pid, charID)	
);

CREATE TABLE sketchesInEpisode(
	sketchID	integer not null references Sketches(sketchID),
	eid		decimal(4,2) not null references Episodes(EID),
primary key(sketchID,eid)
);

CREATE TABLE scheduleEachEpisode(
	eid		decimal(4,2) not null references Episodes(EID),
	musicID		integer not null references musicalGuest(musicID),
	pid		integer not null references People(pid),
primary key(eid, musicID, pid)
);

CREATE TABLE SpinOffs(
	spinID		integer not null,
	title		text not null,
	typeOfSpin	text not null check(typeOfSpin='movie' or typeOfSpin ='tvShow'),
	releaseDate	integer not null,
primary key(spinID)
);

CREATE TABLE spinOffSketches(
	sketchID	integer not null references Sketches(sketchID),
	spinID		integer not null references SpinOffs(spinID),
primary key(sketchID, spinID)
);

--Insert statements for all tables

--Populate people tables
INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(1, 'John', 'Belushi', '1949-01-24', 4000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(2, 'Kristen', 'Wiig', '1973-08-22', 12500 );

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(3, 'Will', 'Ferell', '1967-07-16', 17500);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(4, 'Chris', 'Farley', '1964-02-15', 5000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(5, 'Bill', 'Hader', '1978-06-07', 12500);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(6, 'Dan', 'Aykroyd', '1952-07-01', 4000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(7, 'Gilda', 'Radner', '1946-06-28', 4000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(8, 'Adam', 'Sandler', '1966-09-09', 5000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(9, 'Bill', 'Murray', '1950-09-21', 4000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(10, 'Mike', 'Meyers', '1963-05-25', 4000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(11, 'Jimmy', 'Fallon', '1963-05-25', 10000);

--crew
INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(15, 'Tom', 'Richards', '1972-09-14', 1000);


INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(16, 'Doug', 'Abeles', '1963-05-25', 10000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(17, 'Lorne', 'Michaels', '1944-11-17', 350000000);

INSERT INTO People( pid, fname, lname, DOB, salaryUSD )
VALUES(18, 'James', 'Downey', '1956-08-29', 5000);

INSERT INTO CREW(pid, role, startDate)
VALUES(15, 'Camera Man','1988-06-09');

INSERT INTO CREW(pid, role, startDate)
VALUES(17,'Creator','1975-08-02');

INSERT INTO CREW(pid, role, startDate)
VALUES(18,'Writer', '1998-12-09');

INSERT INTO CREW(pid, role, startDate)
VALUES(16, 'Director', '1980-02-11');
--hosts but also people

--hosts but also people

INSERT INTO People( pid, fname, lname, DOB)
VALUES(12, 'Martin', 'Short', '1950-03-26'); -- 8 impressions started 1984

INSERT INTO People( pid, fname, lname, DOB)
VALUES(13, 'Richard', 'Pryor', '1940-12-01');

INSERT INTO People( pid, fname, lname, DOB)
VALUES(14, 'Leslie', 'Nielson', '1926-02-11');

--Populate snlCast table
INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(1, 1, 4, 11, 'Joe Cocker');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(2, 31, 37, 24, 'Paula Deen');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(3, 22, 27, 24, 'Alex Trebek');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(4, 16, 23, 27, 'Meat Loaf');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(5, 31, 38, 82, 'Al Pacino');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(6, 1, 4, 25, 'Julia Child');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(7, 1, 4, 20, 'Barbra Walters');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(8, 16, 20,  21, 'Bruce Springsteen');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(9, 2, 5, 22, 'Walter Cronkite');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(10, 14, 20, 39, 'Mick Jagger');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(11, 24, 29, 71, 'Adam Sandler');

INSERT INTO snlCast( pid, startSeason, endSeason, numOfImpressions, bestImpression)
VALUES(12, 10, 11, 8, 'Ed Grimley');


--Populate Sketches table

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(1, 'Samurai Hotel', 'skit', 3.31);

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(2, 'Celebrity Jeapordy', 'skit', 6.21 );

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(3, 'Wanes World', 'skit', 3.27);

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(4, 'Coneheads', 'skit', 5.12);

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(5, 'Blues Brothers', 'skit', 6.17);

INSERT INTO Sketches( sketchID, title, sketchType, lengthMin)
VALUES(6, 'MacGruber', 'skit', 6.53);


--Populate characters table

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(1, 'Gilly', 6);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(2, 'Roseanne Roseannadanna', 17);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(3, 'Stefon', 18);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(4, 'Samurai Futaba', 17);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(5, 'Matt Foley', 8);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(6, 'Opraman', 10);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(7, 'Alex Trebek', 7);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(8, 'Nick the Lounge Singer', 9);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(9, 'Wayne Campbell', 21);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(10, 'MacGruber', 6);

INSERT INTO Characters ( charID, name, numAppearances)
VALUES(11, 'Ronnie the Mechanic', 1);

INSERT INTO Characters ( charID, name, numAppearances) -- john 1
VALUES(12, 'Joliet Jake Blues',5);

INSERT INTO Characters ( charID, name, numAppearances) --dan 6
VALUES(13, 'Elwood Blues', 5);

INSERT INTO Characters ( charID, name, numAppearances) --dan 6
VALUES(14, 'Police Officer', 1);

--Populate Spin offs table

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(1, 'Superstar', 'movie', 1999);

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(2, 'Waynes World', 'movie', 1992);

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(3, 'Coneheads', 'movie', 1993);

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(4, 'MacGruber', 'movie', 2010);

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(5, 'A Night at the Roxbury', 'movie', 1998);

INSERT INTO SpinOffs ( spinID, title, typeOfSpin, releaseDate)
VALUES(6, 'Blues Brothers', 'movie', 1980);

-- populate plays character table

INSERT INTO playsCharacter (pid, charID)
VALUES(2, 1);

INSERT INTO playsCharacter (pid, charID)
VALUES(7, 2);

--INSERT INTO playsCharacter (pid, charID)
--VALUES(5, 10);

INSERT INTO playsCharacter (pid, charID)
VALUES(1 , 4);

INSERT INTO playsCharacter (pid, charID)
VALUES(4 , 5);

INSERT INTO playsCharacter (pid, charID)
VALUES(8 , 6);

INSERT INTO playsCharacter (pid, charID)
VALUES(3 , 7);
 
INSERT INTO playsCharacter (pid, charID)
VALUES(9, 8);

INSERT INTO playsCharacter (pid, charID)
VALUES(10 , 9);

INSERT INTO playsCharacter (pid, charID)
VALUES(5, 10);

INSERT INTO playsCharacter (pid, charID)
VALUES(4, 11);

INSERT INTO playsCharacter (pid, charID)
VALUES(1, 12);

INSERT INTO playsCharacter (pid, charID)
VALUES(6, 13);

INSERT INTO playsCharacter (pid, charID)
VALUES(13, 14);



--insert into spinoffsketches
INSERT INTO spinOffSketches(sketchID, spinID)
VALUES (3, 2); 

INSERT INTO spinOffSketches(sketchID, spinID)
VALUES (4, 3);
	
INSERT INTO spinOffSketches(sketchID, spinID)
VALUES (5, 6); 

INSERT INTO spinOffSketches(sketchID, spinID)
VALUES ( 6, 4); 


--insert charactersInSketch

INSERT INTO charactersInSketch (charID, sketchID)
VALUES( 4, 1);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES( 7, 2);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES( 9, 3);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES( 11, 4);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES(12, 5);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES(13, 5);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES(10, 6);

INSERT INTO charactersInSketch (charID, sketchID)
VALUES(14, 1);


--insert episodes
INSERT INTO Episodes(eid, airDate)
VALUES (22.08, '1996-12-17'); --HOST MARTIN SHORT, MUSIC NO DOUBT //jeapordy

INSERT INTO Episodes(eid, airDate)
VALUES (1.07, '1975-12-13'); --HOST Richard Pryor, MUSIC Gil Scott Heron // samurai

INSERT INTO Episodes(eid, airDate)
VALUES (14.13, '1989-02-18'); --Leslie Nielsen  Cowboy junkies

INSERT INTO Episodes(eid, airDate)
VALUES (39.10, '2013-12-21'); -- Jimmy fallon justin timberlake

--insert into hosts 
INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (12, 'Comedian', 3, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (13, 'Comedian', 1, false);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (14, 'Actor', 1, false);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (11, 'Actor', 2, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (2, 'Actor', 1, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (9, 'Actor', 7, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (10, 'Actor', 1, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (3, 'Actor', 3, true);

INSERT INTO Hosts(pid, occupation, numShowsHosted, prevCastMemb)
VALUES (6, 'Actor', 1, true);


--insert into music
INSERT INTO MusicalGuest(musicID, artistName, genre)
VALUES (1, 'No Doubt', 'Pop Punk' );

INSERT INTO MusicalGuest(musicID, artistName, genre)
VALUES (2, 'Gil Scott-Heron', 'soul' );

INSERT INTO MusicalGuest(musicID, artistName, genre)
VALUES (3, 'Cowboy Junkies', 'Rock' );

INSERT INTO MusicalGuest(musicID, artistName, genre)
VALUES (4, 'Justin Timberlake', 'Pop' );

--insert sketches into episodes 


INSERT INTO sketchesInEpisode(sketchID, eid)
VALUES (2, 22.08); 

INSERT INTO sketchesInEpisode(sketchID, eid)
VALUES (1, 1.07); 

INSERT INTO sketchesInEpisode(sketchID, eid)
VALUES (3, 14.13); 

-- schedule show 
INSERT INTO scheduleEachEpisode(eid, musicID, pid)
VALUES (22.08, 1, 12); 

INSERT INTO scheduleEachEpisode(eid, musicID, pid)
VALUES (1.07, 2, 13);

INSERT INTO scheduleEachEpisode(eid, musicID, pid)
VALUES (14.13, 3, 14); 

INSERT INTO scheduleEachEpisode(eid, musicID, pid)
VALUES (14.13, 4, 11); 

INSERT INTO Episodes(eid, airDate)
VALUES (42.07, '2013-12-21'); -- Jimmy fallon justin timberlake


INSERT INTO MusicalGuest(musicID, artistName, genre)
VALUES (5, 'The xx', 'R & B' );


--Views

---#1 View: displays cast, characters they play, and what sketches they are in

CREATE OR REPLACE VIEW characterCast as
SELECT sc.pid, c.name, c.charID
	FROM characters c
	INNER JOIN playsCharacter pc 	ON c.charID 	= pc.charID
	INNER JOIN snlCast sc		ON pc.pid 	= sc.pid;

CREATE OR REPLACE VIEW peopleCast as
SELECT p.pid, p.fname, p.lname
	FROM people p
	INNER JOIN snlCast sc		ON p.pid 	= sc.pid;


CREATE OR REPLACE VIEW characterSketch as
SELECT s.title, cS.charID
	FROM Sketches s
	INNER JOIN charactersInSketch cS	ON cS.sketchID = s.sketchID
	INNER JOIN characters c			ON cS.charID = c.charID;

select * FROM characterSketch;

Select pc.fname, pc.lname, cc.name, cS.title
from peopleCast pc 
INNER JOIN characterCast cc 		ON pc.pid 	= cc.pid
INNER JOIN characterSketch cS		ON cS.charID	= cc.charID
ORDER BY lname ASC;
	
--#2 View: displays all characteristics of scheduling a single episode - shows episode #, host, musical guest
CREATE OR REPLACE VIEW episodeGuide as
SELECT e.eid AS "Episode", e.airDate, p.fname AS "Host First Name", p.lname AS "Host Last Name", mg.artistName AS "Musical Guest"
FROM people p, MusicalGuest mg, scheduleEachEpisode shed, episodes e
WHERE shed.musicID = mg.musicID AND shed.pid = p.pid AND shed.eid = e.eid
ORDER BY e.eid ASC;

select * from episodeGuide;


-- #3 View: displays how many seasons each cast member performed in

CREATE OR REPLACE VIEW seasonsPerCastMem as
SELECT  p.fname, p.lname, sc.startSeason, sc.endSeason,
(sc.endSeason - sc.startSeason) AS numOfSeasons
FROM people p INNER JOIN snlCast sc on p.pid = sc.pid
order by numOfSeasons desc;

SELECT * FROM seasonsPerCastMem;

--security 
CREATE ROLE admin;
GRANT ALL ON TABLES
IN SCHEMA PUBLIC
TO admin;

CREATE ROLE user
GRANT SELECT 
ON ALL TABLES IN SCHEMA PUBLIC
TO user;

--Store Procedures 

-- #1 Stored Procedure to see how many characters each cast member plays 
CREATE OR REPLACE FUNCTION numbOfCharacters(text, REFCURSOR)
RETURNS refcursor as $$
DECLARE 
	castMembInput text := $1;
	resultset REFCURSOR := $2;
BEGIN
  open resultset for
	SELECT  count(pc.pid) AS "Number of Characters Played"
	FROM playsCharacter pc
	INNER JOIN people p
	ON p.pid = pc.pid
		WHERE castMembInput = p.fname;
  return resultset;
end;
$$
language plpgsql;

SELECT numbOfCharacters('Adam', 'results');
FETCH ALL FROM results;

--#2 Stored Procedure: to see which skits are in an episode 

CREATE OR REPLACE FUNCTION skitsPerEpisode(decimal(4,2), REFCURSOR)
RETURNS refcursor as $$
DECLARE 
	episodeInput decimal(4,2) := $1;
	resultset REFCURSOR := $2;
BEGIN
  open resultset for
	SELECT s.title AS "Sketches"
	FROM sketches s
	INNER JOIN sketchesInEpisode se
	ON s.sketchID = se.sketchID
	INNER JOIN episodes e
	ON e.eid = se.eid
		WHERE episodeInput = se.eid;
  return resultset;
end;
$$
language plpgsql;

SELECT skitsPerEpisode('01.70', 'results');
FETCH ALL FROM results;




--#3 Stored Procedure: calculates how many seasons a cast member has been in

CREATE OR REPLACE FUNCTION seasonsInCast(decimal(4,2), REFCURSOR)
RETURNS refcursor as $$
DECLARE 
	castInput decimal(4,2) := $1;
	resultset REFCURSOR := $2;
BEGIN
  open resultset for
	SELECT  p.fname, p.lname, sc.startSeason, sc.endSeason,
	(sc.endSeason - sc.startSeason) AS numOfSeasons
	FROM people p INNER JOIN snlCast sc on p.pid = sc.pid
	order by numOfSeasons desc
	
		WHERE castInput = (p.fname);
  return resultset;
end;
$$
language plpgsql;

SELECT seasonsInCast('Bill', 'results');
FETCH ALL FROM results;


--Queries

--#1  that shows spin offs, skits, and castMembers
SELECT so.title, s.title, so.releaseDate, s.sketchType, s.lengthMin, p.fname, p.lname
FROM SpinOffs so
LEFT OUTER JOIN spinOffSketches ss 		ON ss.spinID 	= so.spinID
LEFT OUTER JOIN Sketches s			ON s.sketchID 	= ss.sketchID	
LEFT OUTER JOIN charactersInSketch cs 	ON cs.sketchID 	= s.sketchID
LEFT OUTER JOIN characters c			ON c.charID	= cs.charID
LEFT OUTER JOIN playsCharacter pc		ON pc.charID	= c.charID
LEFT OUTER JOIN people p			ON p.pid	= pc.pid;

--#2 shows hosts who are also previous cast members 
SELECT h.numShowsHosted, p.fname, p.lname, h.occupation,startSeason, numOfImpressions, bestImpression
FROM  hosts h 
INNER JOIN people p 		ON p.pid = h.pid
INNER JOIN snlCast sc		ON p.pid = sc.pid
WHERE prevCastMemb = true
ORDER BY numShowsHosted ASC;

--#3 Query - shows characters where the cast member who plays them makes the least money and the season they stared in
SELECT p.fname, p.lname, c.name, sc.startSeason
FROM characters c 
INNER JOIN playsCharacter pc 		ON c.charID = pc.charID
INNER JOIN snlCast sc			ON sc.pid = pc.pid
INNER JOIN people p			ON p.pid = sc.pid
WHERE (p.salaryUSD < 5000); 

--#4 Query shows the names of cast members who can perform more than 25 impressions.
SELECT p.fname, p.lname, SUM(sc.numOfImpressions) AS "Number of Impressions"
FROM snlCast sc
INNER JOIN people p		ON p.pid = sc.pid
GROUP BY p.pid
HAVING SUM(numOfImpressions) > 25
ORDER BY p.fname;


-- Update crew with pid that has been inserted into people table with a salaryUSD < 4000 USD
CREATE OR REPLACE FUNCTION addtoSketches()
RETURNS TRIGGER AS
$$
BEGIN 
   IF NEW.salaryUSD < 4000 THEN
      INSERT INTO Crew(pid) 
      VALUES (NEW.pid);
   END IF;
   RETURN NEW;
END;
$$
language plpgsql;

-- Update trigger
CREATE TRIGGER addtoCharacters
AFTER INSERT ON people
FOR EACH ROW 
EXECUTE PROCEDURE addtoSketches();

-- Test them.
INSERT INTO people(pid, fname, lname, DOB, salaryUSD)
      VALUES (100, 'John', 'Smith', '1954-12-11', 1);
      
Select * from crew;

--some attempted triggers

CREATE OR REPLACE FUNCTION addCharacter(text, REFCURSOR)
RETURNS refcursor as $$
DECLARE 
	characterInput text := $1;
	resultset REFCURSOR := $2;
BEGIN
  open resultset for
	SELECT s.title, c.name
	FROM sketches s
	INNER JOIN charactersInSketch cs
	ON s.sketchID = cs.sketchID
	INNER JOIN characters c
	ON c.charID = cs.charID
		where characterInput = c.name;
  return resultset;
end;
$$
language plpgsql;

SELECT addCharacter('Bill', 'results');
FETCH ALL FROM results;


--triggers
CREATE OR REPLACE FUNCTION addChar(charID, sketchID)
RETURNS TRIGGER AS $body$
BEGIN	
	INSERT INTO charactersInSketch(charID, sketchID)
		values(new.charID, new.sketchID);
END
$body$
language plpgsql;

--new trigger
create or replace function quitShow() returns trigger as
$$
begin
if new.endSeason is not null
and (select endSeason
from snlCast
where pid = new.pid) is null
then
update snlCast
set endSeason = new.endSeason
where pid = new.pid;
end if;
return new;
end;
$$
language plpgsql;


create trigger quitShow
after update on snlCast
for each row
execute procedure quitShow();



-- Update characters table Stored Procedure
CREATE OR REPLACE FUNCTION addtoSketches()
RETURNS TRIGGER AS
$$
BEGIN 
   IF NEW.prevCastMember = true THEN
      INSERT INTO snlCast(pid) 
      VALUES (NEW.pid);
   END IF;
   RETURN NEW;
END;
$$
language plpgsql;


CREATE TRIGGER addtoCharacters
AFTER INSERT ON hosts
FOR EACH ROW 
EXECUTE PROCEDURE addtoSketches();

-- Test them.
INSERT INTO hosts(pid, occupation, numShowsHosted, prevCastMemb) 
      VALUES (100, 'singer', 1, true)



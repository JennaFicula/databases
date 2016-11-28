--Jenna Ficula
--Lab 10 
--STORED PROCEDURE

--question 1 
--function PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in course number.

CREATE OR REPLACE FUNCTION PreReqsFor(int, REFCURSOR)
RETURNS REFCURSOR AS 
$$
DECLARE
	course		int 		:=$1;
	resultset 	REFCURSOR 	:=$2;
BEGIN
	open resultset for
		SELECT num, name
		FROM courses
		WHERE num IN (
			SELECT preReqNum 
			FROM Prerequisites
			WHERE courseNum = course
		);
	RETURN resultset;
END;
$$
language PLPGSQL;

--TEST CALL FOR FUNCTION 1

SELECT PreReqsFor(499, 'results');
FETCH ALL FROM results;

--question 2
--function IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite.

CREATE OR REPLACE FUNCTION IsPreReqFor(int, REFCURSOR)
RETURNS REFCURSOR AS 
$$
DECLARE
	course		int 		:=$1;
	resultset 	REFCURSOR 	:=$2;
BEGIN	
	open resultset for 
		SELECT num, name
		FROM courses
		WHERE num IN (
			SELECT	courseNum
			FROM 	Prerequisites
			WHERE	course = preReqNum
		);
	RETURN resultset;
END;
$$
language PLPGSQL;

--TEST CALL FOR FUNCTION 2

SELECT IsPreReqFor(120, 'results');
FETCH ALL FROM results;
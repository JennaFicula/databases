
--#1
select city
from agents
where aid in (SELECT aid
		FROM orders
		WHERE cid = 'c006');

--#2
SELECT pid
FROM orders
WHERE aid in (SELECT aid
		FROM orders
		WHERE cid in (SELECT cid
				FROM Customers
				WHERE city = 'Kyoto'))
ORDER BY pid DESC;

--#3
SELECT name, cid 
FROM customers 
WHERE cid in (SELECT cid 
		FROM orders 
		WHERE aid != 'a03');
		
-- correct answer

SELECT cid, name 
FROM customers 
WHERE cid not in (SELECT cid 
		  FROM orders 
		  WHERE aid != 'a03');

--#4
SELECT cid 
FROM orders 
WHERE pid = 'p01' 
INTERSECT
SELECT cid 
FROM orders 
WHERE pid = 'p07';

SELECT *
FROM orders 
--the answer should be c006

--#5
SELECT pid
FROM products
EXCEPT
	SELECT distinct pid 
	FROM orders
	WHERE cid IN (SELECT cid
		      FROM orders
		      WHERE aid = 'a08')
ORDER BY pid DESC; 

--#6
SELECT name, discount, city
FROM customers 
WHERE cid in (SELECT cid 
		FROM orders
		WHERE aid in (SELECT aid 
				FROM agents
				WHERE (city = 'Dallas'
				OR city = 'New York')));
--#7
SELECT cid, name 
FROM customers 
WHERE discount in (SELECT discount 
		     FROM customers 
		     WHERE (city ='Dallas' OR 
				city = 'London'));

/* 
#8

Check constraints in SQL are rules that specify certain requirements that each row in a database table must meet. 
Data values that are inputted or updated in the database must abide by check constraint conditions in order to be valid. 
Constraints are good because they permit only some values to be accepted in the column which enforces domain integrity of the columns. 
It is good to have check constraints in the database because it ensures data integrity. If the information in the database meets
 certain criteria, the data values are specific. A good example of a check constraint is in a voter registration database with a 
 column for the ages of the registered voters. It would be important for ages to have a constraint that ensures the data 
 value for each age entered is greater to or equal to 18
 
Ex.  	ADD CONSTRAINT ageConstraint CHECK (AGE >=18)

Another good example of a good check constraint is in a table for salaries of employees. A check constraint must be put in place
so that the input value for a salary does not exceed the typical salary range.

Ex. ADD CONSTRAINT salaryConstraint CHECK (salary >= 15000 AND salary <= 100000)

A bad example of a check constraint is when the constraint is too vague or encompasses too much data. 
If the constraint is not specific enough, the data values that can be entered into the database. 
Since the point of check constraints is to limit the type of data input, it is important to make sure.
Another bad example is if the check constraint is applied to the wrong table in the database.  
If you are using a check constraint to reference a column that resides in a different table, the constraint would not make sense and be ineffective. 









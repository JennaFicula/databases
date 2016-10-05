
--Jenna Ficula 
-- Lab 5
-- 10/3-16

--#1 

SELECT a.city
FROM agents a INNER JOIN orders o 	on o.aid = a.aid
	      INNER JOIN customers c 	on o.cid = c.cid
	      WHERE c.cid = 'c006';
	      
--#2 need every product from agents not just the ones from kyoto
SELECT distinct o1.pid 
FROM orders o INNER JOIN customers c 	   on c.cid = o.cid 
					   AND c.city = 'Kyoto' --specifies customer in Kyoto
	      FULL OUTER JOIN orders o1    on o1.aid = o.aid   --joins orders with orders

WHERE o.ordnum is not null 
ORDER BY o1.pid; 
     
--#3 
SELECT distinct name 
FROM customers 
WHERE cid not in (SELECT cid
		  FROM orders); 
		
--#4
SELECT distinct c.name
FROM customers c FULL OUTER JOIN orders o on o.cid = c.cid
WHERE o.cid is null;

--#5
SELECT distinct c.name, a.name
FROM customers c, agents a, orders o
WHERE c.city = a.city 
	AND   o.aid = a.aid 
	AND   o.cid = c.cid;

--#6
SELECT c.name, a.name, c.city
FROM customers c, agents a
WHERE c.city = a.city;

--#7
SELECT c.name, c.city
FROM customers c
WHERE c.city IN (SELECT city
		 FROM products 
		 GROUP BY city
		 ORDER BY count(quantity) 
		 limit 1); -- specifies that there should be only 1 city with lowest quantity
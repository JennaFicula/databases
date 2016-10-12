
--Jenna Ficula 
--Lab 6
--10/11/16

--#1
SELECT name, city
FROM customers
WHERE city IN  (SELECT city
                FROM products
                GROUP BY city
                ORDER BY count(city) DESC)
LIMIT 1; -- ensures that the name and city from EITHER ONE 

--#2

SELECT name
FROM products
WHERE products.priceUSD < (SELECT avg(products.priceUSD)
			   FROM PRODUCTS)
ORDER BY name desc;
--the average price is 1.03
--every price should be below this avg 

--#3
SELECT c.name, o.pid, o.totalUSD
FROM customers c 
INNER JOIN orders o ON c.cid = o.cid 
ORDER BY o.totalUSD asc;

--#4
SELECT customers.name, coalesce(sum(orders.totalUSD), 0.0) -- coalesce sets Weylands total to 0.0 as opposed to null
FROM customers 
LEFT OUTER JOIN orders ON customers.cid = orders.cid -- the left table is customers, so the left outer joins gives all data in left table (customer names) and put null in for total $ for weyland b/c there is no corresponding value
GROUP BY customers.cid, customers.name
ORDER BY customers.name asc;

--#5 
SELECT c.name, p.name, a.name
FROM customers c, products p, agents a, orders o
WHERE a.city = 'New York'
AND a.aid = o.aid
AND c.cid = o.cid
AND o.pid = p.pid;

--#6
SELECT o.ordnum, o.mon, o.cid, o.aid, o.pid, o.qty, o.totalUSD, (o.qty * p.priceUSD * (1 - (c.discount/100))) AS newCalc
FROM orders o  INNER JOIN customers c ON o.cid = c.cid
	       INNER JOIN products p ON o.pid = p.pid 
                                   AND o.totalUSD <> (o.qty * p.priceUSD * (1 - (c.discount/100)));  -- <> - sql opporator to check for equality
                                   --checks to see if totalUSD from base table is equal to the new calculated values
--#7
/* What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give
example queries in SQL to demonstrate. (Feel free to use the CAP database to make
your points here.) 

A left outer join results include all data in left table, and fills in nulls for when there is no corresponding data on the right table. 
A right outer join results include all data in right table and fills in nulls for when there is no corresponding data in the left table.

Left Outer Join example:
If we take for example the two tables in the CAP database Customers and Orders:

SELECT customers.name, coalesce(sum(orders.totalUSD), 0.0) FROM customers 
LEFT OUTER JOIN orders ON customers.cid = orders.cid 
GROUP BY customers.cid, customers.name
ORDER BY customers.name asc;

In this example the customer Weyland has not made any orders, thus there is no corresponding value for Weylands totalUSD of profit. 
When customers and orders are left outer joined the query results in an output which includes Weyland and includes a null value for totalUSD. 

Right Outer Join example:
If we take the two tables in the CAP database Orders and Agents:

SELECT a.name, o.ordnum
FROM orders o
RIGHT OUTER JOIN agents a ON a.aid = o.aid 
GROUP BY a.name, o.ordnum
ORDER BY a.name asc;

In this example one agent, Bond, made no orders. Therefore, in this query when the two tables are combined with a right outer join the query results in an output with all of the names of the agents table. 
Since Bond made no orders, there is a null in the place of an ordnum. This is because the right outer join includes all of the values on the right table, and inputs nulls when there is no matching value in the left table. 


*/ 
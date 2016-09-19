--Jenna Ficula
--Lab 3
--9/19/16

--#1
SELECT ordnum, totalUSD
FROM orders;

--#2
SELECT name, city
FROM agents
WHERE name = 'Smith';

--#3
SELECT pid, name, priceUSD
FROM products
WHERE quantity > 201000;

--#4
SELECT name, city
FROM customers
WHERE city = 'Duluth';

--#5
SELECT name
FROM agents 
WHERE (city != 'Duluth' 
	AND   city != 'New York');

--#6
SELECT *
FROM products
WHERE (city != 'Dallas' 
	AND   city != 'Duluth')
	AND   priceUSD >= 1;

--#7
SELECT *
FROM orders
WHERE (mon = 'feb' 
	OR   mon = 'mar');

--#8
SELECT *
FROM orders
WHERE (mon = 'feb' 
	AND   totalUSD >= 600);

--#9
SELECT *
FROM customers
WHERE cid = 'c005';

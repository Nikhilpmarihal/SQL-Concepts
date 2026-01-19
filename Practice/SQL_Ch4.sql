-- JOINS
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN

CREATE TABLE orders
(
	o_id INT,
    cust_id INT,
    price INT
);

INSERT INTO orders
VALUES
(1,101,1000),
(2,201,1000),
(3,501,1200);

CREATE TABLE customers
(
	id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO customers
VALUES
(101, 'Nik','aa'),
(201,'Mik','bb'),
(301,'Marihal','cc');

-- INNER JOIN
SELECT * 
FROM orders o 
INNER JOIN customers c
ON o.cust_id = c.id;

-- LEFT JOIN
SELECT * 
FROM orders o 
LEFT JOIN customers c
ON o.cust_id = c.id;

-- RIGHT JOIN
SELECT * 
FROM orders o 
RIGHT JOIN customers c
ON o.cust_id = c.id;

-- FULL JOIN (NOT SUPPORTED IN MYSQL)
SELECT * 
FROM orders o 
FULL JOIN customers c
ON o.cust_id = c.id;


SELECT statement is used to read something from a database

SQL QUERY CLAUSES

1.SELECT * (CHOOSE COLUMNS)
SYNTAX -SELECT * FROM Table_Name
Ex-
SELECT *
FROM customers 


2.SELECT Few Columns (CHOOSE COLUMNS)
Picks only the columns you need instead of all.

SYNTAX- 
SELECT Col 1, 
Col 2
FROM Table_Name
Ex- 
SELECT 
	first_name,
	country,
	score
FROM customers 


3.WHERE - Filters your data based on a condition

SYNTAX- 
SELECT *
FROM Table_Name
WHERE Condition
Ex- 
SELECT *
FROM customers
WHERE score != 0 --( ! = means NOT EQUAL TO) 


4.ORDER BY -  Sort your data based on
ASC ( Lowest - Highest)
DESC (Highest - Lowest)

SYNTAX-
SELECT *
FROM Table_Name
ORDER BY score DESC/ASC
Ex- 
SELECT *
FROM customers
ORDER BY score ASC


5.ORDER BY (Nested) Sort your data
 
SYNTAX-
SELECT *
FROM Table_Name
ORDER BY
Country ASC,
Score DESC

Ex-
SELECT *
FROM customers
ORDER BY 
	score DESC,
	country ASC


6.GROUP BY - Combines rows with the same value . Aggregates a column by another column (TOTAL SCORE BY COUNTRY)

SYNTAX - 
SELECT
Country,
SUM(score)
FROM Table_Name
GROUP BY country

Ex- 
SELECT 
	country,
	SUM(score) AS Total_Score
FROM customers
GROUP BY country


7.HAVING - Filters data after aggregation , can be used only with GROUP BY.

SYNTAX-
SELECT
Country,
SUM(score)
FROM Table_Name
WHERE score > 400
GROUP BY country
HAVING condition (ex- (score) > 600)

Ex- 
SELECT 
	country,
	AVG(score) AS Avg_Score
FROM customers
WHERE score ! = 0
GROUP BY country
HAVING AVG(score) > 430


8.DISTINCT- Removes duplicates (Repeated Values) each value appears only once

SYNTAX- 
SELECT DISTINCT
Col 1,
FROM Table

Ex-  
SELECT DISTINCT
	country
FROM customers


9.TOP (LIMIT) - Restrict the number of rows returned

SYNTAX-
SELECT TOP 3
*
FROM Table_Name

Ex-
SELECT TOP 3 
*
FROM customers
ORDER BY score DESC


DATA DEFINITION LANGUAGE (DDL COMMANDS)

It consists of SQL commands used to define and modify the structure of database objects like tables, indexes, and schemas.

1.CREATE-Creates a new table, view, index, or other database object.
CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * FROM persons

2.ALTER-Modifies an existing database object (like adding a column to a table).
(Add a new column called email to persons table)
ALTER TABLE Persons
ADD email VARCHAR(50) NOT NULL

SELECT * FROM persons

(Remove the column phone from the persons table)
ALTER TABLE Persons
DROP COLUMN phone

SELECT * FROM persons

3.DROP-Deletes a database object completely (e.g., a table or index).
DROP TABLE persons


DATA MANIPULATION LANGUAGE (DML COMMANDS)

It refers to the subset of SQL commands used to manipulate data stored in a database.

1.INSERT- Adds new records into a table.
SYNTAX
INSERT INTO table_name(col 1, col 2, col 3,…)
VALUES (value 1, value 2, value 3,…),
	     (value 1, value 2, value 3,…)

Ex-
INSERT INTO customers(id, first_name, country, score)
VALUES 
    (8, 'LARA', 'USA', 85),
    (9, 'RAHUL', NULL, 90),
    (10, 'MEENA', 'INDIA', NULL),
    (11, 'KAI', 'JAPAN', 70),
    (12, 'ZARA', NULL, NULL);

	SELECT *
	FROM customers

Ex- Insert data from customers into persons
INSERT INTO persons (id, person_name, date_birth, phone)
SELECT 
id,
first_name,
NULL,
'Unkown' 
FROM customers

2.UPDATE- Modifies existing records in a table.

SYNTAX-
UPDATE table_name
SET columnn1 =  value1,
	 columnn2 =  value2
WHERE <condition>

Ex- CHANGE THE SCORE OF CUSTOMER 6 TO 0 
 
UPDATE customers 
SET score = 0,
WHERE id = 6

SELECT * FROM customers

3.DELETE-  Removes records from a table.

SYNTAX- 
DELETE FROM table_name
WHERE <condition>

Ex- DELETE ALL CUSTOMERS WITH AN ID REATER THAN 5

DELETE FROM customers
WHERE id > 5 

SELECT * FROM customers

4.TRUNCATE - Clears the whole table at once without checking or logging

SYNTAX- TRUNCATE TABLE persons

FILTERING DATA-WHERE

COMPARISION OPERTOR - comapre two things
      


Ex-
SELECT *
FROM customers
WHERE country = 'Germany'
 


LOGICAL OPERTORS


AND OPERTOR EX
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500



0R OPERTOR EX
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500



NOT OPERTOR EX
SELECT *
FROM customers
WHERE NOT score < 500


BETWEEN OPERTOR EX
-- Retrieve all customers whose score falls in the range between 100 and 500.
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500

-- Alternative method (Equivalent to BETWEEN)
SELECT *
FROM customers
WHERE score >= 100 AND score <= 500



IN OPERTOR EX

-- Retrieve all customers from either Germany or the USA.
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA')


LIKE OPERTOR EX

LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"

1.
-- Find all customers whose first name starts with 'M'.
SELECT *
FROM customers
WHERE first_name LIKE 'M%'


2.
-- Find all customers whose first name ends with 'n'.
SELECT *
FROM customers
WHERE first_name LIKE '%n'


3.
-- Find all customers whose first name contains 'r'.
SELECT *
FROM customers
WHERE first_name LIKE '%r%'


4.
-- Find all customers whose first name has 'r' in the third position.
SELECT *
FROM customers
WHERE first_name LIKE '__r%'


JOINS BASIC



Ex-
-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id



-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id



-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id = o.customer_id



-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id = o.customer_id




-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL





-- RIGHT ANTI JOIN
/* Get all orders without matching customers */
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL


-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.customer_id IS NULL OR c.id IS NULL

/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

/* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */

USE SalesDB

SELECT 
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.Product AS ProductName,
    p.Price,
    e.FirstName AS EmployeeFirstName,
    e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID


-- CROSS JOIN
/* Generate all possible combinations of customers and orders */
SELECT *
FROM customers
CROSS JOIN orders

SET OPERATORS
 SQL set operations enable you to combine results from multiple queries
   into a single result set. This script demonstrates the rules and usage of
   set operations, including UNION, UNION ALL, EXCEPT, and INTERSECT.
![image](https://github.com/user-attachments/assets/2567e8bf-6906-4f73-8535-6739768aa77e)

-- DDL Commands
-- DDL stands for DATA DEFINITION LANGUAGE. 
-- These are SQL commands used to define, modify or delete the structure of database objects such as tables, indexes and schema
-- DDL COMMANDS - Create, Alter, Drop, Truncate

-- Create Database
CREATE DATABASE sales;

-- Create Table
CREATE TABLE stores
(
	store_id INT,
    store_name VARCHAR(200)
);

-- Insert Some Records
INSERT INTO stores(store_id)
VALUES
(3);

-- Constraints in SQL are rules applied to table columns to enforce data integrity and accuracy. 
-- They ensure that the data entered into a database is valid, consistent and follows the rules you define.
-- NOT NULL, UNIQUE, PRIMARY KEY, CHECK, DEFAULT

-- Create another Table with different constraints
-- Create Table
CREATE TABLE stores_new
(
	store_id INT UNIQUE,
    store_name VARCHAR(200) NOT NULL
);

-- Insert Some Data
INSERT INTO stores_new
VALUES
(1,"store_xyz");

-- Note: This will fail if store_id=1 already exists due to UNIQUE constraint
-- INSERT INTO stores_new (store_id, store_name) VALUES (1, 'another_store'); -- This would cause error

-- ALTER COMMAND
ALTER TABLE stores_new
ADD COLUMN store_city varchar(200);

-- Additional ALTER examples:
-- ALTER TABLE stores_new MODIFY COLUMN store_city VARCHAR(255);
-- ALTER TABLE stores_new DROP COLUMN store_city;
-- ALTER TABLE stores_new RENAME COLUMN store_city TO city;

ALTER TABLE stores_new
RENAME COLUMN store_city to store_location;
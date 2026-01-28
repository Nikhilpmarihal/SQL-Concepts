-- SUB QUERIES
-- SQL SUB QUERIES ARE QUERIES WRITTEN INSIDE ANOTHER QUERY.
-- BASICALLY A QUERY WITHIN A QUERY.
-- THEY ARE USED WHEN YOU NEED TO GET A RESULT FROM ONE QUERY AND USE IT INSIDE ANOTHER.

SELECT AVG(unit_price) FROM dim_product;

SELECT
	*
FROM
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product);
    
-- 2)

SELECT 
	*
FROM
(
	SELECT
    *
FROM 
	dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
) AS subquery_table
WHERE
	product_name = 'Figure Method';

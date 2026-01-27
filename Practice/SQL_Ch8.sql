-- WINDOW FUNCTIONS
-- WINDOW FUNCTIONS IN SQL ARE SPECIAL FUNCTIONS THAT PERFORM CALCULATIONS ACROSS A SET OF ROWS.
-- BUT  WITHOUT COLLAPSING THEM INTO A SINGLE OUPUT ROW.
-- THEY ALLOW YOU TO DO THINGS LIKE RANKING , RUNNING TOTALS, MOVING AVG AND 
-- COMPARASION BETWEEN ROWS WHILE STILL KEEPING ALL THE ROWS IN THE RESULTS.

SELECT * FROM dim_product;

-- 1)
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY launch_date)
FROM
	dim_product;
    
    -- 2) FRAMES
    SELECT 
    *,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM
	dim_product;
    
    SELECT 
    *,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM
	dim_product;
    
-- RANKING FUNCTIONS
-- 1)
SELECT 
	unit_price,
    ROW_NUMBER() OVER (ORDER BY unit_price) AS 'row_number',
    RANK() OVER(ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(ORDER BY unit_price) AS 'dense_rank'
FROM
	dim_product;
    
-- 2)
SELECT 
	unit_price,
    category,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY unit_price) AS 'row_number',
    RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'dense_rank'
FROM
	dim_product;
    
    
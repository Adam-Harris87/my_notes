USE employees;
SELECT * FROM employees;

SELECT REPLACE('hello oneil class!', 'oneil', 'O\'Neil');

USE albums_db;
SELECT genre, REPLACE(genre, 'rock', '**ROCK**')
	FROM albums;

SELECT NOW();
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURTIME();
SELECT CONVERT_TZ(CURTIME(), '+00:00', '-06:00');

USE chipotle;
SELECT * FROM orders;

-- find all unique items with chicken
SELECT DISTINCT item_name
	FROM orders
    WHERE item_name LIKE '%chicken%';
SELECT item_name
	FROM orders
    WHERE item_name LIKE '%chicken%'
    GROUP BY item_name;
    
-- can group by multiple variables
-- find all unique combinations of chicken and their quantity

-- if we try to use a function without making it an agragate function, 
-- it will return the quantity ordered at one time for each item
-- this will create multiple rows for each item
SELECT item_name, quantity
	FROM orders
    WHERE item_name LIKE '%chicken%'
    GROUP BY item_name, quantity
    ORDER BY item_name;
    
-- to get a total count    
SELECT item_name, COUNT(*)
	FROM orders
    WHERE item_name LIKE '%chicken%'
    GROUP BY item_name
    ORDER BY item_name;

-- this will show how many times an item was ordered at each quantity per order
SELECT item_name, quantity, COUNT(*)
	FROM orders
    WHERE item_name LIKE '%chicken%'
    GROUP BY item_name, quantity
    ORDER BY item_name;
    
-- HAVING
-- acts similar to WHERE but affecting items from GROUP BY
SELECT item_name, COUNT(item_name) AS count_items
	FROM orders
	WHERE item_name LIKE '%chicken%'
    GROUP BY item_name
    HAVING count_items > 100
    ORDER BY item_name;

-- CASE
USE chipoltle;
SHOW TABLES;
SELECT * FROM orders LIMIT 10;
DESCRIBE orders;
SELECT item_name FROM orders LIMIT 5;

-- suppose we want to give a certain output if item is a 'chicken' item
-- if we just want an output of true/false then we can use
SELECT item_name
FROM orders
WHERE item_name LIKE '%chicken%';

-- if we want to change the output to somehting else then we can use and if
SELECT item_name,
	IF (item_name LIKE '%chicken%', 1, 0) AS chicken_type
FROM orders;

-- if syntax is
-- IF (<condition to test if true>, <value returned if case is true>, <value returned if case is false>)
-- can also nest if statements to create multiple conditions
SELECT item_name,
	IF(item_name LIKE '%steak%', 
		IF(item_name LIKE '%bowl', 'steak bowl', 'other steak item'),
	'not steak item') AS steak_col
FROM orders;

-- Use a case statement if we want to use multiple conditions
-- Case statements are like IF but structured differently
-- CASE allows for multiple logic checks in a row
-- using the same example as the IF statemtnt:

SELECT item_name,
	quantity,
	CASE item_name
		WHEN 'chicken bowl' THEN 'chicken bowl'
		WHEN 'chicken burrito' THEN 'chicken burrito'
        ELSE 'not chicken item'
	END AS chicken_stuff
FROM orders;

-- limitations of case
-- **can only check for direct equivalence**
SELECT item_name,
	CASE item_name
		WHEN LIKE '%chicken%' THEN 1 -- THIS WILL BREAK
        ELSE 0
	END AS chic
FROM orders;

-- TO FIX THIS WE SIMPLY SPECIFY THE FIELD TO COMPARE
SELECT item_name,
	CASE              -- remove the field name from here
		WHEN item_name LIKE '%chicken%' THEN 'chickeny' -- add the field name to each comparison line
        WHEN item_name LIKE '%steak%' THEN 'steak'
        WHEN item_name IS NULL THEN 'what did you order?' -- 
        ELSE 'lame stuff'
	END AS chic
FROM orders;

USE joins_example_db;
SELECT COUNT(IF(role_id = 3, 1,0)) AS role_3 FROM users;

-- TEMPORARY TABLES
-- during the Codeup classes, we can only write databases to 'oneil_####'

USE oneil_2093;

-- create temp table called my_numbers with 2 columns, n & name
CREATE TEMPORARY TABLE my_numbers
	(
    n int unsigned not null,
    name varchar(20) not null
    );
    
Select * FROM my_numbers;
SHOW tables;
-- temp tables will not show up on the tables list

-- inserting data into my_numbers
INSERT INTO my_numbers(n, name)
VALUES (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e'), (6, 'f');

SELECT * FROM my_numbers;

-- update values in temp table
UPDATE my_numbers
SET name = 'BIG'
WHERE n >= 4;

SELECT * FROM my_numbers;

-- delete values from temp table
DELETE FROM my_numbers
WHERE n=2;

-- we can perform any normal operations on the temp table
SELECT AVG(n) AS avg_number
FROM my_numbers;

-- if we want to add a column to our temp table we use alter to create the new column, without any data
ALTER TABLE my_numbers
ADD avg_number FLOAT;

-- then we can add in the data to the new column
UPDATE my_numbers
SET avg_number = 
	(3.8000);
    
-- then to remove the column
ALTER TABLE my_numbers
DROP COLUMN avg_number;

SELECT * FROM my_numbers;

-- finally to delete the temp table
DROP TABLE my_numbers;
SELECT * FROM my_numbers; -- nothing returned
-- table is also deleted when disconnecting from server
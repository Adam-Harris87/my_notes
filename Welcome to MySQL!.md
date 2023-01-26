-- Welcome to MySQL!  
-- two dashes means comment
/* this
is
a
multi-line comment */

SHOW DATABASES; --will show the databases in server

--If we want to know what the DDL (definition) looks like
SHOW CREATE DATABASE chipotle;

--USE will tell MySQL to use only a specific database
USE chipotle;

--now we can see all the talbes for this db
SHOW TABLES;

--give me info on the table's creation
SHOW CREATE TABLE orders;

--show us what db(schema) we are in
SELECT DATABASE();

-- wildcard can be used to pad for zero or more characters
--IN
SELECT * FROM fruits WHERE name IN('apple', 'dragonfruit');

-- a table MUST RETURN a table that is uniform in size
-- cannot have a L shape ie
-- CANNOT return a column with 1 row AND a column of 50 rows

-- combine IN and LIKE
-- MySQL cannot combine IN and LIKE!
SELECT * from category WHERE (category_id > 4) 
	AND (name LIKE 'c%' OR name LIKE 's%' OR name LIKE 't%');

-- if we need to have a ' inside of a string we are looking for such as looking for
-- 'Sgt. Pepper's Lonely' we can use either
-- a \ break character in front of the ' such as 'Sgt. Pepper\'s Lonely'
-- or a double quote character around the string such as "Sgt. Pepper's Lonely"
-- or use two single quote characters at the ' such as 'Sgt. Pepper''s Lonely'

-- ORDER BY <- a clause to sort by columns [ASC](default) or [DESC]
-- LIMIT <- cut off our values at a certain point
-- OFFSET <- skip a number of values

-- we can ORDER BY multiple fields, just separate them with a comma
-- each field can be ASC or DESC

-- current layout for query syntax:
-- SELECT (what field(s))
-- FROM (what table)
-- [WHERE] (conditions)
-- [ORDER BY] (how to sort)
-- [LIMIT] (max rows returned)

SELECT * FROM albums LIMIT 5 OFFSET 10;
-- OFFSET will work in conjunction with a LIMIT to skip the first 10 rows and return 5 rows
-- 

-- Functions

-- count
SELECT COUNT(*) FROM albums;
SELECT COUNT(name) FROM albums;

-- min, max, avg
SELECT MIN(release_date) FROM albums;
SELECT ROUND(AVG(release_date) ,#digits_to_round) FROM albums;

-- CONCAT combines strings
SELECT CONCAT('hello, 'world', '!');
SELECT CONCAT('My favorite artists ', artist, '!') FROM albums;

SELECT CONCAT(artist, ' -- ', name) AS artist_album;

-- SUBSTRING extracts a portion of element
-- SUBSTR(string, start, length)

-- ** SQL counting starts at 1, as opposed to most languages that start at 0 **

SELECT SUBSTR('hello oneil class', 7, 5);  <- oneil
-- leaving out the last digit will go until the end of the string
SELECT SUBSTR('hello oneil class', 7);  <- oneil class
-- can count from the end by using negative number
SELECT SUBSTR('123-456-7890', -4);  <- 7890

-- Case conversion
SELECT * FROM albums;
SELECT UPPER(artist) FROM albums;
SELECT LOWER(artist) FROM albums;








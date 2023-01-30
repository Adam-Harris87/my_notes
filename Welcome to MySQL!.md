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

-- Replace: replace an element with something else
-- format: REPLACE(string, from_string, new_sting)

SELECT REPLACE('hello oneil class!', 'oneil', 'O\'Neil');

USE albums_db;
SELECT genre, REPLACE(genre, 'rock', '**ROCK**')
	FROM albums;

-- TIME AND DATE FUNCTIONS
SELECT NOW();
SELECT CURRENT_DATE();
SELECT CURDATE();
SELECT CURTIME();
SELECT CONVERT_TZ(NOW(), '+00:00', '-06:00')

-- Specific format for date
-- can return 2-digit month or year

SELECT DATE_FORMAT(CURDATE(), '%m')

Specifier	Description
%a	Abbreviated weekday name (Sun..Sat)
%b	Abbreviated month name (Jan..Dec)
%c	Month, numeric (0..12)
%D	Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
%d	Day of the month, numeric (00..31)
%e	Day of the month, numeric (0..31)
%f	Microseconds (000000..999999)
%H	Hour (00..23)
%h	Hour (01..12)
%I	Hour (01..12)
%i	Minutes, numeric (00..59)
%j	Day of year (001..366)
%k	Hour (0..23)
%l	Hour (1..12)
%M	Month name (January..December)
%m	Month, numeric (00..12)
%p	AM or PM
%r	Time, 12-hour (hh:mm:ss followed by AM or PM)
%S	Seconds (00..59)
%s	Seconds (00..59)
%T	Time, 24-hour (hh:mm:ss)
%U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
%u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
%V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
%v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
%W	Weekday name (Sunday..Saturday)
%w	Day of the week (0=Sunday..6=Saturday)
%X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
%x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
%Y	Year, numeric, four digits
%y	Year, numeric (two digits)
%%	A literal % character
%x	x, for any “x” not listed above

-- Changing datatype of variable
-- SQL will generally be smart enough to figure out datatypes
-- format: CAST(value AS new_type)
SELECT 1 + '2';  <- 3
SELECT 1 + CAST('2' AS UNSIGNED);


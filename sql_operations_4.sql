-- DELETE: It is used to remove the data of one or more rows from a table
-- DELETE: Remove the record from users table where user id is 19
DELETE FROM users WHERE id = 19;

SELECT * FROM users;

-- DELETE: Remove multiple rows based on a condition
DELETE FROM users WHERE salary = 96376.00 OR salary = 99183.00;

-- DELETE: Remove entire table data but keep the structure of the table
-- Writing syntax and not running this query to avoid removal of the data and rework to insert table data
DELETE FROM users;

-- DROP: Drop table command is used to remove the entire table along with its structure and meta data. Once executed the command, the table will be lost and a new table has to be created.
-- It is a good practice to backup all the important data before performing a destructive operation such as DROP query.
-- Will not execute the query below unless very important, since it will drop the table and data will be lost.So, just for understtanding purpose, writing the below query
DROP TABLE users;
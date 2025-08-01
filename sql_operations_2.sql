USE sqlOperations;

SELECT * FROM users;

UPDATE users
SET salary = FLOOR(RAND() * 90000 + 10000)
WHERE id > 0;

-- Querying the database
SELECT * FROM users; 

-- Selecting specific fields/columns to display
SELECT name, gender FROM users;

-- WHERE clause : This is used to add a condition to list the data
-- WHERE clause : to get the data from the users table having gender as `Female` 
SELECT * FROM users WHERE gender = "Female";

-- WHERE clause : to get the data from the users table having gender as `Male` 
SELECT * FROM users WHERE gender = "Male";

-- WHERE clause to get the users born before `1991-12-31`
SELECT * FROM users WHERE date_of_birth < "1991-12-31";

-- WHERE clause to get the users whose id is greater than 15 and who are born before `1991-12-31`
SELECT * FROM users WHERE id > 15 AND date_of_birth < "1991-12-31";

-- WHERE clause to get the users whose date of birth is filled as NULL
SELECT * from users WHERE date_of_birth IS NULL;

-- WHERE clause to get the users whose date of birth NOT NULL
SELECT * from users WHERE date_of_birth IS NOT NULL;

-- BETWEEN : This is an operator used to set a range in query, to access the data of that matching range. Specifically it is used with WHERE clause.
-- EXAMPLE of BETWEEN used to get the users who were born between `1990-01-01` and `2000-01-01`
SELECT * FROM users WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

-- IN : This is another kind of operator which is used to get the data from a set of inputs from a table
-- EXAMPLE of IN : Get the list of users whose Gender is either `Female` or `Others`
SELECT * from users WHERE gender IN ('Female', 'Others');

-- AND : This is an operator, used to combine multiple conditions in a query
-- Example of AND: Get the list of all users whose gender is `Female` and salary is greater than 80000
SELECT * FROM users WHERE gender = 'Female' AND salary > 80000;

-- AND : Get the list of all users whose gender is `Male` and salary is greater than 70000
SELECT * FROM users WHERE gender = 'Male' AND salary > 70000;

-- OR : This is an operator, used to combine multiple conditions in a query
-- Example of OR: Get the list of all users whose gender is `Female` or salary is greater than 80000
SELECT * FROM users WHERE gender = 'Female' OR salary > 80000;

-- AND : Get the list of all users whose gender is `Male` or salary is greater than 70000
SELECT * FROM users WHERE gender = 'Male' OR salary > 70000;

-- ORDER BY clause : It is used to sort the result set of a query which is based on certain columns
-- Example of ORDER BY : Get the list of all users whose gender is `Female` AND salary is greater than 70000 which is sorted in ascending order by date_of_birth
SELECT * FROM users WHERE gender = 'Female' AND salary > 70000 ORDER BY date_of_birth ASC;

-- LIMIT : Get the list of all users whose gender is `Male` AND salary is greater than 70000 which is sorted in descending order by id
SELECT * FROM users WHERE gender = 'Male' AND salary > 70000 ORDER BY id DESC;

-- LIMIT clause : It is used restrict the number of rows returned by a query
-- Example of LIMIT : Get the list of all users whose gender is `Female` AND salary is greater than 65000 which is sorted in ascending order by date_of_birth, and limit is set to 5
SELECT * FROM users WHERE gender = 'Female' AND salary > 65000 ORDER BY date_of_birth ASC LIMIT 5;

-- LIMIT : Get the list of all users whose gender is `Male` AND salary is greater than 70000 which is sorted in descending order by id, and limit is set to 5
SELECT * FROM users WHERE gender = 'Male' AND salary > 70000 ORDER BY id DESC LIMIT 5;

-- LIMIT : Get the list of users whose salary is less than 50000 and limiting it to 10 entries
SELECT * FROM users WHERE salary < 50000 LIMIT 10;





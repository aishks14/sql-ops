use sqlOperations;

-- UPDATING the data with UPDATE statement
-- First see entire table using SELECT statement
-- SELECT : This is an statement in SQL which is used to retrieve data from a database
SELECT * FROM users;

-- UPDATE : This is an statement in SQL which is used to modify or update the existing records in a table
-- UPDATE : Update the salary of the user to 100000 from users table whose id is 5
UPDATE users 
	SET salary = 100000
    WHERE id = 5;
    
-- UPDATE : Update the email of the user from users table whose id is 2
UPDATE users 
	SET email = 'isha.kapoor@sqlops.com'
    WHERE id = 2;
    
-- UPDATE : Update the name of the user from users table where email is `sneha.reddy@example.com`
UPDATE users 
	SET name = 'Sneha Pandey'
    WHERE email = 'sneha.reddy@example.com';
    
-- UPDATE : Update the email of the user from users table where id is 6
UPDATE users 
	SET email = 'sneha.pandey@sqlops.com' 
    WHERE id = 6;
    
-- UPDATE: Increase the salary by 5000 where salary is less than 40000
UPDATE users 
	SET salary = salary + 5000
    WHERE salary < 40000;
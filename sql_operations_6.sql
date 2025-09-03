-- SQL Functions and Operations
	-- Here we will see some basic operations and functions in SQL
	-- We will be using the same table 'users' created in previous steps    
    -- AGGREGAT FUNCTIONS
		-- Aggregate functions perform a calculation on a set of values and return a single value.
		-- Common aggregate functions include COUNT, SUM, AVG, MAX, and MIN.

    
		-- COUNT: Counts total number of rows which are matching to the criteria
		-- COUNT: Get the total count of the users from the `users` table
		SELECT COUNT(*) AS total_users FROM users;
		
		-- COUNT(): Get the total count of the organizations whose industry is `IT Services` or `IT Association`. Query in `organization` table
		SELECT COUNT(*) FROM organization
		WHERE industry = 'IT Services' OR industry = 'IT Association';
		
		-- COUNT() : Get the total count of the organizations whose industry is `IT Services` or `IT Association` using IN operator. Query in `organization` table
		SELECT COUNT(*) AS total_it_organizations 
		FROM organization 
		WHERE industry IN ('IT Services', 'IT Association');
		
		-- MIN(): Gets the minimum value from a range
		-- MIN(): Get the minimum salary from `users` table
		SELECT min(salary) FROM users;
		
		-- MIN(): Gets the minimum value from a range
		-- MIN(): Get the minimum salary from `users` table where gender is `Male`
		SELECT min(salary) FROM users WHERE gender='Male';
		
		-- MAX(): It is an aggregate function of SQL which calculates the maximum value of the range provided.
		-- MAX(): Get the maximum of total_emp from `organization` table.
		SELECT MAX(total_emp) FROM organization;
		
		-- SUM(): I calculates the total of a numeric column which is present in a table
		-- SUM(): Calculate the sum of budget from table `org_initiatives`
		SELECT SUM(budget_million) FROM org_initiatives;
		
		-- AVG(): It computes the average of a numeric column
		-- AVG(): Calculate the average salary from the `users` table
		SELECT AVG(salary) FROM users;
    
    -- STRING functions: These are the functions to combine or modify the text fields
		-- UPPER(): It converts the string to uppercase
        -- UPPER(): Convert the names to upper case in `users` table for entire column. This will be using UPDATE query as well
        UPDATE users
		SET name = UPPER(name);
        
        -- LOWER(): It converts the string to lowercase
		-- LOWER(): Convert the names to lower case in `users` table for entire column. This will be using UPDATE query as well
        UPDATE users
		SET name = LOWER(name);
        
        -- LENGTH(): 
        
        SHOW Databases;
        
        SELECT * FROM organization;
        SELECT * FROM CEO;
        
        UPDATE CEO
        SET org_id = org_id + 100
		WHERE c_id BETWEEN 1 AND 40;
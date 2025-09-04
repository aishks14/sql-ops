USE sqloperations;
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
        
        -- LENGTH(): This function is used to return the length of the string in bytes
			-- LENGTH(): Get the length of each email from table `accounts` AS email_length
			SELECT email, LENGTH(email) AS email_length FROM accounts;
        
			-- LENGTH(): Get all the CEOs from `ceo` table with email longer than 15 characters
			SELECT * FROM ceo
			WHERE LENGTH(email) > 15;
        
			-- LENGTH(): Sort all the CEOs data from `ceo` table with their name length in DESCENDING order
			SELECT *, LENGTH(name) AS name_length FROM ceo
			ORDER BY LENGTH(name) DESC;
        
		-- UPDATE() : Updatw the domain of the email randomly from few records to `@newdomain.com` from `accounts` table
		UPDATE accounts
		SET email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@newdomain.com')
		WHERE account_id IN(401, 405, 406, 420, 425, 427);
			
		-- UPDATE() : Updatw the domain of the email randomly from few records to `@digicrome.com` from `accounts` table
		UPDATE accounts
		SET email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@digicrome.com')
		WHERE account_id IN(403, 408, 410, 415, 416, 417);
			
		-- UPDATE() : Updatw the domain of the email randomly from few records to `@example.in` from `accounts` table
		UPDATE accounts
		SET email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@example.in')
		WHERE account_id IN(402, 409, 411, 418, 423, 427, 435, 439);
            
        -- SUBSTRING_INDEX() : This helps in extracting a part of a string which is based on a delimeter. Useful when spliting the string
			-- SUBSTRING_INDEX() : Extract domain from email and count frequency
            SELECT 
			  SUBSTRING_INDEX(email, '@', -1) AS domain,
			  COUNT(*) AS domain_count
			FROM accounts
			GROUP BY domain
			ORDER BY domain_count DESC;
        -- ALTER : Alter table accounts and add a column pan_number with allowed string of 10 characters
		ALTER TABLE accounts
		ADD COLUMN pan_number VARCHAR(10);
         
		-- FLOOR() : It rounds a number down to the nearest integer
        -- RAND() : Returns a random float number bewtween 0 and 1
        -- CHAR() : It converts one or more integer ASCII values into a string
        -- LPAD() : Pads the left side of a string with a specified character (or string) until it reaches the desired length
			-- UPDATE : Update the table `accounts` with PAN numbers added in each row
			UPDATE accounts
			SET pan_number = CONCAT(
				CHAR(FLOOR(65 + RAND() * 26)),
				CHAR(FLOOR(65 + RAND() * 26)),
				CHAR(FLOOR(65 + RAND() * 26)),
				CHAR(FLOOR(65 + RAND() * 26)),
				CHAR(FLOOR(65 + RAND() * 26)),
				LPAD(FLOOR(RAND() * 10000), 4, '0'),
				CHAR(FLOOR(65 + RAND() * 26))
			);
        
			-- Validate the PAN number in accounts table
			SELECT 
			  full_name,
			  pan_number,
			  CASE 
				WHEN pan_number REGEXP '^[A-Z]{5}[0-9]{4}[A-Z]$' THEN 'Valid'
				ELSE 'Invalid'
			  END AS pan_status
			FROM accounts;
            
            -- SPLIT the full name into first_name and last_name from `accounts` table
            SELECT 
				SUBSTRING_INDEX(full_name, ' ', 1) AS first_name,
                SUBSTRING_INDEX(full_name, ' ', -1) AS last_name
			FROM accounts;
            
		
        -- LENGTH() : counts the actual storage size in bytes. It is useful for planning, data compression, or binary data
        -- CHAR_LENGTH() : It counts the visible characters. This is ideal for validation, UI display, or text truncation logic
			-- CHAR_LENGTH() : Find the longest name from `accounts` table
			SELECT full_name
			FROM accounts
			ORDER BY CHAR_LENGTH(full_name) DESC
			LIMIT 1;
		
        -- DATE_FORMAT() : It is a precision tool for turning raw date values into readable, customized strings
        -- CONCAT() : This is used for joining mutliple strings into one
			-- CONCAT() : Concatenate multiple fields with formatting
			SELECT 
			  CONCAT(full_name, ' (', email, ') - Joined on ', DATE_FORMAT(signup_date, '%d-%b-%Y')) AS user_summary
			FROM accounts;
            
		-- LEFT() : It is a string manipulation tool that extracts a specified number of characters from the beginning (left side) of a string
			-- LEFT() : Get the first 6 characters of a string
            SELECT LEFT("String Functions", 6) AS short_string;
            
            -- LEFT() : Get the short name of the organization from `ceo` table. This should be first three characters of the `org_name`
            SELECT LEFT(org_name, 3) AS short_org_name FROM ceo;
            
		-- RIGHT() : It is a string manipulation tool that extracts a specified number of characters from the last (right side) of a string
			-- RIGHT() : Get the last 9 characters of a string
            SELECT RIGHT("String Functions", 9) AS short_string;
            
            -- RIGHT() : Get the short name of the ceo from `ceo` table. This should be last six characters of the `name`
            SELECT RIGHT(name, 6) AS short_name FROM ceo;
            
            -- RIGHT(): Get the RIGHT used in `users` table on email column
            SELECT email, RIGHT(email, 3) FROM users;
            
		-- REVERSE() : It flips a string so the characters appear in reverse order
			-- REVERSE() : Reverse a string
            SELECT REVERSE('String Functions') AS reversed_string;
		
        -- REPLACE() : Tool for swapping out parts of a string with something new
			-- REPLACE() : Replace a word in a string
            SELECT REPLACE('SQL Tutorial', 'SQL', 'Python') AS UpdatedText;
            
            -- REPLACE() : Replace the email with new email
            SELECT 
			   id,
			   email,
			   REPLACE(email, '@example.com', '@wip.com') AS updated_email
			FROM users;
            
            -- REPLACE() : Replace the email with new email. Provide condition with `WHERE` clause
            SELECT 
			   id,
			   email,
			   REPLACE(email, '@example.com', '@wip.com') AS updated_email
			FROM users
            WHERE id IN (1, 5, 7, 8, 9,20, 25, 30, 39);
        
        SHOW tables;
        
        SELECT * FROM ceo;
        SELECT * FROM users;
        
        SELECT * FROM accounts;
        
        UPDATE CEO
        SET org_id = org_id + 100
		WHERE c_id BETWEEN 1 AND 40;
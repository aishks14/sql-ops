USE sqloperations;
-- SQL Functions and Operations
	-- Here we will see some basic operations and functions in SQL
	-- We will be using the same table 'users' created in previous steps    
    -- AGGREGATE FUNCTIONS
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
    
    -- STRING FUNCTIONS
		-- These are the functions to combine or modify the text fields
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

	-- DATE FUNCTIONS
		-- These are the functions which are used to manipulate and extract the information from date and time values.
			-- NOW() : It returns the current date and time in 'YYYY-MM-DD HH:MM:SS' format
				-- NOW() : Return currrent date from the `users` table. This should be done for all rows in the table and list down the name, and dob_year
				SELECT name, NOW() AS query_date_time FROM users;
                
			-- YEAR() : It is used to extract the Year from a date
				-- DATE() : Find the year of the `date_of_birth` from the `users` table to list the year AS `dob_year`. This should be done for all rows in the table and list down the name, and dob_year
                SELECT name, YEAR(date_of_birth) AS dob_year FROM users;
                
			-- MONTH(): It is used to extract the month (from 1 to 12) from a date
				-- MONTH() : Find the month of the `date_of_birth` from the `users` table to list the month AS `dob_month`. This should be done for all rows in the table and list down the name, and dob_month
				SELECT name, MONTH(date_of_birth) AS dob_month FROM users;
                
			-- DAY() : It is used to extract the day from a date
				-- DAY(): Find the day of the `date_of_birth` from the `users` table to list the day AS `dob_day`. This should be done for all rows in the table and list down the name, and dob_month
				SELECT name, DAY(date_of_birth) AS dob_day FROM users;
                
			-- DATEDIFF() : It is used to calculate the difference between two dates. The returning part is the number of date part specified between two dates. MySQL only supports days which it returns as a result. 
				-- DATEDIFF(): Find the date difference between `date_of_birth` and `created_at` from `users` table AS `date_difference`
				SELECT name, date_of_birth, created_at, DATEDIFF(created_at, date_of_birth) AS date_difference FROM users;

			-- TIMESTAMPDIFF() : This function is used to calculate the difference between two date or datetime values. This can be used to get the result in units of time (days, months, years, minutes, seconds)
				-- TIMESTAMPDIFF(): Get the TIMESTAMPDIFF between `dob` and `appointed_on` from the table `CEO`, Get the results as `months_diff` calculating the difference of months from 2 dates. Give the results for `c_id`s between 21 and 40
				SELECT 
					name, 
                    dob, 
                    appointed_on, 
                    TIMESTAMPDIFF(MONTH, dob, appointed_on) as months_diff
				FROM ceo
				WHERE c_id BETWEEN 621 AND 640;

			-- TIMESTAMPDIFF(): Get the TIMESTAMPDIFF between `dob` and `appointed_on` from the table `CEO`. Get the results as `days_diff` calculating the difference of days from 2 dates. Give the result for `c_id`s between 5 and 10
			SELECT 
				name, 
				dob, 
				appointed_on, 
				TIMESTAMPDIFF(DAY, dob, appointed_on) as days_diff 
			FROM CEO WHERE c_id BETWEEN 605 AND 610;

			-- TIMESTAMPDIFF(): Get the TIMESTAMPDIFF between `dob` and `appointed_on` from the table `CEO`, Get the results as `years_diff` calculating the difference of years from 2 dates. Give the results for `c_id`s between 5 and 40
			SELECT 
				name, 
                dob, 
                appointed_on, 
                TIMESTAMPDIFF(YEAR, dob, appointed_on) as years_diff 
			FROM CEO WHERE c_id BETWEEN 605 AND 640;

			-- TIMESTAMPDIFF(): Get the TIMESTAMPDIFF between `dob` and `appointed_on` from the table `CEO`, Get the results as `weeks_diff` calculating the difference of weeks from 2 dates. Give the results for `c_id`s between 5 and 40
			SELECT 
				name, 
                dob, 
                appointed_on, 
                TIMESTAMPDIFF(WEEK, dob, appointed_on) as weeks_diff 
			FROM CEO WHERE c_id BETWEEN 605 AND 640;

			-- DAYOFWEEK(): It is used to extract the weekday index from a date (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
				-- DAYOFWEEK(): Get the DAYOFWEEK from `appointed_on` column from `ceo` table. This should be done for all rows in the table and list down the name, and appointed_on date with day of week index
				SELECT 
					name, 
					appointed_on, 
					DAYOFWEEK(appointed_on) AS day_of_week_index 
				FROM ceo;

			-- DAYNAME(): It is used to extract the weekday name from a date
				-- DAYNAME(): Get the DAYNAME from `appointed_on` column from `ceo` table. This should be done for all rows in the table and list down the name, and appointed_on date with day of week name
				SELECT 
					name, 
					appointed_on, 
					DAYNAME(appointed_on) AS day_of_week_name 
				FROM ceo;

	-- MATHEMATICAL FUNCTIONS
		-- These are the functions which are used to perform mathematical calculations on numeric data.
			-- ROUND(): It is used to round a number to a specified number of decimal places
				-- ROUND(): Round the salary from `users` table to 2 decimal places.
				SELECT 
					salary, 
					ROUND(salary, 2) AS rounded_salary 
				FROM users;	

			-- CEIL(): It is used to round a number up to the nearest integer
				-- CEIL(): Round the salary from `users` table to the next highest integer.
				SELECT 
					salary,
					CEIL(salary) AS ceil_salary 
				FROM employee;

			-- FLOOR(): It is used to round a number down to the nearest integer
				-- FLOOR(): Round the salary from `users` table to the next lowest integer.
				SELECT 
					salary,
					FLOOR(salary) AS floor_salary 
				FROM employee;
            
			-- MOD(): It is used to return the remainder of a division operation between two numbers
				-- MOD(): Get the MOD of salary by 1000 from `employee` table
				SELECT 
					salary,
					MOD(salary, 1000) AS mod_salary 
				FROM employee;

				-- MOD(): Find Employees who are in even number numbered organizations from `employee` table
				SELECT * FROM employee
				WHERE MOD(org_id, 2) = 0;

			-- POW(): It is used to raise a number to the power of another number
				-- POW(): Get the POW of 2 raised to the power of 5
				SELECT POW(2, 5) AS power_value;

			-- SQRT(): It is used to calculate the square root of a number
				-- SQRT(): Get the SQRT of 256
				SELECT SQRT(256) AS sqrt_value;

			-- TRUNCATE(): Truncates x to n decimal places (no rounding)
				-- TRUNCATE(): Truncate the salary from `employee` table to 1 decimal place
				SELECT 
					salary,
					TRUNCATE(salary, 1) AS trunc_salary
				FROM employee; 

			-- ABS(): Returns the absolute value of x
				-- ABS(): Get the absolute value of any negative number that can be part of any table with numeric column.
				SELECT ABS(-123.45) AS absolute_value;
            
			-- DEGREES(): It converths the radians to degress.
				-- DEGREES(): Convert radians to degrees using Pi value
				SELECT DEGREES(3.14) AS degrees_from_radians;
			
            -- RADIANS(): It converths the degrees to radians.
				-- RADIANS(): Convert degrees to radians using Pi value
				SELECT RADIANS(3.14) AS radians_from_degrees;

	-- CONDITIONAL FUNCTIONS
		-- These are the functions which are used to perform conditional operations based on certain criteria.
			-- IF(): It is used to return one value if a condition is true and another value if the condition is false
				-- IF() : Check if the salary from `employee` table is greater than 600000, then return 'High Salary', else return 'Low Salary'
				SELECT
					salary,
					IF(salary > 600000, 'High Salary', 'Low Salary') AS salary_category
				FROM employee;

			-- CASE(): CASE expression evaluates conditions and returns a result when the first condition is met.
				-- CASE() : Categorize salary from `employee` table with high, medium, and low bands.
				SELECT e_id,
					salary,
					CASE 
						WHEN salary >= 500000 THEN 'High'
						WHEN salary BETWEEN 100000 AND 499999 THEN 'Medium'
						ELSE 'Low'
					END AS salary_band
				FROM employee;

			-- NESTED IF(): It is used to evaluate multiple conditions in a single statement
				-- NESTED IF(): simplify the CASE logic into a single IF() statement
				SELECT e_id,
					salary,
					IF(salary >= 500000, 'High',
						IF(salary >= 100000, 'Medium', 'Low')) AS salary_band
				FROM employee;

			-- GREATEST(): This function is used to return largest value amongst the group of expressions
				-- GREATEST(): Get the greatest value between 3, 7, and 5
				SELECT GREATEST(3, 7, 5) AS greatest_value;
                
                -- GREATEST(): Get the greatest value from `salary` and 500000 inside `employee` table
                SELECT 
					e_id,
                    name,
                    salary,
                    GREATEST(salary, 500000)
				FROM employee;
                
			-- LEAST(): This function is used to return LEAST value amongst the group of expressions
				-- LEAST(): Get the LEAST value between 3, 7, and 5
				SELECT LEAST(3, 7, 5) AS least_value;
                
                -- LEAST(): Get the LEAST value from `salary` and 500000 inside `employee` table
                SELECT 
					e_id,
                    name,
                    salary,
                    LEAST(salary, 500000)
				FROM employee;

		    -- NULLIF(): This function is used for compairing two values and when two values are equal, it returns null
			    -- NULLIF(): Avoid false matching on `salary` inside `employee` table
				SELECT 
					e_id, 
                    name,
                    salary,
					CASE 
						WHEN NULLIF(salary, 575000.50) IS NULL THEN 'Average Match'
						WHEN salary BETWEEN 100000 AND 499999 THEN 'Medium'
                        WHEN salary >= 500000 THEN 'High'
						ELSE 'Low'
					END AS salary_band
				FROM employee;
                
                -- NULLIF(): Return `Department Upgraded`, if department is `Data Science` from `employee` table, else return 'No Upgrade'. Provide an alias to it as 'department_status'
				SELECT 
					e_id, 
                    name,
                    department,
                    salary,
					IF(NULLIF(department, 'Data Science') IS NULL, 'Department Upgraded', 'No Upgrade') AS department_status
				FROM employee;
			
			-- IFNULL(): It checks if a value is NULL, and if so, replaces it with a specified fallback. Returns expr2 if expr1 is NULL, else returns expr1
				-- IFNULL(): In `accounts` table, check if `signup_date` is NULL, if so then return `null value found`, else return the signup date itself
				SELECT	
					account_id,
					full_name, 
					signup_date,
					IFNULL(signup_date, 'null value found') AS signup_date_status
				FROM accounts;
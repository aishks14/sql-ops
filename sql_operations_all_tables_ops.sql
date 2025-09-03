SHOW databases;

USE sqloperations;

SHOW tables;

SELECT * FROM accounts;

SELECT * FROM ceo;

SELECT * FROM customers;

SELECT * FROM employee;

SELECT * FROM filtered_id_customers;

SELECT * FROM logs;

SELECT * FROM org_initiatives;

SELECT * FROM org_membership;

SELECT * FROM org_project_summary; -- this is a view from `project` table

SELECT * FROM organization;

SELECT * FROM project;

SELECT * FROM users;


-- UPDATING IDs of the tables --

	-- Updating `initiative_id` from `org_initiatives` table
	UPDATE org_initiatives
		SET initiative_id = initiative_id + 300
		WHERE org_id BETWEEN 101 AND 105;
	
    -- Checking the schema/structure of the tables
	DESCRIBE org_project_summary; -- This is a view
	DESCRIBE accounts;

	-- Updating `account_id` from `accounts` table
	UPDATE accounts
		SET account_id = account_id + 400
		WHERE account_id BETWEEN 1 AND 5;

	-- At this point of time updating the `ceo` table, error would come since foreign key is added from this table into `org_membership` table
	UPDATE CEO
		SET c_id = c_id + 600
		WHERE c_id BETWEEN 1 AND 40;
	
	
	-- Checking the schema/structure of the tables
    DESCRIBE ceo;
	DESCRIBE org_membership;

	-- Drop the existing foreign key constraint in `org_membership` table
	-- For `ceo` table to get free to update the c_id.
	ALTER TABLE org_membership
	DROP FOREIGN KEY org_membership_ibfk_1;

	-- Add the foreign key again with ON UPDATE CASCADE. 
	-- This will allowto automatically update when ceo.c_id is changed (to avoid errors)
	ALTER TABLE org_membership
	ADD CONSTRAINT fk_org_membership_cid
	FOREIGN KEY (c_id)
	REFERENCES ceo(c_id)
	ON UPDATE CASCADE;

	-- Now `ceo` table can be updated without errors of foreign key constraint
	UPDATE CEO
		SET c_id = c_id + 600
		WHERE c_id BETWEEN 1 AND 40;
		
	-- Make entries in `org_membership` till 40 rows including the current ones
	-- left_on column is left blank, and membership_id is auto_increment, so it does not need to be added in the INSERT query
	INSERT INTO org_membership (c_id, org_id, role, joined_on)
	VALUES
	(605, 105, 'Associate', '2023-01-01'),
	(606, 106, 'Coordinator', '2023-01-02'),
	(607, 107, 'Analyst', '2023-01-03'),
	(608, 108, 'Consultant', '2023-01-04'),
	(609, 109, 'Executive', '2023-01-05'),
	(610, 110, 'Associate', '2023-01-06'),
	(611, 111, 'Coordinator', '2023-01-07'),
	(612, 112, 'Analyst', '2023-01-08'),
	(613, 113, 'Consultant', '2023-01-09'),
	(614, 114, 'Executive', '2023-01-10'),
	(615, 115, 'Associate', '2023-01-11'),
	(616, 116, 'Coordinator', '2023-01-12'),
	(617, 117, 'Analyst', '2023-01-13'),
	(618, 118, 'Consultant', '2023-01-14'),
	(619, 119, 'Executive', '2023-01-15'),
	(620, 120, 'Associate', '2023-01-16'),
	(621, 121, 'Coordinator', '2023-01-17'),
	(622, 122, 'Analyst', '2023-01-18'),
	(623, 123, 'Consultant', '2023-01-19'),
	(624, 124, 'Executive', '2023-01-20'),
	(625, 125, 'Associate', '2023-01-21'),
	(626, 126, 'Coordinator', '2023-01-22'),
	(627, 127, 'Analyst', '2023-01-23'),
	(628, 128, 'Consultant', '2023-01-24'),
	(629, 129, 'Executive', '2023-01-25'),
	(630, 130, 'Associate', '2023-01-26'),
	(631, 131, 'Coordinator', '2023-01-27'),
	(632, 132, 'Analyst', '2023-01-28'),
	(633, 133, 'Consultant', '2023-01-29'),
	(634, 134, 'Executive', '2023-01-30'),
	(635, 135, 'Associate', '2023-01-31'),
	(636, 136, 'Coordinator', '2023-02-01'),
	(637, 137, 'Analyst', '2023-02-02'),
	(638, 138, 'Consultant', '2023-02-03'),
	(639, 139, 'Executive', '2023-02-04'),
	(640, 140, 'Associate', '2023-02-05');

	-- Inserting values in `accounts` table
	INSERT INTO accounts (full_name, email, signup_date)
	VALUES
	('Sneha Reddy', 'sneha.reddy@example.com', '2023-07-20'),
	('Karan Malhotra', 'karan.malhotra@example.com', '2023-07-22'),
	('Divya Nair', 'divya.nair@example.com', NULL),
	('Manish Tiwari', 'manish.tiwari@example.com', '2023-07-25'),
	('Ritika Joshi', 'ritika.joshi@example.com', NULL),
	('Arjun Singh', 'arjun.singh@example.com', '2023-07-28'),
	('Megha Jain', 'megha.jain@example.com', '2023-07-30'),
	('Siddharth Rao', 'siddharth.rao@example.com', NULL),
	('Pooja Bhatia', 'pooja.bhatia@example.com', '2023-08-01'),
	('Nikhil Chauhan', 'nikhil.chauhan@example.com', '2023-08-03'),
	('Isha Agarwal', 'isha.agarwal@example.com', NULL),
	('Rajeev Menon', 'rajeev.menon@example.com', '2023-08-06'),
	('Tanya Kapoor', 'tanya.kapoor@example.com', '2023-08-08'),
	('Vivek Sinha', 'vivek.sinha@example.com', NULL),
	('Anjali Deshmukh', 'anjali.deshmukh@example.com', '2023-08-10'),
	('Rohan Gupta', 'rohan.gupta@example.com', '2023-08-12'),
	('Shruti Saxena', 'shruti.saxena@example.com', NULL),
	('Aditya Pillai', 'aditya.pillai@example.com', '2023-08-15'),
	('Bhavna Kaur', 'bhavna.kaur@example.com', '2023-08-17'),
	('Harsh Vardhan', 'harsh.vardhan@example.com', NULL),
	('Naina D''Souza', 'naina.dsouza@example.com', '2023-08-20'),
	('Yash Thakur', 'yash.thakur@example.com', '2023-08-22'),
	('Rekha Iyer', 'rekha.iyer@example.com', NULL),
	('Aakash Bansal', 'aakash.bansal@example.com', '2023-08-25'),
	('Simran Kohli', 'simran.kohli@example.com', '2023-08-27'),
	('Dhruv Patel', 'dhruv.patel@example.com', NULL),
	('Lavanya Rathi', 'lavanya.rathi@example.com', '2023-08-30'),
	('Mohit Chawla', 'mohit.chawla@example.com', '2023-09-01'),
	('Tanvi Mishra', 'tanvi.mishra@example.com', NULL),
	('Saurabh Saxena', 'saurabh.saxena@example.com', '2023-09-03'),
	('Preeti Malviya', 'preeti.malviya@example.com', '2023-09-05'),
	('Varun Khanna', 'varun.khanna@example.com', NULL),
	('Ayesha Qureshi', 'ayesha.qureshi@example.com', '2023-09-07'),
	('Rajat Bedi', 'rajat.bedi@example.com', '2023-09-09');

	-- Updating `CustomerID` in `customers` table
	UPDATE customers
		SET CustomerID = CustomerID + 700
		WHERE CustomerID BETWEEN 1 AND 100;
		
	-- Updating `log_id` in `customers` table
	UPDATE logs
		SET log_id = log_id + 1000
		WHERE log_id BETWEEN 1 AND 5;
	
    -- Checking the schema/structure of the table(s)
	DESCRIBE logs;

	-- Altering `logs` table to add a foreign key constraint on user_id from `users` table
	ALTER TABLE logs
	ADD CONSTRAINT fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

	-- Updating the proj_id in `project` table
	UPDATE project
		SET proj_id = proj_id + 800
		WHERE proj_id BETWEEN 1 AND 10;














-- CREATING DATABASE
create database sqlOperations;

-- SHOW DATABASES which are present in the system and which were created previously
SHOW DATABASES;

-- Telling DBMS to use the specific database for all queries
USE sqlOperations; 

-- Creating a table inside selected/used database
CREATE TABLE users(
	id INT	AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	gender ENUM("Male", "Female", "Other"),
	date_of_birth DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Describing the table with all its fields and their data types, to know the structure of the table
DESCRIBE users;

-- To verify and check if table was created successfully. 
-- Although at this step there won't be any data in the table and values in rows would be NULL
-- SELECT : This is an statement in SQL which is used to retrieve data from a database
SELECT * FROM users;

-- Inserting values in the table. Here fields must match with definition of the table
-- The data should be filled as per the fields added in the table at the time of its creation.
-- Otherwise it will throw error
INSERT INTO users (name, email, gender, date_of_birth) VALUES
('Aarav Singh', 'aarav.singh@example.com', 'Male', '1990-05-21'),
('Isha Kapoor', 'isha.kapoor@example.com', 'Female', '1988-12-03'),
('Rohan Mehta', 'rohan.mehta@example.com', 'Male', '1992-07-18'),
('Priya Sharma', 'priya.sharma@example.com', 'Female', '1995-03-22'),
('Karan Patel', 'karan.patel@example.com', 'Male', '1993-11-30'),
('Sneha Reddy', 'sneha.reddy@example.com', 'Female', '1989-08-09'),
('Ananya Joshi', 'ananya.joshi@example.com', 'Female', '1994-06-01'),
('Vikram Das', 'vikram.das@example.com', 'Male', '1987-10-16'),
('Tanya Verma', 'tanya.verma@example.com', 'Female', '1991-01-11'),
('Nikhil Jain', 'nikhil.jain@example.com', 'Male', '1990-02-28'),
('Riya Nair', 'riya.nair@example.com', 'Female', '1996-09-14'),
('Amit Khanna', 'amit.khanna@example.com', 'Male', '1985-04-25'),
('Meera Bhat', 'meera.bhat@example.com', 'Female', '1993-12-19'),
('Aditya Rao', 'aditya.rao@example.com', 'Male', '1988-06-30'),
('Simran Kaur', 'simran.kaur@example.com', 'Female', '1992-03-07'),
('Zoya Hussain', 'zoya.hussain@example.com', 'Female', '1995-05-04'),
('Rahul Sinha', 'rahul.sinha@example.com', 'Male', '1986-07-13'),
('Neha Thakur', 'neha.thakur@example.com', 'Female', '1994-11-02'),
('Arjun Malhotra', 'arjun.malhotra@example.com', 'Male', '1991-08-17'),
('Devika Iyer', 'devika.iyer@example.com', 'Female', '1990-10-05'),
('Kabir Anand', 'kabir.anand@example.com', 'Male', '1989-02-12'),
('Sara Williams', 'sara.williams@example.com', 'Female', '1992-01-29'),
('Manav Deshmukh', 'manav.deshmukh@example.com', 'Male', '1987-09-23'),
('Rekha Pillai', 'rekha.pillai@example.com', 'Female', '1993-06-12'),
('Yash Oberoi', 'yash.oberoi@example.com', 'Male', '1985-08-01'),
('Lavanya Gupta', 'lavanya.gupta@example.com', 'Female', '1996-04-18'),
('Ayesha Mirza', 'ayesha.mirza@example.com', 'Female', '1990-12-07'),
('Harsh Vardhan', 'harsh.vardhan@example.com', 'Male', '1994-05-10'),
('Alok Ranjan', 'alok.ranjan@example.com', 'Male', '1991-07-27'),
('Tanvi Ghosh', 'tanvi.ghosh@example.com', 'Female', '1988-03-19'),
('Kajal Singh', "kajal.singh1699@gmail.com", "Female", "1996-12-16"),
("Megha Singh", "megha.singh123@gmail.com", "Female", "1996-04-01"),
("Prashant Singh", "prashant.singh92@gmail.com", "Male", "1992-10-22"),
("Aishwarya Kumar Singh", "aishsingh702@gmail.com", "Male", "1992-09-14"),
("Neeraj P", "neeraj.p@gmail.com", "Male", "1996-01-26");

-- Again fetching the table with all its values. This time it will show data inside rows.
SELECT * FROM users;

-- Renaming a table(if needed)
RENAME TABLE users to appUsers;

-- Getting entire table data fron newly renamed table
SELECT * FROM appUsers;

-- Again renaming the table back to its original name
RENAME TABLE appUsers to users;

-- commented command here which will not be executed 
-- SELECT name, date_of_birth FROM users; 

-- ALTER is used to modify the existing table
-- Altering table users to add is_active column in the table
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT true;

-- Check the structure of the users table now using DESCRIBE command
DESCRIBE users;

-- Check the data inside users table after altering it
SELECT * FROM users;

-- Dropping the is_active column using ALTER command
ALTER TABLE users DROP COLUMN is_active;

-- Again check the structure of the table using DESCRIBE command
DESCRIBE users;

-- ALTER table users to change the limit of the characters in the column name
ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

-- ALTER table to change the position of the email column just after the id column using `AFTER`
ALTER TABLE users MODIFY COLUMN email VARCHAR(100) AFTER id;

-- ALTER table users to get the date_of_birth column as the first column using `FIRST`+
ALTER TABLE users MODIFY COLUMN date_of_birth DATETIME FIRST;

-- ALTER table users to get the date_of_birth column after name column
ALTER TABLE users MODIFY COLUMN date_of_birth DATETIME AFTER name;

-- ALTER table users to get the date_of_birth column after gender column
ALTER TABLE users MODIFY COLUMN date_of_birth DATETIME AFTER gender;

-- ALTER table users to get the salary column added in the table
ALTER TABLE users ADD COLUMN salary DECIMAL(10,2);

-- ALTER table users to get the salary column after date_of_birth column
ALTER TABLE users MODIFY COLUMN salary DECIMAL(10, 2) AFTER date_of_birth;

SELECT * FROM users;
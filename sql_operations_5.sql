-- UNIQUE Constraint: This makes sure that all the values present in a column are all different from each other. 
CREATE TABLE organization(
    id INT AUTO_INCREMENT PRIMARY KEY,
    org_name VARCHAR(100) NOT NULL,
    org_email VARCHAR(100) UNIQUE NOT NULL,
    industry VARCHAR(100) NOT NULL,
    headquarter_at VARCHAR(150) NOT NULL,
    est_date DATE,
    total_emp INT NOT NULL,
    is_certified BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Below commands are for information purpose only since the unique column is already identified in the organization tabble while it was created
	-- 	UNIQUE with ALTER: There is a way to add UNIQUE constraint in a table column if originally it was not added while creation of the table. ALTER query help in achieving this:
	-- Syntax 1: ALTER query to add a constraint over a column without any specific name given to the constraint. SQL engine automatically provides a name to it
	ALTER TABLE organization ADD UNIQUE (org_email);

	-- Syntax 2: ALTER query to add a constraint over a column with a name given to it exclusively
	ALTER TABLE organization ADD CONSTRAINT org_email_unique UNIQUE (org_email);

-- INSERT: Insert records in the organization table. Insert at least 40 records
INSERT INTO organization (org_name, org_email, industry, headquarter_at, est_date, total_emp)
VALUES
('Infosys', 'contact@infosys.com', 'IT Services', 'Bangalore, India', '1981-07-02', 336000),
('Tata Consultancy Services', 'info@tcs.com', 'IT Services', 'Mumbai, India', '1968-04-01', 614000),
('Reliance Industries', 'corp@ril.com', 'Conglomerate', 'Mumbai, India', '1966-05-08', 347000),
('State Bank of India', 'support@sbi.co.in', 'Banking', 'Mumbai, India', '1955-07-01', 232000),
('Indian Oil Corporation', 'info@iocl.com', 'Oil & Gas', 'New Delhi, India', '1959-06-30', 31900),
('Wipro', 'hello@wipro.com', 'IT Services', 'Bangalore, India', '1945-12-29', 240000),
('HDFC Bank', 'care@hdfcbank.com', 'Banking', 'Mumbai, India', '1994-08-25', 150000),
('Bharti Airtel', 'connect@airtel.com', 'Telecom', 'New Delhi, India', '1995-07-07', 18000),
('Adani Group', 'info@adani.com', 'Conglomerate', 'Ahmedabad, India', '1988-01-01', 23000),
('Mahindra & Mahindra', 'contact@mahindra.com', 'Automobile', 'Mumbai, India', '1945-10-02', 256000),
('Larsen & Toubro', 'info@larsentoubro.com', 'Engineering', 'Mumbai, India', '1938-01-01', 45000),
('Bharat Petroleum', 'support@bharatpetroleum.in', 'Oil & Gas', 'Mumbai, India', '1952-07-05', 12000),
('ISRO', 'admin@isro.gov.in', 'Space Research', 'Bangalore, India', '1969-08-15', 17000),
('DRDO', 'info@drdo.gov.in', 'Defense Research', 'New Delhi, India', '1958-01-01', 30000),
('NASSCOM', 'contact@nasscom.in', 'IT Association', 'Noida, India', '1988-03-01', 500),
('Amul', 'support@amul.coop', 'Dairy', 'Anand, India', '1946-12-14', 10000),
('BCCI', 'admin@bcci.tv', 'Sports', 'Mumbai, India', '1928-12-01', 200),
('FSSAI', 'contact@fssai.gov.in', 'Food Safety', 'New Delhi, India', '2011-08-05', 1000),
('SEBI', 'info@sebi.gov.in', 'Finance Regulation', 'Mumbai, India', '1992-04-12', 800),
('NITI Aayog', 'policy@niti.gov.in', 'Policy Think Tank', 'New Delhi, India', '2015-01-01', 500),
('United Nations', 'info@un.org', 'International Affairs', 'New York, USA', '1945-10-24', 44000),
('World Bank', 'contact@worldbank.org', 'Finance', 'Washington DC, USA', '1944-07-01', 10000),
('IMF', 'support@imf.org', 'Finance', 'Washington DC, USA', '1944-12-27', 2700),
('WHO', 'info@who.int', 'Healthcare', 'Geneva, Switzerland', '1948-04-07', 7000),
('UNESCO', 'contact@unesco.org', 'Education & Culture', 'Paris, France', '1945-11-16', 2000),
('WTO', 'info@wto.org', 'Trade', 'Geneva, Switzerland', '1995-01-01', 600),
('UNICEF', 'support@unicef.org', 'Child Welfare', 'New York, USA', '1946-12-11', 13000),
('OECD', 'info@oecd.org', 'Economic Development', 'Paris, France', '1961-09-30', 3500),
('IAEA', 'contact@iaea.org', 'Atomic Energy', 'Vienna, Austria', '1957-07-29', 2500),
('Interpol', 'admin@interpol.int', 'International Policing', 'Lyon, France', '1923-09-07', 1000),
('UNIDO', 'info@unido.org', 'Industrial Development', 'Vienna, Austria', '1966-11-17', 1700),
('ILO', 'support@ilo.org', 'Labor Rights', 'Geneva, Switzerland', '1919-10-01', 3000),
('ITU', 'contact@itu.int', 'Telecommunication', 'Geneva, Switzerland', '1865-05-17', 800),
('FAO', 'info@fao.org', 'Food & Agriculture', 'Rome, Italy', '1945-10-16', 11000),
('UNDP', 'support@undp.org', 'Development', 'New York, USA', '1965-01-01', 17000),
('UNHCR', 'info@unhcr.org', 'Refugee Support', 'Geneva, Switzerland', '1950-12-14', 18000),
('ADB', 'contact@adb.org', 'Development Bank', 'Manila, Philippines', '1966-12-19', 3000),
('OPEC', 'info@opec.org', 'Oil Policy', 'Vienna, Austria', '1960-09-14', 500),
('ASEAN', 'admin@asean.org', 'Regional Cooperation', 'Jakarta, Indonesia', '1967-08-08', 1000),
('UNEP', 'contact@unep.org', 'Environment', 'Nairobi, Kenya', '1972-06-05', 1200);

-- CREATE: Create table CEO that holds the information of the CEOs of the organizations
CREATE TABLE CEO (
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    appointed_on DATE NOT NULL,
    org_id INT NOT NULL,
    org_name VARCHAR(100) NOT NULL,
    base_location VARCHAR(100),
    CONSTRAINT chk_dob CHECK (dob > '1950-12-31'),
    CONSTRAINT chk_appointed_on CHECK (appointed_on > dob)
);

-- INSERT passing the CHECK CONSTRAINT: Insert into table CEO with passing the CHECK constraint
INSERT INTO CEO (name, email, dob, appointed_on, org_id, org_name, base_location)
VALUES
('Salil Parekh', 'salil@infosys.com', '1964-05-01', '2018-01-02', 1, 'Infosys', 'Bangalore, India'),
('Natarajan Chandrasekaran', 'chandra@tcs.com', '1963-06-02', '2017-02-21', 2, 'Tata Consultancy Services', 'Mumbai, India'),
('Mukesh Ambani', 'mukesh@ril.com', '1957-04-19', '2002-07-31', 3, 'Reliance Industries', 'Mumbai, India'),
('Dinesh Khara', 'dinesh@sbi.co.in', '1961-08-28', '2020-10-07', 4, 'State Bank of India', 'Mumbai, India'),
('Shrikant Vaidya', 'vaidya@iocl.com', '1962-03-15', '2020-07-01', 5, 'Indian Oil Corporation', 'New Delhi, India'),
('Thierry Delaporte', 'thierry@wipro.com', '1967-11-12', '2020-07-06', 6, 'Wipro', 'Bangalore, India'),
('Sashidhar Jagdishan', 'sashi@hdfcbank.com', '1965-11-05', '2020-10-27', 7, 'HDFC Bank', 'Mumbai, India'),
('Gopal Vittal', 'gopal@airtel.com', '1967-02-09', '2013-03-01', 8, 'Bharti Airtel', 'New Delhi, India'),
('Sudipta Bhattacharya', 'sudipta@adani.com', '1966-09-15', '2016-01-01', 9, 'Adani Group', 'Ahmedabad, India'),
('Anish Shah', 'anish@mahindra.com', '1969-04-12', '2021-04-02', 10, 'Mahindra & Mahindra', 'Mumbai, India'),
('S. N. Subrahmanyan', 'sns@larsentoubro.com', '1960-03-16', '2017-07-01', 11, 'Larsen & Toubro', 'Mumbai, India'),
('G. Krishnakumar', 'krishna@bharatpetroleum.in', '1962-06-20', '2023-03-01', 12, 'Bharat Petroleum', 'Mumbai, India'),
('S. Somanath', 'somanath@isro.gov.in', '1963-05-15', '2022-01-12', 13, 'ISRO', 'Bangalore, India'),
('Dr. Samir V. Kamat', 'samir@drdo.gov.in', '1965-09-10', '2022-08-01', 14, 'DRDO', 'New Delhi, India'),
('Debjani Ghosh', 'debjani@nasscom.in', '1970-02-25', '2018-04-01', 15, 'NASSCOM', 'Noida, India'),
('R. S. Sodhi', 'sodhi@amul.coop', '1961-06-01', '2010-01-01', 16, 'Amul', 'Anand, India'),
('Roger Binny', 'roger@bcci.tv', '1955-07-19', '2022-10-18', 17, 'BCCI', 'Mumbai, India'),
('Shobhit Jain', 'shobhit@fssai.gov.in', '1968-03-22', '2023-01-01', 18, 'FSSAI', 'New Delhi, India'),
('Madhabi Puri Buch', 'madhabi@sebi.gov.in', '1966-01-15', '2022-03-01', 19, 'SEBI', 'Mumbai, India'),
('B. V. R. Subrahmanyam', 'bvr@niti.gov.in', '1960-06-28', '2023-02-20', 20, 'NITI Aayog', 'New Delhi, India'),
('Antonio Guterres', 'antonio@un.org', '1951-04-30', '2017-01-01', 21, 'United Nations', 'New York, USA'),
('Ajay Banga', 'ajay@worldbank.org', '1959-11-10', '2023-06-02', 22, 'World Bank', 'Washington DC, USA'),
('Kristalina Georgieva', 'kristalina@imf.org', '1953-08-13', '2019-10-01', 23, 'IMF', 'Washington DC, USA'),
('Tedros Ghebreyesus', 'tedros@who.int', '1965-03-03', '2017-07-01', 24, 'WHO', 'Geneva, Switzerland'),
('Audrey Azoulay', 'audrey@unesco.org', '1972-08-04', '2017-11-15', 25, 'UNESCO', 'Paris, France'),
('Ngozi Okonjo-Iweala', 'ngozi@wto.org', '1954-06-13', '2021-03-01', 26, 'WTO', 'Geneva, Switzerland'),
('Catherine Russell', 'catherine@unicef.org', '1961-03-04', '2022-02-01', 27, 'UNICEF', 'New York, USA'),
('Mathias Cormann', 'mathias@oecd.org', '1970-09-20', '2021-06-01', 28, 'OECD', 'Paris, France'),
('Rafael Grossi', 'rafael@iaea.org', '1961-01-29', '2019-12-02', 29, 'IAEA', 'Vienna, Austria'),
('Jürgen Stock', 'jurgen@interpol.int', '1959-10-04', '2014-11-07', 30, 'Interpol', 'Lyon, France'),
('Gerd Müller', 'gerd@unido.org', '1955-08-25', '2021-12-10', 31, 'UNIDO', 'Vienna, Austria'),
('Gilbert Houngbo', 'gilbert@ilo.org', '1961-02-04', '2022-10-01', 32, 'ILO', 'Geneva, Switzerland'),
('Doreen Bogdan-Martin', 'doreen@itu.int', '1966-06-15', '2023-01-01', 33, 'ITU', 'Geneva, Switzerland'),
('Qu Dongyu', 'qu@fao.org', '1963-10-19', '2019-08-01', 34, 'FAO', 'Rome, Italy'),
('Achim Steiner', 'achim@undp.org', '1961-05-17', '2017-06-19', 35, 'UNDP', 'New York, USA'),
('Filippo Grandi', 'filippo@unhcr.org', '1957-05-30', '2016-01-01', 36, 'UNHCR', 'Geneva, Switzerland'),
('Masatsugu Asakawa', 'masatsugu@adb.org', '1958-01-17', '2020-01-17', 37, 'ADB', 'Manila, Philippines'),
('Haitham Al Ghais', 'haitham@opec.org', '1970-10-01', '2022-08-01', 38, 'OPEC', 'Vienna, Austria'),
('Kao Kim Hourn', 'kao@asean.org', '1966-10-01', '2023-01-01', 39, 'ASEAN', 'Jakarta, Indonesia'),
('Inger Andersen', 'inger@unep.org', '1958-10-01', '2019-06-15', 40, 'UNEP', 'Nairobi, Kenya');

-- DEFAULT constraint: The DEFAULT constraint is used to set a default value for a column. This is used to add a default value to all the records if there is no other value specified.
	-- DEFAULT: Create a table org_membership in which give some DEFAULT constraint(s)
	CREATE TABLE org_membership (
		membership_id INT PRIMARY KEY AUTO_INCREMENT,
		c_id INT NOT NULL,
		org_id INT NOT NULL,
		role VARCHAR(100),
		joined_on DATE,
		left_on DATE DEFAULT NULL,
		FOREIGN KEY (c_id) REFERENCES CEO(c_id),
		FOREIGN KEY (org_id) REFERENCES organization(id)
	);

-- UPDATE: Updating the organization table for unique IDs to connect it in org_membership table
UPDATE organization
	SET id = id + 100
	WHERE id BETWEEN 1 AND 40;

-- INSERT: Adding records in org_membership table now with all DEFAULT values in `left_on` column
INSERT INTO org_membership (c_id, org_id, role, joined_on)
VALUES 
(1, 101, 'Executive Director', '2023-02-14'),
(2, 102, 'Data Analyst', '2022-08-01'),
(3, 103, 'Operations Head', '2023-06-30'),
(4, 104, 'Consultant', '2024-01-01');

-- PRIMARY KEY Constraint: This uniquely identifies a row. IT must not be NULL and it should always be unique
	-- PRIMARY KEY: Create a table to add PRIMARY KEY constraint in its schema
	CREATE TABLE org_initiatives (
		initiative_id INT PRIMARY KEY AUTO_INCREMENT,
		org_id INT NOT NULL,
		initiative_name VARCHAR(150) NOT NULL,
		launch_date DATE DEFAULT NULL,
		status VARCHAR(50) DEFAULT 'Active',
		budget_million DECIMAL(10,2),
		FOREIGN KEY (org_id) REFERENCES organization(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
		CHECK (status IN ('Active', 'Completed', 'On Hold'))
	);

-- INSERT in org_initiatives: 
INSERT INTO org_initiatives (org_id, initiative_name, launch_date, status, budget_million)
VALUES
(101, 'Green Tech R&D', '2023-03-15', 'Active', 25.5),
(102, 'Digital Empowerment Program', NULL, 'Active', 10.0),
(103, 'Global Sustainability Summit', '2022-11-01', 'Completed', 40.0),
(104, 'Rural Banking Expansion', NULL, 'On Hold', 5.75),
(105, 'Hydrogen Fuel Pilot', '2024-01-20', 'Active', 60.0);

-- FOREIGN KEY Constraint: A FOREIGN KEY Constraint is a field or a collection of fields that can be used to refer another table using that table’s PRIMARY KEY. 
	-- This constraint is used to prevent the actions that can destroy links between the tables.
	-- CREATE: Create a table `project` to display the FOREIGN KEY constraint
		CREATE TABLE project (
			proj_id INT PRIMARY KEY AUTO_INCREMENT,
			proj_name VARCHAR(100) NOT NULL,
			org_id INT NOT NULL,
			start_date DATE,
			budget_million DECIMAL(10,2),
			FOREIGN KEY (org_id) REFERENCES organization(id)
		);

	-- INSERT: Insert into table `project`
    INSERT INTO project (proj_name, org_id, start_date, budget_million)
	VALUES 
	('Smart Village Initiative', 101, '2022-06-15', 12.75),
	('AI Healthcare Pilot', 102, NULL, 25.00),
	('Water Reuse Systems', 103, '2021-09-01', 9.50),
	('Digital Literacy Mission', 104, NULL, 5.00),
	('Solar Grid Expansion', 105, '2023-03-30', 18.20),
	('Renewable Energy Fellowship', 106, '2024-01-10', 7.75),
	('Women Entrepreneurship Hub', 107, NULL, 6.40);

-- AUTO_INCREMENT Constraint: This is used with PRIMARY KEY to automatically assign the next number
	-- CREATE: Create a table `accounts` to add AUTO_INCREMENT constraint in it
	CREATE TABLE accounts (
		account_id INT AUTO_INCREMENT PRIMARY KEY,
		full_name VARCHAR(100) NOT NULL,
		email VARCHAR(100) UNIQUE NOT NULL,
		signup_date DATE DEFAULT NULL
	);
	
    -- INSERT: Insert records in the `accounts` table
    INSERT INTO accounts (full_name, email, signup_date)
	VALUES
	('Amit Verma', 'amit.verma@example.com', '2023-05-21'),
	('Priya Sharma', 'priya.sharma@example.com', '2023-06-10'),
	('Ravi Desai', 'ravi.desai@example.com', NULL),
	('Neha Kapoor', 'neha.kapoor@example.com', '2023-07-15'),
	('Ankit Mehta', 'ankit.mehta@example.com', NULL);
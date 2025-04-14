DBMS (Database Management System)

• Software for storing, retrieving, managing, and manipulating data.

• Examples: MySQL, Oracle, SQL Server, PostgreSQL, MongoDB.

Data vs Information

• Data: Raw facts (e.g., numbers, names).

• Information: Processed data with meaning (e.g., sales reports).

DBMS Models

1. Relational Model: Data in tables (SQL-based). (e.g., MySQL, PostgreSQL)

2. Network Model: Data as nodes & connections. (e.g., IDS)

3. Hierarchical Model: Data in tree structure. (e.g., IMS)

4. Object-Oriented Model: Data as objects. (e.g., ObjectStore)

5. Document-Oriented Model: Data in documents (JSON/XML). (e.g., MongoDB)

RDBMS (Relational Database Management System)

• Based on the relational model, uses SQL.

• Examples:

o Oracle (Enterprise-level)

o SQL Server (Microsoft's database)

o MySQL (Open-source, web apps)

o PostgreSQL (Advanced open-source)

o MariaDB (Fork of MySQL)

SQL (Structured Query Language)

• Used to interact with relational databases.

• Operations:

o Create → INSERT (Add data)

o Read → SELECT (Retrieve data)

o Update → UPDATE (Modify data)

o Delete → DELETE (Remove data)

• Also manages tables, views, indexes, and security.

• Used in e-commerce, banking, social media, etc.

system cls; → 
system cls; → 

 

📘 MySQL Notes for VS Code (CMD-Friendly)

 

✅ 1. How to Run a .sql File from CMD (Inside VS Code Terminal)

mysql -u root -p testdb < filename.sql

•	-u root → MySQL username

•	-p → Prompts for password

•	testdb → Your database name

•	< filename.sql → Runs the SQL file

•	✅ This command only works in CMD, not PowerShell

 

❌ PowerShell Issue (Why < Doesn’t Work)

If you try this in PowerShell:

mysql -u root -p testdb < query.sql

You’ll get an error:

The '<' operator is reserved for future use.

✅ Solution: Use CMD instead of PowerShell

Or in PowerShell: 

Get-Content .\query.sql | mysql -u root -p testdb 		(in PowerShell)

 

✅ 2. Set CMD as Default Terminal in VS Code

1.	Press Ctrl + Shift + P (or click on the top menu, click: View → Command Palette...

2.	Type: Terminal: Select Default Profile

3.	Select: Command Prompt

4.	Open terminal again → it will now use CMD

 

✅ 3. Clear CMD Terminal Screen

In CMD: Cls

In PowerShell:	Clear-Host or cls

 

✅ 4. Avoid “Database Already Exists” Error

Use this in your .sql file:

CREATE DATABASE IF NOT EXISTS testdb;

 

✅ 5. Avoid “Table Already Exists” Error

Use this:

CREATE TABLE IF NOT EXISTS users (...);

 

✅ 6. Separate Files for Better Workflow

•	all_queries.sql → Save your full database and table setup (used for future)

•	current.sql → Write and run only new/test queries

Run only the needed file like:

mysql -u root -p testdb < current.sql		(in CMD)

 

📌 MySQL Quick Revision Notes

💻 Checking MySQL Version & Login (In Command Prompt)

Check installed MySQL version:

mysql --version

Login to MySQL:

mysql -u root -p --(Enter password when prompted)

📂 Database Management

Show all databases:

SHOW DATABASES;

Create a new database:

CREATE DATABASE student;

Select (use) a database:

USE student;

📑 Table Management

Create a table inside the selected database:

CREATE TABLE student (roll_no INT(5), name VARCHAR(10), city VARCHAR(10), fees INT(10));

View table structure:

DESC student;

Delete a table:

DROP TABLE student;

📌 Inserting Data into Table

Insert a single record:

INSERT INTO student (roll_no, name, city, fees) VALUES (111, 'Him', 'Bhopal', 34500);

Insert multiple records:

INSERT INTO student (roll_no, name, city, fees) VALUES 

(101, 'Jatin', 'Sehore', 33000), (102, 'Vijay', 'Indore', 39000), (103, 'Rohit', 'Rewa', 40000), (104, 'Neetu', 'Satna', 30000);

📋 Retrieving Data

Fetch all records:

SELECT * FROM student;

Fetch records with a condition:

SELECT * FROM student WHERE roll_no = 101;

Fetch specific columns:

SELECT name, fees FROM student;

Fetch details of a specific roll number:

SELECT * FROM student WHERE roll_no=103;

Fetch only the name of a specific roll number:

SELECT name FROM student WHERE roll_no='101';

Fetch name and fees of students from 'Bhopal':

SELECT name, fees FROM student WHERE city='bhopal';

 

-- Create the product table

CREATE TABLE product (

    pname VARCHAR(50),

    qty INT,

    rate INT,

    total INT

);

-- Insert data into the product table (not inserting total directly)

INSERT INTO product (pname, qty, rate) VALUES

('mouse', 4, 250),

('printer', 2, 3250),

('keyboard', 3, 1200),

('cable', 5, 600),

('hdd', 3, 5400);



UPDATE Statement 

Used to modify existing records in a table.

(in Command Prompt Because SET is not directly work in SQL WorkBench)

Syntax:

UPDATE table_name 

SET column1 = value1, column2 = value2 

WHERE condition;

•	If WHERE is not used, all rows will be updated.

Examples:

UPDATE product SET total = qty * rate;

UPDATE product SET total = total + (rate * 20) / 100; (Que. Like 20% GST on rate)

UPDATE product SET total = total - (total * 15) / 100; (Que. Like 15% Discount on rate) This reduces total by 15%.
Why SET Does Not Work in MySQL Workbench?

🔹 1. Temporarily Disable Safe Update Mode

Check if Safe Updates mode is enabled

SHOW VARIABLES LIKE 'sql_safe_updates';

If the result is ON, then that’s why your query is not working.

Run this before executing your query:

SET SQL_SAFE_UPDATES = 0;

Then, execute your update:

UPDATE product 

SET total = total - (total * 15) / 100;

After the update, turn Safe Update Mode back on:

SET SQL_SAFE_UPDATES = 1;

 

🔹 2. Use a Primary Key in the WHERE Clause

If product_id (or another primary key) exists, use:

UPDATE product 

SET total = total - (total * 15) / 100

WHERE product_id > 0; or WHERE student_id IS NOT NULL; -- Ensure it includes a key column

This satisfies MySQL's safe update requirements.

 

🔹 3. Disable Safe Mode in MySQL Workbench Permanently

If you are using MySQL Workbench:

1.	Go to Edit → Preferences.

2.	Navigate to SQL Editor.

3.	Uncheck Safe Updates.

4.	Click Apply and OK.

5.	Restart MySQL Workbench.

6.	Run your update query.

 

SQL DELETE Statement:

•	DELETE FROM product WHERE pname = 'hdd'; → Deletes records where pname is 'hdd'.

•	DELETE FROM product; → Deletes all records from the product table.

AND & OR Operators:

•	AND → Both conditions must be TRUE.

•	OR → At least one condition must be TRUE.

Examples:

SELECT * FROM student WHERE city='indore' AND name='pankaj';

SELECT * FROM student WHERE city='indore' OR name='himanshu';

ALTER TABLE Statement:

The ALTER statement is used to modify an existing database table by adding, deleting, or modifying columns.

ALTER TABLE student ADD COLUMN class VARCHAR(10); -- Adds a 'class' column.

INSERT Statement: (We can directly pass values without table heading)

INSERT INTO student VALUES (111, 'adi', 'satna', 20000), (112, 'punit', 'ujjaiin', 70000);

Comparison Operators:

> → Greater than, < → Less than, >= → Greater than or equal to, <= → Less than or equal to, = → Equal to

Examples:

SELECT * FROM student WHERE fees > 40000;

SELECT * FROM student WHERE fees <= 15000;

SELECT * FROM student WHERE fees > 14000 AND city = 'indore';

IN & NOT IN Operator:

•	IN → Checks if a value is present in a list.

•	NOT IN → Excludes values from a list.

Examples:

SELECT * FROM student WHERE city IN ('indore', 'rewa');

SELECT * FROM student WHERE city NOT IN ('indore', 'rewa');

BETWEEN Operator:

The BETWEEN operator works with numeric or date values to find records within a specified range (both values included).

Example:

SELECT * FROM student WHERE fees BETWEEN 20000 AND 70000;

LIKE Operator (Pattern Matching):

•	% → Matches multiple characters.

•	_ → Matches a single character.

Example:

SELECT * FROM student WHERE name LIKE 'h%'; -- Names starting with 'h'





🔍 LIKE Operator Examples (Pattern Matching)

Query	Meaning

SELECT * FROM student WHERE name LIKE '_a%';	2nd character is 'a'

SELECT * FROM student WHERE name LIKE '%n__';	'n' is 3rd from last

SELECT * FROM student WHERE name LIKE '%an%';	Name contains "an"

SELECT * FROM student WHERE name LIKE '_i_a%';	2nd letter is 'i', 4th is 'a'

SELECT * FROM student WHERE name LIKE '_i%s__';	2nd letter 'i' and 3rd last is 's'

SELECT * FROM student WHERE name LIKE '%a%n%';	names where 'a' comes before 'n' (with any characters between).

 

🗂️ ORDER BY Clause

•	Used to sort records (ascending by default). ASC for ascending DESC for descending.

SELECT * FROM student ORDER BY city;

SELECT * FROM student ORDER BY city, fees;       -- If same city, sort by fees

SELECT * FROM student ORDER BY city, fees DESC;  -- Fees in descending order

 

🆔 DISTINCT Keyword

•	Used to get unique values from a column or combination.

SELECT DISTINCT city FROM student;

SELECT DISTINCT city, name FROM student ORDER BY name;

 

🔢 LIMIT Clause (MySQL Syntax)

•	Restricts number of records returned.

SELECT * FROM student LIMIT 3;       -- First 3 records

SELECT * FROM student LIMIT 3, 2;    -- Skip 3, then show 2 records

 






 


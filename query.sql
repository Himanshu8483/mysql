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

 


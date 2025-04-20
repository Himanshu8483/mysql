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

 Notes on Different Servers:

🔹 1. SQL Server

Method	Syntax Example

TOP	SELECT TOP 5 * FROM Employees;

FETCH FIRST (2012+)	SELECT * FROM Employees ORDER BY ID OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

LIMIT	❌ Not supported

ROWNUM	❌ Not supported

 

🔹 2. MySQL

Method	Syntax Example

LIMIT	SELECT * FROM Employees LIMIT 5;

TOP	❌ Not supported

FETCH	❌ Not supported

ROWNUM	❌ Not supported

 

🔹 3. Oracle

Method	Syntax Example

ROWNUM	SELECT * FROM Employees WHERE ROWNUM <= 5;

FETCH FIRST	Oracle 12c+: SELECT * FROM Employees FETCH FIRST 5 ROWS ONLY;

LIMIT	❌ Not supported

TOP	❌ Not supported



 

🔢 Aggregate Functions (Numerical Values):

It is a function that performs a calculation on a set of values, and returns a single value.

GROUP BY is used to group rows that have the same value in one or more columns.

Aggregate functions like SUM(), AVG(), COUNT(), etc., are then applied to each group separately.

Function	Description	Example

MAX()	Returns the highest value	SELECT MAX(fees) FROM student;

MIN()	Returns the lowest value	SELECT MIN(fees) FROM student;

COUNT(*)	Counts all rows (including NULLs)	SELECT COUNT(*) FROM student;

COUNT(column)	Counts non-null values in a column	SELECT COUNT(name) FROM student;

AVG()	Returns average value	SELECT AVG(fees) AS avg_fees FROM student;

SUM()	Returns total sum	SELECT SUM(fees) FROM student;

Aggregate functions skip NULLs automatically (except COUNT(*)).

📝 With heading / alias:

SELECT MAX(fees) AS "high amount" FROM student;

SELECT MAX(fees) higher FROM student;-- It work without Space and Quotes(“”).

SELECT MAX(fees) "high amount" FROM student;		-- without AS

🔍 COUNT with conditions:

SELECT COUNT(name) FROM student WHERE city = "bhopal";

SELECT COUNT(name) FROM student WHERE fees >= 20000;

SELECT COUNT(name) FROM student WHERE city = "rewa" AND fees >= 2000;

 

❓ NULL in SQL

•	It’s not zero, not empty string (""), and not zero-length.

•	It simply means “nothing is stored” in that field.

•	INSERT INTO student VALUES(NULL, 'Neet', 'satna', 2000);

Check for NULL:

SELECT * FROM student WHERE roll_no IS NULL;

SELECT * FROM student WHERE roll_no IS NOT NULL;

Note:

•	NULL ≠ "" (blank).

•	COUNT(roll_no) does not include NULLs.

 

🔤 String Functions

Function	Description	Example

CHAR()	Returns character for ASCII code	SELECT CHAR(67, 78, 34);

CONCAT(str1, str2)	Joins strings	SELECT CONCAT(name, "-", city) FROM student;

LOWER() or LCASE()	Converts to lowercase	SELECT LOWER(name) FROM student;

UPPER() or UCASE()	Converts to uppercase	SELECT UPPER(name) FROM student;

LENGTH()	Returns string length	SELECT LENGTH(name) FROM student;

 

🔢 Math Functions

Function	Description	Example

POWER(x, y)	x raised to the power y	SELECT POWER(3, 3);

ROUND(number)	Rounds a number to nearest integer	SELECT ROUND(56.99);

 

✅ Tips

•	Use aliases with AS or without quotes for custom column names.

•	Double quotes are needed when alias names contain spaces.

•	Always use WHERE clause carefully to filter data.


📘 MySQL Notes: Hexadecimal, CHAR() & Conversion( By Google)

 

🔹 1. Hexadecimal to Character (CMD / MySQL)

✅ Example:

SELECT CAST(0x41 AS CHAR);   -- ✅ Output: A

ℹ️ Why?

•	0x41 is a hex literal.

•	0x41 (hex) = 65 (decimal) = 'A' (ASCII character)

•	Use CAST() to convert hex to character.

🔹 Hex from a character:

SELECT HEX('A');      -- ✅ Output: 41

 

🔹 2. Convert Hex to Decimal

SELECT CONV('41', 16, 10) AS decimal_value;

➡️ Output: 65

 

🔹 3. Convert Decimal/ASCII to Character

SELECT CHAR(65);      -- Output: 'A'

SELECT CHAR(67,78,88); -- Output: 'CNX'

📝 If it shows BLOB(in workbench) or HEXA value(in CMD), use:

SELECT CAST(CHAR(67,78,34) AS CHAR) AS output;



Note: CHAR(67, 78, 88)	This creates a string: "CNX"

CAST(... AS CHAR)	This converts the result to a string (CHAR), forcing MySQL to show it as text.

 

🔹 4. See Character as Hex

SELECT HEX('A');           -- Output: 41

SELECT HEX(CHAR(67,78));   -- Output: 434E

 



Mysql Functions Table: (Homework)

✅ Core MySQL String Functions

Function	Description	Example

CONCAT()	Joins two or more strings	SELECT CONCAT('web', 'dev');

LOWER(), LCASE()	Converts string to lowercase	SELECT LOWER('HELLO');

UPPER(), UCASE()	Converts string to uppercase	SELECT UPPER('hello');

TRIM()	Removes spaces from both ends of string	SELECT TRIM(' hello ');

REPLACE()	Replaces substring with another	SELECT REPLACE('web dev', 'dev', 'design');

SUBSTRING()	Extracts part of a string	SELECT SUBSTRING('developer', 1, 4);

LENGTH()	Returns number of bytes in a string	SELECT LENGTH('Hello');

CHAR_LENGTH()	Returns number of characters	SELECT CHAR_LENGTH('Hello');

INSTR()	Position of substring in string	SELECT INSTR('backend', 'end');

LOCATE()	Position of substring (like INSTR)	SELECT LOCATE('end', 'backend');

REVERSE()	Reverses a string	SELECT REVERSE('hello');

🕒 Core MySQL Date & Time Functions

Function	Description	Example

NOW()	Current date and time	SELECT NOW();

CURDATE()	Current date	SELECT CURDATE();

CURTIME()	Current time	SELECT CURTIME();

DATE()	Extracts date part from datetime	SELECT DATE(NOW());

TIME()	Extracts time part	SELECT TIME(NOW());

DATEDIFF()	Difference between two dates (days)	SELECT DATEDIFF('2025-05-01', '2025-04-01');

DATE_ADD()	Adds interval to a date	SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);

DATE_SUB()	Subtracts interval from a date	SELECT DATE_SUB(CURDATE(), INTERVAL 3 DAY);

📊 Aggregate Functions

Function	Description	Example

COUNT()	Counts rows (can exclude NULLs)	SELECT COUNT(*) FROM student;

SUM()	Returns the total sum of a column	SELECT SUM(fees) FROM student;

AVG()	Returns the average value	SELECT AVG(fees) FROM student;

MIN()	Returns the smallest value	SELECT MIN(fees) FROM student;

MAX()	Returns the largest value	SELECT MAX(fees) FROM student;

GROUP_CONCAT()	Joins grouped strings	SELECT GROUP_CONCAT(name) FROM student;

➗ Mathematical Functions

Function	Description	Example

ROUND()	Rounds to given decimal places	SELECT ROUND(23.567, 1);

CEIL()	Rounds up to next integer	SELECT CEIL(4.2);

FLOOR()	Rounds down to lower integer	SELECT FLOOR(4.9);

ABS()	Returns absolute value	SELECT ABS(-9);

MOD()	Returns remainder after division	SELECT MOD(10, 3);

RAND()	Returns a random float (0 to 1)	SELECT RAND();

POWER()	Raises a number to given power	SELECT POWER(2, 3);

🔀 Conditional and Conversion Functions

Function	Description	Example

IF(condition, true, false)	Conditional expression (like ternary)	SELECT IF(1=1, 'yes', 'no');

CASE	Switch-case logic	SELECT CASE WHEN age >= 18 THEN 'Adult' END;

IFNULL(expr, val)	Returns val if expr is NULL	SELECT IFNULL(NULL, 'N/A');

COALESCE()	Returns first non-NULL value	SELECT COALESCE(NULL, '', 'Default');

ISNULL(expr)	Returns 1 if expr is NULL	SELECT ISNULL(NULL);

CAST(expr AS type)	Converts a value to specified type	SELECT CAST(123 AS CHAR);

CONVERT(expr USING charset)	Converts string to given charset	SELECT CONVERT(name USING utf8);

utf8 is a character set in MySQL used to store and represent text using the Unicode standard(Can store almost any language).

⚠️ Note:

MySQL’s utf8 only supports up to 3 bytes per character, not full Unicode (some emojis may break).

For full Unicode support, use:

utf8mb4	

🔡 ASCII and Binary Functions

Function	Description	Example

CHAR()	Returns character from ASCII code	SELECT CHAR(65); → 'A'

ASCII()	Returns ASCII value of first character	SELECT ASCII('A'); → 65

HEX()	Converts value to hexadecimal	SELECT HEX('A'); → 41

✅ Core MySQL Functions You Must Know as a Web Developer

These are the most important, used in almost every web project (login, dashboards, filtering, reports, etc.):

🔹 String Functions (Text Handling)

Function	Why?

CONCAT()	To join values (e.g. full name, address)

LOWER() / UPPER()	For case-insensitive searches

TRIM()	Clean user input

REPLACE()	Update or clean data

SUBSTRING()	Extract part of data (e.g., short descriptions)

🔹 Date & Time

Function	Why?

NOW()	Timestamps (logins, posts, etc.)

CURDATE()	Date-only fields

DATEDIFF()	Show user how many days ago something happened

DATE_ADD() / DATE_SUB()	Deadlines, expiry, scheduling

🔹 Aggregate Functions (Analytics, Admin Panels)

Function	Why?

COUNT()	Count users/orders/messages

SUM()	Total income, expenses

AVG()	Average ratings, prices

MIN() / MAX()	Oldest, newest, lowest, highest values

🔹 Math & Numbers

Function	Why?

ROUND()	Round prices, ratings

CEIL() / FLOOR()	Pagination, pricing logic

ABS()	Absolute values, differences

🔹 Conditional Logic

Function	Why?

IF()	Dynamic fields (e.g., pass/fail)

CASE	Advanced conditional logic

IFNULL() / COALESCE()	Prevent NULL issues in display

🔹 Data Type Conversion

Function	Why?

CAST()	Show numbers as strings (or vice versa)

CONVERT()	Handle character encoding properly

 

❗ Functions That Are Useful But Not Always Required

•	CHAR(), ASCII(), HEX() → more useful in data security, binary work, or DB internals

•	GROUP_CONCAT() → very useful for grouping related values (e.g., list of tags per product)

 

👨‍💻 When You’ll Use These

Use Case	Needed Functions

Login System	NOW(), IFNULL(), LOWER()

Blog/Post Website	SUBSTRING(), NOW(), DATEDIFF()

E-commerce Site	SUM(), COUNT(), AVG(), ROUND()

Admin Dashboard	All aggregate functions, CASE, GROUP_CONCAT()

User Profile Page	CONCAT(), TRIM(), REPLACE()

 

🎯 Final Advice:

👉 Don’t try to memorize all at once.

🔁 Just understand what they do, and learn them as you build real features.



Advance Class: 

🔹 GROUP BY Statement

•	Used to group rows that have the same values in a column.

•	Often used with aggregate functions: COUNT(), MAX(), MIN(), SUM(), AVG().

✅ Syntax:

SELECT column, aggregate_function()

FROM table_name

WHERE condition

GROUP BY column

ORDER BY column;

📌 Example:

SELECT COUNT(CustomerID), Country

FROM Customers

GROUP BY Country;

➡️ Counts customers in each country.

 

🔹 HAVING Clause

•	Used with GROUP BY to filter groups after aggregation.

•	WHERE ❌ cannot be used with aggregate functions like SUM(), COUNT().

✅ Syntax:

SELECT column, SUM(column)

FROM table

GROUP BY column

HAVING SUM(column) > value;

📌 Example:

SELECT pname, SUM(qty), SUM(total)

FROM product

GROUP BY pname

HAVING SUM(qty) > 10;

 

🔹 SQL Constraints (Rules on Table Columns)

Constraints ensure data accuracy and reliability.

Constraint	Meaning

NOT NULL	Column must have a value (can’t be NULL).

UNIQUE	All values in the column must be different. Can have 1 NULL.

PRIMARY KEY	Uniquely identifies rows. Combination of NOT NULL + UNIQUE.

FOREIGN KEY	Links two tables. Must match values in another table’s primary key.

CHECK	Validates values in a column (like CHECK (age > 18)).

DEFAULT	Sets a default value for a column.

CREATE INDEX	Improves the speed of search queries.

 

🔹 Practice Queries from Class:

-- Sum by product name

SELECT pname, SUM(total)

FROM product

GROUP BY pname

ORDER BY pname;



-- Sum with filter

SELECT pname, SUM(qty), SUM(total)

FROM product

WHERE rate > 1000

GROUP BY pname;



-- HAVING clause (sum filter)

SELECT pname, SUM(qty), SUM(total)

FROM product

GROUP BY pname

HAVING SUM(qty) > 10;



-- Filter product name using HAVING

SELECT pname, SUM(qty), SUM(total)

FROM product

GROUP BY pname

HAVING pname = "mouse";



-- Multiple conditions

SELECT pname, SUM(qty), SUM(total)

FROM product

WHERE pname NOT IN ("hdd")

GROUP BY pname

HAVING SUM(total) > 10000;

 

🔹 Table Constraint Example:

CREATE TABLE constraints (

  roll INT(10) UNIQUE,

  name VARCHAR(10) PRIMARY KEY,

  city VARCHAR(10)

);

📌 UNIQUE → Allows NULL

📌 PRIMARY KEY → No NULL, must be unique

Insert Example:

INSERT INTO constraints

VALUES (NULL, "vijay", "rewa"), (NULL, "not dup", NULL);

 

🧠 SQL Constraints:

🔒 1. NOT NULL – "No Empty Allowed"

You must enter a value in this column. It cannot be left blank (NULL).

💡 Note:

By default, a column can store NULL values unless NOT NULL is specified.

📌 Example:

CREATE TABLE students (

  rollno INT,

  name VARCHAR(10) NOT NULL,

  city VARCHAR(10)

);



-- This will cause an error because 'name' is NOT NULL

INSERT INTO students VALUES (101, NULL, 'Bhopal'); ❌



-- This is valid

INSERT INTO students VALUES (101, 'Himanshu', 'Bhopal'); ✅



-- This is valid too (because 'null' is a string, not NULL)

INSERT INTO students VALUES (103, 'null', 'Sehore'); ✅

 

✅ 2. CHECK – "Only Specific Values Allowed"

Used to allow only valid values based on some condition (like range, list, or pattern).

The CHECK constraint should be used with a condition inside parentheses. Also, the NOT NULL constraint should be placed outside or after the data type, not after CHECK.

📌 Example:

CREATE TABLE employee ( 

  emp_no VARCHAR(10) CHECK (emp_no LIKE 'e%'),        -- must start with 'e'

  name VARCHAR(10) NOT NULL,

  city VARCHAR(10) CHECK (city IN ('Bhopal', 'Indore', 'Ujjain')),

  age int CHECK (age>=18),

  salary INT CHECK (salary BETWEEN 5000 AND 25000)

);

INSERT INTO employee VALUES 

('e001', 'Himanshu', 'Indore',20, 20000),

('e002', 'Jatin', 'Ujjain', 22, 25000); ✅

⚠️ Note:

•	Always use parentheses () with CHECK constraints.

•	LIKE, IN, and range comparisons (BETWEEN) are commonly used.

 

✅ 3. DEFAULT – "Auto Fill If Empty"

If no value is given for this column, it will automatically fill with a default value.

📌 Example:

CREATE TABLE stu (

  no INT,

  name VARCHAR(10),

  city VARCHAR(10) DEFAULT 'BTech'

);

-- city will be 'BTech' because not provided

INSERT INTO stu (no, name) VALUES (111, 'Himanshu'), (112, 'Jatin');

-- All values provided

INSERT INTO stu VALUES (113, 'Vijay', 'MBA');

 

🔗 4. FOREIGN KEY Constraint – "Connect Two Tables"

🔹 Definition

Used to link one table to another. Ensures that the value in one table (child) matches a primary key in another table (parent). 

🧠 Concept:

•	Parent Table → Has the PRIMARY KEY

•	Child Table → Uses FOREIGN KEY to refer to parent

📌 Example:

Relationship: In the child table (child), the rollno comes from the parent table (parent), like a child referring to its parent. 

 

✅ Step 1: Create parent table

CREATE TABLE parent (

  rollno INT PRIMARY KEY,

  name VARCHAR(10),

  class VARCHAR(10)

);

 

✅ Step 2: Create child table with FOREIGN KEY

CREATE TABLE child (

  rollno INT,

  marks INT,

  FOREIGN KEY (rollno) REFERENCES parent(rollno)

);

 

✅ Step 3: Insert data into both tables

INSERT INTO parent VALUES 

(101, 'himanshu', 'btch'), 

(102, 'jatin', 'bcom'), 

(103, 'vijay', 'bsc');



INSERT INTO child VALUES 

(101, 80), 

(102, 85), 

(103, 88);

 

✅ Step 4: Show name, class, and marks (as percentage) using subquery (without join)

SELECT 

  name,

  class,

  (SELECT marks FROM child WHERE child.rollno = parent.rollno) AS percentage

FROM 

  parent;

 



Notes:

DELETE FROM student WHERE roll_no = roll_no;

❌ Why does it delete ALL rows?

Because roll_no = roll_no is true for every row — each roll number equals itself.

So it's the same as:

DELETE FROM student;		-- delete every row



❗But safer to use specific conditions like:

DELETE FROM student WHERE roll_no = 101; -- it delete only 101 roll_no data



DELETE FROM student WHERE roll_no IS NULL;

✅ This will correctly delete all rows where roll_no is NULL.

✅ What is a Subquery?

A subquery is a query inside another query.

🔹 It helps you: Fetch related data, Filter results, Replace JOINs in some cases

 

✅ Example Tables:

student table:

rollno	name	marks

101	Himanshu	80

102	Jatin	70

103	Vijay	90

 

✅ Step-by-Step with Subquery

🎯 Goal: Get students who scored above average

🧩 Subquery First:

SELECT AVG(marks) FROM student;

(returns 80)

 

✅ Main Query + Subquery:

SELECT name, marks

FROM student

WHERE marks > (SELECT AVG(marks) FROM student);

🧾 Output:

name	marks

Vijay	90

Because only Vijay scored above the average (80).

 

✅ Types of Subqueries:

1.	In SELECT clause:

SELECT name, (SELECT AVG(marks) FROM student) AS avg_marks FROM student;

2.	In WHERE clause (most common):

SELECT name FROM student WHERE marks > (SELECT AVG(marks) FROM student);

3.	In FROM clause:

SELECT * FROM (SELECT * FROM student WHERE marks > 80) AS top_students;

 

✅ Summary (For Notes):

Term	Meaning

Subquery	Query inside another query

Purpose	To filter, compare, or calculate related data

Common use	Inside SELECT, WHERE, or FROM clause

 

 

🔹 1. Indexes in SQL

•	Indexes help retrieve data faster from a table.

•	Work like a table of contents in a book.

•	Read operations become faster, but:

⚠️ Update/Insert/Delete operations become slower (because the index also needs updating).

 

📌 Create Index Syntax

👉 Regular Index (allows duplicate values)

CREATE INDEX index_name

ON table_name (col1, col2, ...);

👉 Unique Index (no duplicate values allowed)

CREATE UNIQUE INDEX index_name

ON table_name (col1, col2, ...);

🔁 Syntax may vary slightly in different databases. Always check your DBMS documentation.

 

💡 Example:

CREATE INDEX myidx ON student(class);

SELECT * FROM student;

✅ Index helps speed up SELECT queries, especially on large tables.

 

👁️ Visual Representation

Here’s how it looks internally (simplified):

STUDENT TABLE (Partitioned by CLASS)

 ├── Partition 10 --> [Index on Roll_No]

 ├── Partition 11 --> [Index on Roll_No]

 └── Partition 12 --> [Index on Roll_No]

When you run:

SELECT * FROM student WHERE class = 11 AND roll_no = 123;

👉 Database directly jumps to:

•	Partition for class = 11

•	Uses index to search for roll_no = 123

🔋 Fast and Efficient!

 

🔸 So, What is myidx?

•	myidx is just a custom name for your index.

•	You can name it anything like idx_class, class_index, index1... your choice!

•	It’s useful when you:

o	Want to DROP it later:

DROP INDEX myidx ON student;

o	Want to look up existing indexes

SHOW INDEX FROM student;

🎯 It’s like giving a name to a shortcut — so you can reuse or manage it later.

 

🔹 2. ALTER Statement

Used to:

•	Add, Modify, Delete, or Rename columns in an existing table.

•	Add constraints like NOT NULL, UNIQUE, etc.

 

📌 2.1 Add Column

ALTER TABLE table_name

ADD column_name datatype;

✅ Example:

ALTER TABLE customers ADD COLUMN email VARCHAR(255);

-- or( when adding column it works if not using column but other place always use column)

ALTER TABLE customers ADD email VARCHAR(255);

 

📌 2.2 Drop Column

ALTER TABLE table_name

DROP COLUMN column_name;

✅ Example:

ALTER TABLE employee DROP COLUMN state;

⚠️ Some databases may not support dropping a column directly.

 

📌 2.3 Rename Column

ALTER TABLE table_name

RENAME COLUMN old_name TO new_name;

✅ Example:

ALTER TABLE student RENAME COLUMN city TO address;

 

📌 2.4 Modify Column (Change datatype or size)

ALTER TABLE table_name

MODIFY COLUMN column_name NEW_DATATYPE;

✅ Example:

ALTER TABLE employee MODIFY COLUMN name VARCHAR(15);

❌ Reducing size can throw error if existing data doesn't fit:

ALTER TABLE employee MODIFY COLUMN name VARCHAR(5);  -- May cause error



🔹 3. 🔁 Changing Datatype (Depends on Compatibility)

From	To	Allowed?

INT → VARCHAR	✅ Yes	All int values can become text

VARCHAR → INT	⚠️ Maybe	Only if all values are numbers

FLOAT → INT	⚠️ Maybe	Will truncate decimals

INT → DATE	❌ No	Incompatible format

 

🚫 Example: Error when incompatible

ALTER TABLE employee MODIFY COLUMN name INT;

❌ This fails if name contains text values like "John".



Q: Can we change the datatype of a column in SQL if data is already inserted?

✅ Yes, if the existing data is compatible with the new datatype or size.



 

🔹 3. SQL Table Constraints via ALTER

✅ Use ALTER to Apply Constraints after Table Creation (if no data inserted yet)

📌 Example:

CREATE TABLE person (

    id INT,

    name VARCHAR(10),

    age INT

);

Add NOT NULL

ALTER TABLE person

MODIFY COLUMN id INT NOT NULL;

Add UNIQUE Constraint

ALTER TABLE person

ADD UNIQUE(id);  -- Now id becomes PRIMARY KEY because it's already NOT NULL

ALTER TABLE person

ADD UNIQUE(age); -- Now age becomes UNIQUE KEY

 

✅ Named Constraint in MySQL

🧱 What is a "Named Constraint"?

A named constraint is when you give a custom name to a constraint (like UNIQUE, PRIMARY KEY, etc.) so it's easier to identify and manage later.

 

🧠 Why use a named constraint?

•	Easy to drop or modify later (you know the name).

•	No need to search for the system-generated name.

•	Improves code readability and maintenance.

 

🔧 Syntax (MySQL):

ALTER TABLE table_name

ADD CONSTRAINT constraint_name UNIQUE (column_name);

 

🧾 Example:

ALTER TABLE students

ADD CONSTRAINT unique_roll UNIQUE (roll_no);

✅ What this does:

1.	Makes sure roll_no has no duplicates.

2.	Names the constraint as unique_roll.

 

❌ What if I skip the name?

ALTER TABLE students

ADD UNIQUE (roll_no);

⚠️ SQL will still create a UNIQUE constraint, but MySQL will auto-generate a name (like students_roll_no_uq1) — harder to remember or manage.

 

🔥 How to remove the constraint?

✅ In MySQL:

ALTER TABLE students DROP INDEX unique_roll;

⚠️ Note: In MySQL, UNIQUE constraints are treated as indexes, so you use DROP INDEX — not DROP CONSTRAINT.



🧠 Remember here's the difference:

Action	What it does

ALTER TABLE students DROP INDEX unique_roll;	❌ Only removes the UNIQUE constraint from roll_no, NOT the column itself.

ALTER TABLE students DROP COLUMN roll_no;	⚠️ Completely deletes the entire roll_no column — data gone!



 

🧠 Interview Tip:

Q: Why should we use named constraints in SQL?

✅ So we can easily drop or update them later using their names. It also makes the code cleaner and more maintainable.

 

🔁 Summary Table:

Task	With Named Constraint	Without Named Constraint

Add UNIQUE	ADD CONSTRAINT name UNIQUE(...)	ADD UNIQUE (...)

Drop in MySQL	DROP INDEX constraint_name	SHOW INDEXES → get name → drop

Easy to manage?	✅ Yes	❌ No (name is auto-generated)

 

Awesome! You've got a solid table for constraint types. Now let's complete it with how to drop each one — in a way that's simple, clear, and 100% MySQL-friendly. ✅

🧱 SQL Constraints – Add & Drop Cheat Sheet (MySQL)

Constraint Type	Purpose	Add Example	🧹 How to Drop (MySQL)

UNIQUE	Prevent duplicates	ADD CONSTRAINT u_email UNIQUE(email)	ALTER TABLE table_name DROP INDEX u_email;

PRIMARY KEY	Unique + Not Null	ADD CONSTRAINT pk_id PRIMARY KEY(id)	ALTER TABLE table_name DROP PRIMARY KEY;

FOREIGN KEY	Link two tables	ADD CONSTRAINT fk_dept FOREIGN KEY(dept_id) REFERENCES departments(id)	ALTER TABLE table_name DROP FOREIGN KEY fk_dept;

CHECK	Enforce value rules	ADD CONSTRAINT chk_age CHECK (age > 18)	ALTER TABLE table_name DROP CHECK chk_age;*

⚠️ Note on CHECK:

•	MySQL supports CHECK constraints from version 8.0.16 and above.

•	If using an older version, CHECK is parsed but ignored.

 

✅ Example with all drops:

-- Drop UNIQUE

ALTER TABLE users DROP INDEX u_email;



-- Drop PRIMARY KEY

ALTER TABLE users DROP PRIMARY KEY;



-- Drop FOREIGN KEY

ALTER TABLE employees DROP FOREIGN KEY fk_dept;



-- Drop CHECK (MySQL 8.0.16+)

ALTER TABLE users DROP CHECK chk_age;

 

🧠 Tips to Remember:

•	UNIQUE → it's an index, so use DROP INDEX.

•	PRIMARY KEY → always use DROP PRIMARY KEY.

•	FOREIGN KEY → needs foreign key name, use DROP FOREIGN KEY.

•	CHECK → new in MySQL 8+, use DROP CHECK if supported.

 

 

✅ Summary Cheatsheet

Task	Command Example

Create Index	CREATE INDEX idx ON table(col);

Create Unique Index	CREATE UNIQUE INDEX idx ON table(col);

Add Column	ALTER TABLE table ADD col DATATYPE;

Drop Column	ALTER TABLE table DROP COLUMN col;

Rename Column	ALTER TABLE table RENAME COLUMN old TO new;

Modify Column	ALTER TABLE table MODIFY COLUMN col NEW_TYPE;

Add NOT NULL	ALTER TABLE table MODIFY COLUMN col TYPE NOT NULL;

Add UNIQUE	ALTER TABLE table ADD UNIQUE(col);

Add Named Constraint	ALTER TABLE table ADD CONSTRAINT name UNIQUE(col);

 

🔎 Index vs Primary Key vs Unique Key

Feature	Index	Primary Key	Unique Key

✅ Purpose	Fast search/lookups	Uniquely identifies each row	Ensures column values are unique

✅ Duplicates	✅ Allowed	❌ Not allowed	❌ Not allowed

✅ NULL values	✅ Allowed	❌ Not allowed (must be NOT NULL)	✅ Allowed (but only one NULL in MySQL)

✅ Default Index	🔁 Optional	✅ Automatically creates clustered index	✅ Automatically creates non-clustered index

✅ Number allowed	🔁 Many indexes per table	❌ Only ONE per table	✅ Multiple unique keys per table

✅ Used in	WHERE, JOIN, ORDER BY	Identifying a record (like roll number)	Ensuring data integrity (like email)

 

📘 SQL Command Categories (DDL vs DML vs TCL vs more)

🔢 Type	🧾 Full Form	🔧 Used For	🛠️ Examples

🏗️ DDL	Data Definition Language	Structure-related commands (create/alter tables etc.)	CREATE, ALTER, DROP, TRUNCATE

✍️ DML	Data Manipulation Language	Data-related actions (insert/update/delete)	INSERT, UPDATE, DELETE

🔁 TCL	Transaction Control Language	Save/confirm/cancel grouped DML operations	COMMIT, ROLLBACK, SAVEPOINT

📄 DQL	Data Query Language	Only for fetching/querying data	SELECT

🔐 DCL	Data Control Language	Permissions and access control	GRANT, REVOKE

 

📌 1. DDL (Structure)

•	Defines and changes table structure.

•	Auto-commits (can’t rollback).

✅ Examples:

CREATE TABLE students (...);

ALTER TABLE students ADD column age INT;

DROP TABLE students;

TRUNCATE TABLE students;

 

📌 2. DML (Data)

•	Changes actual data in the table.

•	Needs COMMIT to be saved permanently (can be rolled back).

✅ Examples:

INSERT INTO students VALUES (...);

UPDATE students SET name = 'Amit';

DELETE FROM students WHERE id = 5;

 

📌 3. TCL (Transaction Control)

•	Controls how/when DML changes are saved.

•	Used after INSERT, UPDATE, DELETE.

✅ Examples:

START TRANSACTION;

UPDATE students SET name = 'Raj';

ROLLBACK;  -- undo changes



UPDATE students SET name = 'Meena';

COMMIT;    -- save changes permanently

 

📌 4. DQL (Only Querying)

•	Retrieves data (READ-ONLY)

✅ Example:

SELECT * FROM students;

 

📌 5. DCL (Permissions)

•	Controls who can access or modify data/tables.

✅ Examples:

GRANT SELECT, INSERT ON students TO 'user1';

REVOKE DELETE ON students FROM 'user1';

 

🧠 Interview Tip:

Q: Is SELECT a DML command?

A: ❌ No. It is a DQL command — only used for querying data, not modifying it.







 


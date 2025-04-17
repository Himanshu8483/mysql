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









 


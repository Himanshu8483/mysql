CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

SELECT * FROM users;
-- CREATE TABLE users (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100),
--     email VARCHAR(100)
-- );

INSERT INTO users (name, email) VALUES ('Himanshu', 'himanshu@.com');
USE testdb;

SELECT * FROM users;
drop table users;

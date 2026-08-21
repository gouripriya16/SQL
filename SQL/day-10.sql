mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-08-21 12:17:26 |
+---------------------+
1 row in set (0.00 sec)

mysql> select curdate();
+------------+
| curdate()  |
+------------+
| 2026-08-21 |
+------------+
1 row in set (0.04 sec)

mysql> select curtime();
+-----------+
| curtime() |
+-----------+
| 12:18:12  |
+-----------+
1 row in set (0.00 sec)

mysql> select year();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> select year(curdate);
ERROR 1054 (42S22): Unknown column 'curdate' in 'field list'
mysql> select year(curdate());
+-----------------+
| year(curdate()) |
+-----------------+
|            2026 |
+-----------------+
1 row in set (0.00 sec)

mysql> select month(curdate());
+------------------+
| month(curdate()) |
+------------------+
|                8 |
+------------------+
1 row in set (0.00 sec)

mysql> select day(curdate());
+----------------+
| day(curdate()) |
+----------------+
|             21 |
+----------------+
1 row in set (0.00 sec)

mysql> select dayname(curdate());
+--------------------+
| dayname(curdate()) |
+--------------------+
| Friday             |
+--------------------+
1 row in set (0.04 sec)

mysql> select datediff(curdate(),'2026-06-19');
+----------------------------------+
| datediff(curdate(),'2026-06-19') |
+----------------------------------+
|                               63 |
+----------------------------------+
1 row in set (0.04 sec)

mysql> select date_add(curdate(),interval 10 day);
+-------------------------------------+
| date_add(curdate(),interval 10 day) |
+-------------------------------------+
| 2026-08-31                          |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> select date_sub(curdate,interval 10 day);
ERROR 1054 (42S22): Unknown column 'curdate' in 'field list'
mysql> select date_sub(curdate(),interval 10 day);
+-------------------------------------+
| date_sub(curdate(),interval 10 day) |
+-------------------------------------+
| 2026-08-11                          |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> select date_format(curdate(),%d%m%y);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '%d%m%y)' at line 1
mysql> select date_format(curdate(),'%d%m%y');
+---------------------------------+
| date_format(curdate(),'%d%m%y') |
+---------------------------------+
| 210826                          |
+---------------------------------+
1 row in set (0.05 sec)

mysql> select date_format(curdate(),'%d-%m-%y');
+-----------------------------------+
| date_format(curdate(),'%d-%m-%y') |
+-----------------------------------+
| 21-08-26                          |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> select date_format(curdate(),'%d/%m/%y');
+-----------------------------------+
| date_format(curdate(),'%d/%m/%y') |
+-----------------------------------+
| 21/08/26                          |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> select str_to_date('21-08-2026','%y-%m-%d');
+--------------------------------------+
| str_to_date('21-08-2026','%y-%m-%d') |
+--------------------------------------+
| 2021-08-20                           |
+--------------------------------------+
1 row in set, 1 warning (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| companydb          |
| da22               |
| films              |
| information_schema |
| movies             |
| mysql              |
| performance_schema |
| sql_20_days        |
| student            |
| sys                |
+--------------------+
10 rows in set (0.00 sec)

mysql> create database version;
Query OK, 1 row affected (0.03 sec)

mysql> use version;
Database changed
mysql> select database();
+------------+
| database() |
+------------+
| version    |
+------------+
1 row in set (0.00 sec)

mysql> select version();
+-----------+
| version() |
+-----------+
| 8.0.46    |
+-----------+
1 row in set (0.00 sec)

mysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> select connection_id();
+-----------------+
| connection_id() |
+-----------------+
|              14 |
+-----------------+
1 row in set (0.04 sec)

mysql> select current_user();
+----------------+
| current_user() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.04 sec)

mysql> show tables;
Empty set (0.06 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| companydb          |
| da22               |
| films              |
| information_schema |
| movies             |
| mysql              |
| performance_schema |
| sql_20_days        |
| student            |
| sys                |
| version            |
+--------------------+
11 rows in set (0.00 sec)

mysql> create table employee;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table employee(
    ->  emp_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     emp_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     salary DECIMAL(10,2),
    ->     joining_date DATE,
    ->     birth_date DATE
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO employees
    -> (emp_name, department, salary, joining_date, birth_date)
    -> VALUES
    -> ('Ravi', 'IT', 55000, '2022-01-15', '1998-05-20'),
    -> ('Priya', 'HR', 48000, '2021-06-10', '1997-08-15'),
    -> ('Arun', 'IT', 72000, '2020-03-25', '1995-12-10'),
    -> ('Sneha', 'Finance', 65000, '2023-02-18', '1999-01-25'),
    -> ('Kiran', 'HR', 52000, '2022-11-05', '1996-07-12'),
    -> ('Anil', 'IT', 60000, '2024-01-20', '2000-03-30'),
    -> ('Divya', 'Finance', 75000, '2019-09-12', '1994-11-18'),
    -> ('Manoj', 'Sales', 45000, '2023-07-01', '1998-02-14'),
    -> ('Pooja', 'Sales', 58000, '2021-12-20', '1997-06-22'),
    -> ('Suresh', 'IT', 68000, '2020-08-30', '1995-10-05');
ERROR 1146 (42S02): Table 'version.employees' doesn't exist
mysql> INSERT INTO employees
    -> (emp_name, department, salary, joining_date, birth_date)
    -> VALUES
    -> ('Ravi', 'IT', 55000, '2022-01-15', '1998-05-20'),
    -> ('Priya', 'HR', 48000, '2021-06-10', '1997-08-15'),
    -> ('Arun', 'IT', 72000, '2020-03-25', '1995-12-10'),
    -> ('Sneha', 'Finance', 65000, '2023-02-18', '1999-01-25'),
    -> ('Kiran', 'HR', 52000, '2022-11-05', '1996-07-12'),
    -> ('Anil', 'IT', 60000, '2024-01-20', '2000-03-30'),
    -> ('Divya', 'Finance', 75000, '2019-09-12', '1994-11-18'),
    -> ('Manoj', 'Sales', 45000, '2023-07-01', '1998-02-14'),
    -> ('Pooja', 'Sales', 58000, '2021-12-20', '1997-06-22'),
    -> ('Suresh', 'IT', 68000, '2020-08-30', '1995-10-05');
ERROR 1146 (42S02): Table 'version.employees' doesn't exist
mysql> show tables;
+-------------------+
| Tables_in_version |
+-------------------+
| employee          |
+-------------------+
1 row in set (0.00 sec)

mysql> desc employee;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| emp_id       | int           | NO   | PRI | NULL    | auto_increment |
| emp_name     | varchar(50)   | YES  |     | NULL    |                |
| department   | varchar(30)   | YES  |     | NULL    |                |
| salary       | decimal(10,2) | YES  |     | NULL    |                |
| joining_date | date          | YES  |     | NULL    |                |
| birth_date   | date          | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
6 rows in set (0.04 sec)

mysql> INSERT INTO employee
    -> (emp_name, department, salary, joining_date, birth_date)
    -> VALUES
    -> ('Ravi', 'IT', 55000, '2022-01-15', '1998-05-20'),
    -> ('Priya', 'HR', 48000, '2021-06-10', '1997-08-15'),
    -> ('Arun', 'IT', 72000, '2020-03-25', '1995-12-10'),
    -> ('Sneha', 'Finance', 65000, '2023-02-18', '1999-01-25'),
    -> ('Kiran', 'HR', 52000, '2022-11-05', '1996-07-12'),
    -> ('Anil', 'IT', 60000, '2024-01-20', '2000-03-30'),
    -> ('Divya', 'Finance', 75000, '2019-09-12', '1994-11-18'),
    -> ('Manoj', 'Sales', 45000, '2023-07-01', '1998-02-14'),
    -> ('Pooja', 'Sales', 58000, '2021-12-20', '1997-06-22'),
    -> ('Suresh', 'IT', 68000, '2020-08-30', '1995-10-05');
Query OK, 10 rows affected (0.05 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-08-21 12:40:48 |
+---------------------+
1 row in set (0.00 sec)

mysql> select emp_name,datediff(curdate(),joining_date)
    -> from employee;
+----------+----------------------------------+
| emp_name | datediff(curdate(),joining_date) |
+----------+----------------------------------+
| Ravi     |                             1679 |
| Priya    |                             1898 |
| Arun     |                             2340 |
| Sneha    |                             1280 |
| Kiran    |                             1385 |
| Anil     |                              944 |
| Divya    |                             2535 |
| Manoj    |                             1147 |
| Pooja    |                             1705 |
| Suresh   |                             2182 |
+----------+----------------------------------+
10 rows in set (0.00 sec)

mysql> select emp_name,datediff(curdate(),joining_date)
    -> from employee where datediff(curdate(),joining_date)> 1000;
+----------+----------------------------------+
| emp_name | datediff(curdate(),joining_date) |
+----------+----------------------------------+
| Ravi     |                             1679 |
| Priya    |                             1898 |
| Arun     |                             2340 |
| Sneha    |                             1280 |
| Kiran    |                             1385 |
| Divya    |                             2535 |
| Manoj    |                             1147 |
| Pooja    |                             1705 |
| Suresh   |                             2182 |
+----------+----------------------------------+
9 rows in set (0.03 sec)

mysql> select now() from employee;
+---------------------+
| now()               |
+---------------------+
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
| 2026-08-21 12:47:53 |
+---------------------+
10 rows in set (0.00 sec)

mysql> select curdate() from employee;
+------------+
| curdate()  |
+------------+
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
| 2026-08-21 |
+------------+
10 rows in set (0.00 sec)

mysql> select curtime() from employee;
+-----------+
| curtime() |
+-----------+
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
| 12:48:43  |
+-----------+
10 rows in set (0.00 sec)

mysql> select year(emp_name);
ERROR 1054 (42S22): Unknown column 'emp_name' in 'field list'
mysql> select year(emp_name) from employee;
+----------------+
| year(emp_name) |
+----------------+
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
|           NULL |
+----------------+
10 rows in set, 10 warnings (0.00 sec)

mysql> desc emloyee;
ERROR 1146 (42S02): Table 'version.emloyee' doesn't exist
mysql> desc employee;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| emp_id       | int           | NO   | PRI | NULL    | auto_increment |
| emp_name     | varchar(50)   | YES  |     | NULL    |                |
| department   | varchar(30)   | YES  |     | NULL    |                |
| salary       | decimal(10,2) | YES  |     | NULL    |                |
| joining_date | date          | YES  |     | NULL    |                |
| birth_date   | date          | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

mysql> show employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employee' at line 1
mysql> show table employee;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'employee' at line 1
mysql> select emp_name,year(joining_date)
    -> from employee;
+----------+--------------------+
| emp_name | year(joining_date) |
+----------+--------------------+
| Ravi     |               2022 |
| Priya    |               2021 |
| Arun     |               2020 |
| Sneha    |               2023 |
| Kiran    |               2022 |
| Anil     |               2024 |
| Divya    |               2019 |
| Manoj    |               2023 |
| Pooja    |               2021 |
| Suresh   |               2020 |
+----------+--------------------+
10 rows in set (0.03 sec)

mysql> select emp_name,month(joining_date) from employee;
+----------+---------------------+
| emp_name | month(joining_date) |
+----------+---------------------+
| Ravi     |                   1 |
| Priya    |                   6 |
| Arun     |                   3 |
| Sneha    |                   2 |
| Kiran    |                  11 |
| Anil     |                   1 |
| Divya    |                   9 |
| Manoj    |                   7 |
| Pooja    |                  12 |
| Suresh   |                   8 |
+----------+---------------------+
10 rows in set (0.00 sec)

mysql> select emp_name,day(joining_date) from employee;
+----------+-------------------+
| emp_name | day(joining_date) |
+----------+-------------------+
| Ravi     |                15 |
| Priya    |                10 |
| Arun     |                25 |
| Sneha    |                18 |
| Kiran    |                 5 |
| Anil     |                20 |
| Divya    |                12 |
| Manoj    |                 1 |
| Pooja    |                20 |
| Suresh   |                30 |
+----------+-------------------+
10 rows in set (0.00 sec)

mysql> select emp_name,dayname(joining_date) from employee;
+----------+-----------------------+
| emp_name | dayname(joining_date) |
+----------+-----------------------+
| Ravi     | Saturday              |
| Priya    | Thursday              |
| Arun     | Wednesday             |
| Sneha    | Saturday              |
| Kiran    | Saturday              |
| Anil     | Saturday              |
| Divya    | Thursday              |
| Manoj    | Saturday              |
| Pooja    | Monday                |
| Suresh   | Sunday                |
+----------+-----------------------+
10 rows in set (0.00 sec)
mysql> SELECT emp_name, DATEDIFF(CURDATE(), joining_date) AS days_worked
    -> FROM employees;
+----------+-------------+
| emp_name | days_worked |
+----------+-------------+
| Ravi     |        1679 |
| Priya    |        1898 |
| Arun     |        2340 |
| Sneha    |        1280 |
| Kiran    |        1385 |
| Anil     |         944 |
| Divya    |        2535 |
| Manoj    |        1147 |
| Pooja    |        1705 |
| Suresh   |        2182 |
+----------+-------------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE DATEDIFF(CURDATE(), joining_date) > 1000;
+--------+----------+------------+----------+--------------+------------+
| emp_id | emp_name | department | salary   | joining_date | birth_date |
+--------+----------+------------+----------+--------------+------------+
|      1 | Ravi     | IT         | 55000.00 | 2022-01-15   | 1998-05-20 |
|      2 | Priya    | HR         | 48000.00 | 2021-06-10   | 1997-08-15 |
|      3 | Arun     | IT         | 72000.00 | 2020-03-25   | 1995-12-10 |
|      4 | Sneha    | Finance    | 65000.00 | 2023-02-18   | 1999-01-25 |
|      5 | Kiran    | HR         | 52000.00 | 2022-11-05   | 1996-07-12 |
|      7 | Divya    | Finance    | 75000.00 | 2019-09-12   | 1994-11-18 |
|      8 | Manoj    | Sales      | 45000.00 | 2023-07-01   | 1998-02-14 |
|      9 | Pooja    | Sales      | 58000.00 | 2021-12-20   | 1997-06-22 |
|     10 | Suresh   | IT         | 68000.00 | 2020-08-30   | 1995-10-05 |
+--------+----------+------------+----------+--------------+------------+
9 rows in set (0.00 sec)

mysql> SELECT emp_name,
    ->        joining_date,
    ->        DATE_ADD(joining_date, INTERVAL 1 YEAR) AS one_year_after
    -> FROM employees;
+----------+--------------+----------------+
| emp_name | joining_date | one_year_after |
+----------+--------------+----------------+
| Ravi     | 2022-01-15   | 2023-01-15     |
| Priya    | 2021-06-10   | 2022-06-10     |
| Arun     | 2020-03-25   | 2021-03-25     |
| Sneha    | 2023-02-18   | 2024-02-18     |
| Kiran    | 2022-11-05   | 2023-11-05     |
| Anil     | 2024-01-20   | 2025-01-20     |
| Divya    | 2019-09-12   | 2020-09-12     |
| Manoj    | 2023-07-01   | 2024-07-01     |
| Pooja    | 2021-12-20   | 2022-12-20     |
| Suresh   | 2020-08-30   | 2021-08-30     |
+----------+--------------+----------------+
10 rows in set (0.00 sec)

mysql> SELECT emp_name,
    ->        joining_date,
    ->        DATE_ADD(joining_date, INTERVAL 30 DAY) AS after_30_days
    -> FROM employees;
+----------+--------------+---------------+
| emp_name | joining_date | after_30_days |
+----------+--------------+---------------+
| Ravi     | 2022-01-15   | 2022-02-14    |
| Priya    | 2021-06-10   | 2021-07-10    |
| Arun     | 2020-03-25   | 2020-04-24    |
| Sneha    | 2023-02-18   | 2023-03-20    |
| Kiran    | 2022-11-05   | 2022-12-05    |
| Anil     | 2024-01-20   | 2024-02-19    |
| Divya    | 2019-09-12   | 2019-10-12    |
| Manoj    | 2023-07-01   | 2023-07-31    |
| Pooja    | 2021-12-20   | 2022-01-19    |
| Suresh   | 2020-08-30   | 2020-09-29    |
+----------+--------------+---------------+
10 rows in set (0.00 sec)

mysql> SELECT emp_name,
    ->        joining_date,
    ->        DATE_SUB(joining_date, INTERVAL 6 MONTH) AS six_months_before
    -> FROM employees;
+----------+--------------+-------------------+
| emp_name | joining_date | six_months_before |
+----------+--------------+-------------------+
| Ravi     | 2022-01-15   | 2021-07-15        |
| Priya    | 2021-06-10   | 2020-12-10        |
| Arun     | 2020-03-25   | 2019-09-25        |
| Sneha    | 2023-02-18   | 2022-08-18        |
| Kiran    | 2022-11-05   | 2022-05-05        |
| Anil     | 2024-01-20   | 2023-07-20        |
| Divya    | 2019-09-12   | 2019-03-12        |
| Manoj    | 2023-07-01   | 2023-01-01        |
| Pooja    | 2021-12-20   | 2021-06-20        |
| Suresh   | 2020-08-30   | 2020-02-29        |
+----------+--------------+-------------------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM employees
    -> WHERE joining_date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);
+--------+----------+------------+----------+--------------+------------+
| emp_id | emp_name | department | salary   | joining_date | birth_date |
+--------+----------+------------+----------+--------------+------------+
|      6 | Anil     | IT         | 60000.00 | 2024-01-20   | 2000-03-30 |
+--------+----------+------------+----------+--------------+------------+
1 row in set (0.04 sec)

mysql> SELECT emp_name,
    ->        DATE_FORMAT(joining_date, '%d-%m-%Y') AS joining_date
    -> FROM employees;
+----------+--------------+
| emp_name | joining_date |
+----------+--------------+
| Ravi     | 15-01-2022   |
| Priya    | 10-06-2021   |
| Arun     | 25-03-2020   |
| Sneha    | 18-02-2023   |
| Kiran    | 05-11-2022   |
| Anil     | 20-01-2024   |
| Divya    | 12-09-2019   |
| Manoj    | 01-07-2023   |
| Pooja    | 20-12-2021   |
| Suresh   | 30-08-2020   |
+----------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT emp_name,
    ->        DATE_FORMAT(joining_date, '%d %M %Y') AS joining_date
    -> FROM employees;
+----------+-------------------+
| emp_name | joining_date      |
+----------+-------------------+
| Ravi     | 15 January 2022   |
| Priya    | 10 June 2021      |
| Arun     | 25 March 2020     |
| Sneha    | 18 February 2023  |
| Kiran    | 05 November 2022  |
| Anil     | 20 January 2024   |
| Divya    | 12 September 2019 |
| Manoj    | 01 July 2023      |
| Pooja    | 20 December 2021  |
| Suresh   | 30 August 2020    |
+----------+-------------------+
10 rows in set (0.00 sec)

mysql> SELECT STR_TO_DATE('25-08-2024', '%d-%m-%Y') AS converted_date;
+----------------+
| converted_date |
+----------------+
| 2024-08-25     |
+----------------+
1 row in set (0.00 sec)

mysql>
mysql> SELECT STR_TO_DATE('15/January/2023', '%d/%M/%Y') AS converted_date;
+----------------+
| converted_date |
+----------------+
| 2023-01-15     |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT VERSION() AS mysql_version;
+---------------+
| mysql_version |
+---------------+
| 8.0.46        |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT DATABASE() AS current_database,
    ->        USER() AS current_user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'current_user' at line 2
mysql> SELECT DATABASE() AS current_database,
    ->        USER() AS current_user;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'current_user' at line 2
mysql> SELECT DATABASE() AS current_database,
    ->        USER() AS mysql_user;
+------------------+----------------+
| current_database | mysql_user     |
+------------------+----------------+
| da22             | root@localhost |
+------------------+----------------+
1 row in set (0.00 sec)

mysql> INSERT INTO employees
    -> (emp_name, department, salary, joining_date, birth_date)
    -> VALUES
    -> ('Rahul', 'IT', 62000, '2026-08-21', '2000-06-15');
Query OK, 1 row affected (0.05 sec)

mysql>
mysql> SELECT LAST_INSERT_ID() AS generated_emp_id;
+------------------+
| generated_emp_id |
+------------------+
|               11 |
+------------------+
1 row in set (0.00 sec)

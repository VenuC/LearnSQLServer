--https://www.techbeamers.com/sql-query-questions-answers-for-practice


--CREATE DATABASE ORG;
--SELECT * FROM sys.databases;
--USE ORG;

--CREATE TABLE Worker (
--	WORKER_ID INT NOT NULL PRIMARY KEY IDENTITY,
--	FIRST_NAME VARCHAR(25),
--	LAST_NAME VARCHAR(25),
--	SALARY INT,
--	JOINING_DATE DATETIME,
--	DEPARTMENT VARCHAR(25)
--);

--INSERT INTO Worker 
--	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
--		('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
--		('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
--		('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
--		('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
--		('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
--		('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
--		('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
--		('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

--CREATE TABLE Bonus (
--	WORKER_REF_ID INT,
--	BONUS_AMOUNT INT,
--	BONUS_DATE DATETIME,
--	FOREIGN KEY (WORKER_REF_ID)
--		REFERENCES Worker(WORKER_ID)
--        ON DELETE CASCADE
--);

--INSERT INTO Bonus 
--	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
--		(1, 5000, '2016-02-20'),
--		(2, 3000, '2016-06-11'),
--		(3, 4000, '2016-02-20'),
--		(1, 4500, '2016-02-20'),
--		(2, 3500, '2016-06-11');

--CREATE TABLE Title (
--	WORKER_REF_ID INT,
--	WORKER_TITLE CHAR(25),
--	AFFECTED_FROM DATETIME,
--	FOREIGN KEY (WORKER_REF_ID)
--		REFERENCES Worker(WORKER_ID)
--        ON DELETE CASCADE
--);

--INSERT INTO Title 
--	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
-- (1, 'Manager', '2016-02-20 00:00:00'),
-- (2, 'Executive', '2016-06-11 00:00:00'),
-- (8, 'Executive', '2016-06-11 00:00:00'),
-- (5, 'Manager', '2016-06-11 00:00:00'),
-- (4, 'Asst. Manager', '2016-06-11 00:00:00'),
-- (7, 'Executive', '2016-06-11 00:00:00'),
-- (6, 'Lead', '2016-06-11 00:00:00'),
-- (3, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM dbo.Worker
SELECT * FROM dbo.Bonus
SELECT * FROM dbo.Title

--Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>
SELECT FIRST_NAME AS WORKER_NAME
FROM dbo.Worker

--Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
SELECT UPPER(FIRST_NAME) AS WORKER_NAME
FROM dbo.Worker

--Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
SELECT DISTINCT DEPARTMENT
FROM dbo.Worker

SELECT DEPARTMENT
FROM dbo.Worker
GROUP BY DEPARTMENT

--Q-4. Write An SQL Query To Print First Three Characters Of  FIRST_NAME From Worker Table.
SELECT LEFT(FIRST_NAME, 3) AS WORKER_NAME
FROM dbo.Worker

SELECT SUBSTRING(FIRST_NAME, 1, 3) AS WORKER_NAME
FROM dbo.Worker

--Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
SELECT FIRST_NAME, CHARINDEX('A', FIRST_NAME, 1) AS WORKER_NAME
FROM dbo.Worker
WHERE FIRST_NAME = 'Amitabh'

--Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
SELECT RTRIM(FIRST_NAME) AS WORKER_NAME
FROM dbo.Worker

--Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.
SELECT LTRIM(FIRST_NAME) AS WORKER_NAME
FROM dbo.Worker

--Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
SELECT DISTINCT LEN(DEPARTMENT) [LENGTH]
FROM dbo.Worker

--Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A') AS WORKER_NAME
FROM dbo.Worker

--Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. 
--A Space Char Should Separate Them.
SELECT FIRST_NAME + ' ' + LAST_NAME AS COMPLETE_NAME
FROM dbo.Worker

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME
FROM dbo.Worker

SELECT STUFF(STUFF(LAST_NAME, 1, 0, ' '), 1, 0, FIRST_NAME) AS COMPLETE_NAME FROM dbo.Worker;

--Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
SELECT * FROM dbo.Worker
ORDER BY FIRST_NAME ASC

--Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
SELECT * FROM dbo.Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC

--Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
SELECT * FROM dbo.Worker
WHERE FIRST_NAME IN ('Vipul', 'Satish')

SELECT * FROM dbo.Worker
WHERE FIRST_NAME = 'Vipul' OR FIRST_NAME = 'Satish'

--Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
SELECT * FROM dbo.Worker
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish')

SELECT * FROM dbo.Worker
WHERE (FIRST_NAME <> 'Vipul' AND FIRST_NAME <> 'Satish')

--Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
SELECT * FROM dbo.Worker
WHERE DEPARTMENT = 'Admin'

--Q-16.1. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME starts with ‘A’.
SELECT * FROM dbo.Worker
WHERE LEFT(FIRST_NAME, 1) = 'A'

SELECT * FROM dbo.Worker
WHERE SUBSTRING(FIRST_NAME, 1, 1) = 'A'

--Q-16.2. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
SELECT * FROM dbo.Worker
WHERE FIRST_NAME LIKE '%A%'

--Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
SELECT * FROM dbo.Worker
WHERE RIGHT(FIRST_NAME, 1) = 'A'

SELECT * FROM dbo.Worker
WHERE FIRST_NAME LIKE '%A'

SELECT * FROM dbo.Worker
WHERE SUBSTRING(FIRST_NAME, LEN(FIRST_NAME), 1) = 'A'

--Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.
SELECT * FROM dbo.Worker
WHERE RIGHT(FIRST_NAME, 1) = 'H'
AND LEN(FIRST_NAME) = 6

--Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
SELECT * FROM dbo.Worker
WHERE SALARY BETWEEN 100000 AND 500000

SELECT * FROM dbo.Worker
WHERE SALARY >= 100000 AND SALARY <= 500000

--Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
SELECT * FROM dbo.Worker
WHERE YEAR(JOINING_DATE) = 2014
AND MONTH(JOINING_DATE) = 2

--Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
SELECT COUNT(1)
FROM dbo.Worker
WHERE DEPARTMENT = 'Admin'

--Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
SELECT * FROM dbo.Worker
WHERE SALARY >= 50000 AND SALARY <= 100000

SELECT * FROM dbo.Worker
WHERE SALARY BETWEEN 50000 AND 100000

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

--Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
SELECT DEPARTMENT, COUNT(1) EmployeeCount
FROM dbo.Worker
GROUP BY DEPARTMENT
ORDER BY EmployeeCount DESC

--Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
SELECT w.* 
FROM dbo.Worker w
JOIN dbo.Title t
ON t.WORKER_REF_ID = w.WORKER_ID
WHERE t.WORKER_TITLE = 'Manager'

--Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM dbo.Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
SELECT * 
FROM dbo.Worker
WHERE WORKER_ID % 2 <> 0

--Q-27. Write An SQL Query To Show Only Even Rows From A Table.
SELECT * 
FROM dbo.Worker
WHERE WORKER_ID % 2 = 0

--Q-28. Write An SQL Query To Clone A New Table From Another Table.
SELECT * 
INTO dbo.Worker_Clone
FROM dbo.Worker

--Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
SELECT * FROM dbo.Worker
INTERSECT
SELECT * FROM dbo.Worker_Clone

--Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
SELECT * FROM dbo.Worker
EXCEPT
SELECT * FROM dbo.Worker_Clone

--Q-31. Write An SQL Query To Show The Current Date And Time.
SELECT GETDATE()

--
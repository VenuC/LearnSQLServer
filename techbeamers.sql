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
SELECT SYSDATETIME()
SELECT CURRENT_TIMESTAMP
SELECT SYSUTCDATETIME()

--Q-32. Write An SQL Query To Show The Top N (Say 6) Records Of A Table.
SELECT TOP 6 *
FROM dbo.Worker

SELECT *
FROM dbo.Worker
ORDER BY WORKER_ID
OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY

--Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
SELECT SALARY 
FROM (
	SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) rownum
	FROM dbo.Worker
) as result
WHERE rownum = 5

SELECT TOP 1 SALARY
FROM (
	SELECT DISTINCT TOP 5 SALARY FROM dbo.Worker ORDER BY SALARY DESC
) as result
ORDER BY SALARY ASC

SELECT DISTINCT SALARY 
FROM dbo.Worker 
ORDER BY SALARY DESC
OFFSET 4 ROWS FETCH NEXT 1 ROW ONLY

--Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
SELECT SALARY
FROM dbo.Worker L
WHERE 5 = (
	SELECT  COUNT (DISTINCT SALARY)
	FROM dbo.Worker R
	WHERE R.SALARY >= L.SALARY
)

--Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
SELECT w1.*
FROM dbo.Worker w1
JOIN dbo.Worker w2
ON w1.SALARY = w2.SALARY
WHERE w1.WORKER_ID <> w2.WORKER_ID

--Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
SELECT TOP 1 SALARY
FROM (
	SELECT DISTINCT TOP 2 SALARY FROM dbo.Worker ORDER BY SALARY DESC
) as result
ORDER BY SALARY ASC

SELECT MAX(SALARY)
FROM dbo.Worker
WHERE SALARY NOT IN (
	SELECT MAX(SALARY) FROM dbo.Worker
)

--Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
SELECT * FROM dbo.Worker
UNION ALL
SELECT * FROM dbo.Worker

--Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
SELECT * FROM dbo.Worker
INTERSECT
SELECT * FROM dbo.Worker_Clone

--Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
SELECT TOP 50 PERCENT *
FROM dbo.Worker

SELECT * FROM dbo.Worker
WHERE WORKER_ID <= (
	SELECT COUNT(WORKER_ID) / 2 FROM dbo.Worker
)

--Q-40. Write An SQL Query To Fetch The Departments That Have Less Than Four People In It.
SELECT DEPARTMENT, COUNT(WORKER_ID) NoOfPeople
FROM dbo.Worker
GROUP BY DEPARTMENT
HAVING COUNT(DEPARTMENT) < 4

--Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
SELECT DEPARTMENT, COUNT(WORKER_ID) NoOfPeople
FROM dbo.Worker
GROUP BY DEPARTMENT

--Q-42. Write An SQL Query To Show The Last Record From A Table.
SELECT TOP 1 * FROM dbo.Worker ORDER BY WORKER_ID DESC

SELECT *
FROM dbo.Worker
WHERE WORKER_ID = (
	SELECT MAX(WORKER_ID) FROM dbo.Worker
)

--Q-43. Write An SQL Query To Fetch The First Row Of A Table.
SELECT TOP 1 * FROM dbo.Worker ORDER BY WORKER_ID ASC

SELECT *
FROM dbo.Worker
WHERE WORKER_ID = (
	SELECT MIN(WORKER_ID) FROM dbo.Worker
)

--Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
SELECT TOP 5 *
FROM dbo.Worker
ORDER BY WORKER_ID DESC

--Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
SELECT FIRST_NAME, DEPARTMENT, SALARY
FROM
(
	SELECT *,
	DENSE_RANK() OVER(partition by DEPARTMENT order by SALARY desc) salaryorder
	FROM dbo.Worker
) as result
WHERE salaryorder = 1

SELECT FIRST_NAME, w1.DEPARTMENT, SALARY
FROM dbo.Worker w1
JOIN (SELECT DEPARTMENT, MAX(SALARY) maxsalary FROM dbo.Worker GROUP BY DEPARTMENT) as w2
ON w1.DEPARTMENT = w2.DEPARTMENT
AND w1.SALARY = W2.maxsalary

--Write An SQL Query To Fetch Three Max Salaries From A Table.
SELECT DISTINCT TOP 3 SALARY
FROM dbo.Worker
ORDER BY SALARY DESC

SELECT DISTINCT SALARY 
FROM dbo.Worker a 
WHERE 3 >= (
	SELECT COUNT(DISTINCT SALARY) 
	FROM dbo.Worker b 
	WHERE a.SALARY <= b.SALARY
) 
ORDER BY a.SALARY DESC

--Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
SELECT DISTINCT TOP 3 SALARY
FROM dbo.Worker
ORDER BY SALARY ASC

SELECT DISTINCT SALARY 
FROM dbo.Worker a 
WHERE 3 >= (
	SELECT COUNT(DISTINCT SALARY) 
	FROM dbo.Worker b 
	WHERE a.SALARY >= b.SALARY
) 
ORDER BY a.SALARY ASC

--Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
DECLARE @n INT = 4

SELECT DISTINCT SALARY 
FROM dbo.Worker a 
WHERE @n >= (
	SELECT COUNT(DISTINCT SALARY) 
	FROM dbo.Worker b 
	WHERE a.SALARY <= b.SALARY
) 
ORDER BY a.SALARY DESC

--Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
SELECT DEPARTMENT, SUM(SALARY) Total_Salary_Paid
FROM dbo.Worker
GROUP BY DEPARTMENT

--Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
SELECT FIRST_NAME, SALARY
FROM dbo.Worker WHERE SALARY = (
	SELECT MAX(SALARY) FROM dbo.Worker
)


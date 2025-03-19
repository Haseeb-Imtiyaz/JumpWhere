CREATE DATABASE JUMPWHERE;
USE JUMPWHERE;

CREATE TABLE DEPT(
DEPTNO CHAR(2) PRIMARY KEY,
DNAME VARCHAR(15),
LOC VARCHAR(15));

CREATE TABLE EMP(
EMPNO CHAR(4) PRIMARY KEY,
ENAME VARCHAR(15),
SAL INT,
HIRE_DATE DATE,
COMMISSION INT,
DEPTNO CHAR(2) REFERENCES DEPT(DEPTNO),
MGR CHAR(4) REFERENCES EMP(EMPNO));

INSERT INTO Dept (DeptNo, Dname, Loc) VALUES
(10, 'Accounts', 'Bangalore'),
(20, 'IT', 'Delhi'),
(30, 'Production', 'Chennai'),
(40, 'Sales', 'Hyd'),
(50, 'Admn', 'London');

INSERT INTO Emp (EmpNo, Ename, Sal, Hire_Date, Commission, DeptNo, Mgr) VALUES
(1001, 'Sachin', 19000, '1980-01-01', 2100, 20, 1003),
(1002, 'Kapil', 15000, '1970-01-01', 2300, 10, 1003),
(1003, 'Stefen', 12000, '1990-01-01', 500, 20, 1007),
(1004, 'Williams', 9000, '2001-01-01', NULL, 30, 1007),
(1005, 'John', 5000, '2005-01-01', NULL, 30, 1006),
(1006, 'Dravid', 19000, '1985-01-01', 2400, 10, 1007),
(1007, 'Martin', 21000, '2000-01-01', 1040, NULL, NULL);

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 1) Select employee details  of dept number 10 or 30

SELECT * 
FROM EMP E1
INNER JOIN DEPT E2
ON E1.DEPTNO=E2.DEPTNO
WHERE E1.DEPTNO IN ('10','30');

-- 2) Write a query to fetch all the dept details with more than 1 Employee.

SELECT E1.DeptNo,D.LOC, D.Dname, COUNT(E1.DeptNo) AS DeptCount
FROM Emp E1
INNER JOIN Dept D 
ON E1.DeptNo = D.DeptNo
GROUP BY E1.DeptNo, D.Dname,D.LOC
HAVING COUNT(E1.DeptNo) > 1;

-- 3) Write a query to fetch employee details whose name starts with the letter “S”

SELECT * 
FROM EMP E1
INNER JOIN DEPT E2
ON E1.DEPTNO=E2.DEPTNO
WHERE E1.ENAME LIKE 'S%';

-- 4) Select Emp Details Whose experience is more than 2 years

SELECT *, YEAR(GETDATE())-YEAR(E1.HIRE_DATE) AS 'EXP'
FROM EMP E1
INNER JOIN DEPT E2
ON E1.DEPTNO=E2.DEPTNO
WHERE YEAR(GETDATE())-YEAR(E1.HIRE_DATE)>2;

-- 5) Write a SELECT statement to replace the char “a” with “#” in Employee Name ( Ex:  Sachin as S#chin)

SELECT REPLACE(Ename, 'A', '#')
FROM Emp
WHERE Ename = 'SACHIN';

-- 6) Write a query to fetch employee name and his/her manager name. 

SELECT ENAME, MGR 
FROM EMP;

-- 7) Fetch Dept Name , Total Salry of the Dept

SELECT DEPT.DNAME, SUM(EMP.SAL) AS 'DEPT SALARY'
FROM EMP
INNER JOIN DEPT
ON EMP.DEPTNO=DEPT.DEPTNO
GROUP BY DEPT.DNAME;

-- 8) Write a query to fetch ALL the  employee details along with department name, department location, irrespective of employee existance in the department.

SELECT *
FROM Dept D
FULL JOIN Emp E 
ON D.DeptNo = E.DeptNo;

-- 9) Write an update statement to increase the employee salary by 10 %

UPDATE EMP
SET SAL=SAL+SAL*0.10

SELECT SAL
FROM EMP;

-- 10) Write a statement to delete employees belong to Chennai location.

DELETE FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='CHENNAI');

-- 11) Get Employee Name and gross salary (sal + comission).

SELECT ENAME, SAL,SAL+COMMISSION AS 'GROSS SALARY'
FROM EMP;

-- 12) Increase the data length of the column Ename of Emp table from  100 to 250 using ALTER statement.

ALTER TABLE EMP
ALTER COLUMN ENAME VARCHAR(250);

-- 13) Write query to get current datetime.

SELECT GETDATE();

--14) Write a statement to create STUDENT table, with related 5 columns.

CREATE TABLE STUDENT(
USN CHAR(10) PRIMARY KEY,
NAME VARCHAR(20),
COLLEGE VARCHAR(50),
ADDRESS VARCHAR(50),
SEM INT);

-- 15)  Write a query to fetch number of employees in who is getting salary more than 10000

SELECT EMPNO FROM EMP
WHERE SAL>10000;

-- 16) Write a query to fetch minimum salary, maximum salary and average salary from emp table.

SELECT MIN(SAL) AS 'MIN SAL', MAX(SAL) AS 'MAX SAL',AVG(SAL) AS 'AVG SAL' FROM EMP;

-- 17) Write a query to fetch number of employees in each location

SELECT D.LOC,COUNT(E.EMPNO) AS 'NO OF EMPLOYEE'
FROM EMP E
INNER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY D.LOC;

-- 18) Write a query to display emplyee names in descending order

SELECT ENAME FROM EMP
ORDER BY ENAME DESC;

-- 19) Write a statement to create a new table(EMP_BKP) from the existing EMP table 

SELECT * INTO EMP_BKP FROM EMP;

-- 20)  Write a query to fetch first 3 characters from employee name appended with salary.

SELECT ENAME,LEFT(ENAME,3) AS '3 CHARS',SAL,
CONCAT(LEFT(ENAME,3),SAL)
FROM EMP;

-- 21)  Get the details of the employees whose name starts with S

SELECT * FROM EMP
WHERE ENAME LIKE 'S%';

-- 22)  Get the details of the employees who works in Bangalore location

SELECT * FROM EMP E
INNER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE LOC='BANGALORE';

-- 23)  Write the query to get the employee details whose name started within any letter between  A and K

SELECT * FROM EMP 
WHERE Ename LIKE '[A-K]%';

-- 24) Write a query in SQL to display the employees whose manager name is Stefen

SELECT * FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME='STEFEN');

-- 25) Write a query in SQL to list the name of the managers who is having maximum number of employees working under him

SELECT TOP 2 E1.Ename AS 'Name', E1.EmpNo AS 'ID', COUNT(E1.EmpNo) AS 'Count'
FROM EMP E1
JOIN EMP E2 ON E1.EmpNo = E2.Mgr
GROUP BY E1.Ename, E1.EmpNo
ORDER BY Count DESC;

-- 26) Write a query to display the employee details, department details and the manager details of the employee who has second highest salary

SELECT * FROM EMP E
INNER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP));

-- 27) Write a query to list all details of all the managers

SELECT * FROM EMP E
LEFT JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE E.EMPNO IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

-- 28) Write a query to list the details and total experience of all the managers

SELECT *, YEAR(GETDATE())-YEAR(E.HIRE_DATE) AS 'EXP'
FROM EMP E
INNER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO;


-- 29) Write a query to list the employees who is manager and  takes commission less than 1000 and works in Delhi

SELECT * FROM EMP E
SELECT * FROM DEPT

SELECT * FROM EMP 
WHERE DEPTNO =(SELECT DEPTNO FROM DEPT WHERE LOC ='DELHI') AND COMMISSION<1000;

-- 30) Write a query to display the details of employees who are senior to Martin.

SELECT *,YEAR(GETDATE())-YEAR(HIRE_DATE) AS 'EXP' FROM EMP WHERE
YEAR(GETDATE())-YEAR(HIRE_DATE)>(SELECT YEAR(GETDATE())-YEAR(HIRE_DATE) FROM EMP WHERE ENAME='MARTIN');

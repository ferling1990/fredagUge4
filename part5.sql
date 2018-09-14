use mydb;
drop view IF EXISTS EmployeesZipHigherThan60000;
drop view if exists EmployeesEnoEname;
drop view if exists EmployeesNoOfOrders;

CREATE VIEW EmployeesZipHigherThan60000
AS  
SELECT eno, ename, zip, hdate
FROM employees
WHERE zip > '60000';

CREATE VIEW EmployeesEnoEname
AS  
SELECT eno, ename
FROM employees
;

CREATE VIEW EmployeesNoOfOrders
AS  
SELECT employees.eno, ename, COUNT(orders.eno) as number_of_deals
FROM employees
LEFT JOIN orders
ON(employees.eno=orders.eno) 
group by
	employees.eno, employees.ename
order by
	employees.eno
	
DESC;

--Who earns more than the overall average salary?

SELECT empFirst, empLast, empSalary
FROM EMPLOYEE
WHERE empSalary > (SELECT AVG(empSalary) FROM EMPLOYEE);

SELECT AVG(empSalary) FROM EMPLOYEE;


--For each department, show its budget, number of employees, and total employee salaries.

SELECT deptName, deptBudget, COUNT(*) AS 'NUMBER OF EMPLOYEES', SUM(empSalary) AS 'Total Paid'
FROM DEPARTMENT
	INNER JOIN EMPLOYEE ON DEPARTMENT.deptCode = EMPLOYEE.deptCode
WHERE deptBudget >= 200000
GROUP BY deptName, deptBudget
HAVING SUM(empSalary) < deptBudget;


SELECT DEPARTMENT.*, EMPLOYEE.*
FROM DEPARTMENT
	INNER JOIN EMPLOYEE ON DEPARTMENT.deptCode = EMPLOYEE.deptCode
	ORDER BY DEPARTMENT.deptCode;

	--having; to iput group results in a cmd line
	--its in the order select,where,group,having



--Show which departments have a total employee salary greater than $200,000. You
--can put the total salary in the output, too.

SELECT deptName, SUM(empSalary) AS 'Total Salary'
FROM DEPARTMENT
	INNER JOIN EMPLOYEE ON DEPARTMENT.deptCode = EMPLOYEE.deptCode
GROUP BY deptName
HAVING SUM(empSalary) > 200000;

 SELECT * FROM DEPARTMENT;
  SELECT * FROM EMPLOYEE;
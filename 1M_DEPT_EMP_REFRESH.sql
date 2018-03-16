IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
	DROP TABLE [dbo].[EMPLOYEE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEPARTMENT]') AND type in (N'U'))
	DROP TABLE [dbo].[DEPARTMENT]
GO

CREATE TABLE DEPARTMENT

(deptCode     CHAR(4),
 deptName     VARCHAR(30),
 deptBudget   DECIMAL(9,2),

 CONSTRAINT pk_department_deptCode PRIMARY KEY(deptCode)
);

INSERT INTO DEPARTMENT VALUES ('ACCT','Accounting',200000);
INSERT INTO DEPARTMENT VALUES ('ISYS','Information systems',500000);
INSERT INTO DEPARTMENT VALUES ('MKTG','Marketing',170000);
INSERT INTO DEPARTMENT VALUES ('PERS','Personnel',80000);

CREATE TABLE EMPLOYEE
(empNo		        INT IDENTITY,
 empFirst	        VARCHAR(25),
 empLast	        VARCHAR(30),
 empTitle	        VARCHAR(25),
 empSalary	      	DECIMAL(8,2),
 empStart	        DATE,
 deptCode	        CHAR(4)		NOT NULL,

 CONSTRAINT pk_employee_empNo PRIMARY KEY(empNo),
 CONSTRAINT fk_department_employee FOREIGN KEY (deptCode) REFERENCES department(deptCode)
);

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Marsha','Bonavoochi','Gopher',59000,'1991/6/6', 'ACCT');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Linda','Rootaroni','Analyst',75000,'1989/10/2', 'ISYS');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Dave','Kendollini','Programmer',47000,'1981/11/3', 'ISYS');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Roberto','Acostaletti','Manager',85000,'1995/9/6', 'ACCT');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Dini','Cappelletti','Admin Assistant',50500,'1990/7/9', 'ACCT');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Cliffy','Patti','Technician',46000,'1984/1/1', 'ISYS');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Peter','Vanscollini','Manager',60000,'1996/9/10', 'MKTG');

INSERT INTO EMPLOYEE (empFirst, empLast, empTitle, empSalary, empStart, deptCode)
VALUES ('Davide','Stovellana','Programmer',100001,'1990/10/9', 'ISYS');
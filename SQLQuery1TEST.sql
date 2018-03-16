SELECT custFirstName + ' ' + custLastName AS 'custFullName', custStreetAddress, custPostalCode
FROM CUSTOMER
--INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev 
WHERE custCity IN ('Brookings','Manitoba')
ORDER BY CUSTOMER.provAbbrev, 'custFullName';


SELECT custCity
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
CUSTOMER.provAbbrev = 'MB'
ORDER BY custCity DESC;


SELECT custFirstName + ' ' + custLastName AS 'custFullName'
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome = (SELECT MIN(custIncome) FROM CUSTOMER);


SELECT custFirstName + ' ' + custLastName AS 'custFullName'
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome = (SELECT MAX(custIncome) FROM CUSTOMER);

SELECT COUNT(*) AS '#Below AVG Income'
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome <
(SELECT AVG(custIncome) FROM CUSTOMER);

SELECT custFirstName + ' ' + custLastName AS 'custFullName', custIncome
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome > 150000
ORDER BY custIncome ASC;

SELECT custFirstName + ' ' + custLastName AS 'custFullName', custIncome
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome < 175000
ORDER BY custIncome DESC;


SELECT custFirstName + ' ' + custLastName AS 'custFullName', custIncome
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE
custIncome BETWEEN '150000' AND '175000'
ORDER BY custIncome DESC;


SELECT custFirstName + ' ' + custLastName AS 'custFullName', custIncome, custIncome - 25000 AS 'disposable income'
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
WHERE CUSTOMER.provAbbrev =  'ON' 
AND custIncome - 25000 BETWEEN 150000 AND 175000
ORDER BY custIncome - 25000 DESC;


SELECT divName, provName
FROM DIVISION
INNER JOIN PROVINCE ON DIVISION.divID = PROVINCE.divID
ORDER BY divName, provName;



SELECT divID, COUNT(divID) AS 'Number Of Province' 
FROM PROVINCE
GROUP BY divID ;


SELECT divName, COUNT(PROVINCE.divID) AS 'NUMBER OF PROVINCE'
FROM DIVISION
INNER JOIN PROVINCE ON DIVISION.divID = PROVINCE.divID
GROUP BY divName;



SELECT CUSTOMER.provAbbrev, provName, SUM(custIncome) AS 'Total Income'
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
GROUP BY provName, CUSTOMER.provAbbrev;


SELECT divName, provName, COUNT(*) AS 'numCustomers'
FROM DIVISION
INNER JOIN PROVINCE ON DIVISION.divID = PROVINCE.divID
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
GROUP BY divName, provName
ORDER BY divName, COUNT(*) ASC;



SELECT custLastName, COUNT(*) AS 'Number with same Last name'
FROM CUSTOMER
GROUP BY custLastName
HAVING COUNT(custLastName) > 2; 


SELECT provAbbrev, custCity, COUNT(*) AS counting
FROM CUSTOMER
GROUP BY provAbbrev, custCity
HAVING COUNT(custCity) > 1;


SELECT provName, COUNT(*) AS Counters
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
GROUP BY provName
HAVING COUNT(custID) >=  20;


SELECT provName, COUNT(*) AS Counters
FROM PROVINCE
INNER JOIN CUSTOMER ON PROVINCE.provAbbrev = CUSTOMER.provAbbrev
GROUP BY provName
HAVING COUNT(custID) >=  20;

SELECT * FROM CUSTOMER
WHERE custLastName IN ('Brown', 'Pitts');

SELECT * FROM CUSTOMER
WHERE custLastName IN (SELECT custLastName FROM CUSTOMER GROUP BY custLastName HAVING COUNT(*) > 20);


UPDATE CUSTOMER
SET custLastName = 'Brown'
WHERE custFirstName = 'Isabelle' AND custLastName = 'Meyers' AND custPostalCode = 'E9G3Y0';



UPDATE DIVISION
SET divName = 'Mountain'
WHERE divID = 'W';


UPDATE PROVINCE 
SET divID = 'C'
WHERE provAbbrev = 'QC';


DELETE FROM CUSTOMER
WHERE custFirstName = 'Miranda' AND custLastName = 'Booker' AND custPostalCode = 'K7T8V6'


DELETE FROM CUSTOMER
WHERE custCity IN ('El Paso', 'Alberta') AND provAbbrev = 'AB';

DELETE FROM CUSTOMER
WHERE custID = '41ce6008-c377-4c47-8501-c49ef04ed526';



SELECT * FROM  CUSTOMER;
SELECT * FROM DIVISION;
SELECT * FROM PROVINCE;
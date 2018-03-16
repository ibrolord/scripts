

-- GROUP BY PROVINCE

SELECT provAbbrev, count(*)
FROM SAMPLE_CUSTOMER
GROUP BY provAbbrev;

-- GROUP BY age

SELECT STR(YEAR(GETDATE()) - YEAR(custDOB)) + ' Years old' as 'Age', count(*) as 'Number of Customers'
from SAMPLE_CUSTOMER
GROUP BY YEAR(GETDATE()) - YEAR(custDOB);

-- GROUP BY province and birth year for customers born after 1990

SELECT provAbbrev, YEAR(custDOB) as 'Year', count(*) as 'Number of Customers'
from SAMPLE_CUSTOMER
where YEAR(custDOB) > 1990
GROUP BY provAbbrev, YEAR(custDOB)
having count(*) > 1;


-- 

SELECT count(*) as 'Number of Customers'
from SAMPLE_CUSTOMER
where YEAR(GETDATE()) - YEAR(custDOB) < 19
having count(*) > 1;
--QUERY 1

SELECT * FROM WINE
ORDER BY wineYear asc, winePrice desc;


--QUERY 2

SELECT wineName, wineHarvest, wineCaseProduction
FROM WINE
WHERE 
	wineHarvest LIKE '2007-%-%';

--QUERY 3	

SELECT wineName
FROM WINE
WHERE 
	wineDesc LIKE '%plum%' OR wineDesc LIKE '%jam%'
	ORDER BY wineName;

--QUERY 4
SELECT SUM(wineCaseProduction) AS TotalCaseProduction FROM WINE
WHERE wineName LIKE '%Pinot Noir%';

--QUERY 5
SELECT AVG(winePHLevel) AS 'Average PH Level', AVG(wineAcidity_gl) AS 'Average Acidity/gl'
FROM WINE
WHERE wineHarvest BETWEEN '2008-09-1' AND '2009-10-29'; 
	

--QUERY 6
SELECT wineName, DATEDIFF(dd, '2010-01-29', GETDATE()) AS '# Days since Harvest'
FROM WINE
WHERE wineName LIKE '%icewine%'
	AND wineYear = 2009;

--QUERY 7
SELECT wineName, winePrice, wineAlcohol
FROM WINE
WHERE wineSugar_gl = (SELECT MAX(wineSugar_gl) FROM WINE);

--QUERY 8
UPDATE WINE
	SET winePrice = winePrice * .85
	WHERE wineYear BETWEEN '2005' AND '2006'; 

--QUERY 9
INSERT INTO WINE(wineID, wineName, wineYear, winePrice, wineHarvest) 
VALUES ('23', 'Vidal Icewine', '2013', '33.50', '2013-01-29');

--To deleteb a row
DELETE FROM WINE 
WHERe wineID = 23;
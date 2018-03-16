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
	
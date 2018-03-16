SELECT * FROM WINE_TYPE;
select * from wine;
--QUEST 1

SELECT wtName, wineName, wineYear, winePrice
FROM WINE_TYPE
	INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
	ORDER BY WINE.wtCode, wineName  ;
	-- OR ORDER BY WINE ON wtCode = WINE.wtCode


--Quest 2


SELECT wtName, wtLeadFirst + ' ' + wtLeadLast AS 'Lead Maker', SUM(wineCaseProduction) AS 'Total Production', AVG(winePrice) AS 'Average Price'
FROM WINE_TYPE
	INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
	WHERE WINE_TYPE.wtCode = 'R'
	GROUP BY wtLeadFirst, wtLeadLast, wtName ;

-- QUEST 3

SELECT wineName
FROM WINE 
WHERE
 wineYear = '2009'
AND winePrice = (SELECT MIN(winePrice) FROM WINE WHERE wineYear = 2009);

-- QUEST 4

SELECT wtName
FROM WINE_TYPE
INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
WHERE
	wineAcidity_gl BETWEEN 5 AND 7
	GROUP BY wtName;

-- QUEST 5

SELECT wtName, wtLeadFirst + ' ' + wtLeadLast AS 'Lead', wineID, wineName, wineAlcohol, wineSugar_gl, wineAcidity_gl
FROM WINE_TYPE
INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
ORDER BY wtLeadLast, wtLeadFirst;


-- QUEST 6

SELECT wtLeadFirst + ' ' + wtLeadLast  AS 'Lead', COUNT(*) AS 'Number of Malolactic Wines'
FROM WINE_TYPE
INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
WHERE 
	wineIsMaloLactic = 1
	GROUP BY wtLeadFirst, wtLeadLast
	HAVING COUNT(WINE.wtCode) >= 5
	 ;


-- QUEST 7

UPDATE WINE
	SET winePrice = winePrice + '.50'
	FROM WINE_TYPE
	INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
	WHERE wtLeadLast = 'McPhee' 
	AND wtLeadFirst = 'Amanda';


-- QUEST 8



DECLARE @money money = (SELECT AVG(winePrice) FROM WINE_TYPE
	INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
	WHERE WINE_TYPE.wtCode = 'R');

SELECT wtName, wtLeadFirst + ' ' + wtLeadLast AS 'Lead Maker', SUM(wineCaseProduction) AS 'Total Production', FORMAT ( @money, 'C' ) AS 'Average Price'
FROM WINE_TYPE
	INNER JOIN WINE ON WINE_TYPE.wtCode = WINE.wtCode
	WHERE WINE_TYPE.wtCode = 'R'
	GROUP BY wtLeadFirst, wtLeadLast, wtName ;
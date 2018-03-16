 --	JOIN

 --Women who are not mothers (USING a [LEFT] Outer JOIN)
 SELECT DISTINCT MOTHER.persFName, mother.persLName, child.motherID
 FROM PERSON AS MOTHER 
 LEFT OUTER JOIN PERSON AS CHILD ON CHILD.motherID = MOTHER.persID
 WHERE MOTHER.persGender = 'F' AND CHILD.motherID IS NULL;


 --Women who ARE mothers IN method
 SELECT * FROM  PERSON
 WHERE persGender = 'F'
 AND persID IN (SELECT DISTINCT motherID FROM PERSON WHERE motherID IS NOT NULL);

 --Women who are NOT mothers IN method
 SELECT * FROM PERSON
 WHERE persGender = 'F'
 AND persID NOT IN (SELECT DISTINCT motherID FROM PERSON WHERE motherID IS NOT NULL);


 -- EXISTS
 SELECT * FROM PERSON AS MOTHER
 WHERE EXISTS (SELECT * FROM PERSON WHERE motherID = MOTHER.persID);


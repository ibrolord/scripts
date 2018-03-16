--Put your CREATE STATEMENTS HERE

CREATE TABLE PERSON(

	persID INT IDENTITY (1,1),
	persFName VARCHAR(30) NOT NULL,
	persLName VARCHAR(30) NOT NULL,
	persDOB DATE,
	motherID INT,
	fatherID INT,
	persDOD DATE,
	persGender CHAR(1),

	CONSTRAINT pk_PERSON_persID PRIMARY KEY(persID),
	CONSTRAINT fk_PERSON_MOTHERIDFATHERID FOREIGN KEY (motherID) REFERENCES PERSON(persID),
	CONSTRAINT fk_PERSON_FATHERIDMOTHERID FOREIGN KEY (fatherID) REFERENCES PERSON(persID)
);


CREATE TABLE COUPLE(
	coupleID INT IDENTITY(1,1),
	alphaSpouse INT NOT NULL,
	omegaSpouse INT NOT NULL,
	coupleStart DATE NOT NULL,
	coupleEnd DATE,

	CONSTRAINT pk_COUPLE_coupleID PRIMARY KEY(coupleID),
	CONSTRAINT fk_COUPLE_ALPHAOMEGASPOUSE FOREIGN KEY (alphaSpouse) REFERENCES PERSON(persID),
	CONSTRAINT fk_COUPLE_OMEGAALPHASPOUSE FOREIGN KEY (omegaSpouse) REFERENCES PERSON(persID)


);

select * from couple


--Show all of the details about fathers

			
--Show all of the details about men who are/were not fathers			


--Output each father and mother and all of their children
--Order the output by mother last and first name, then by child DOB


--Display the name and age of couples in which both spouses are now deceased


--Which alpha spouses have been in more than one relationship?

--BONUS
DROP TABLE COUPLE ;
--EXAMPLE DIFFERENCE
/*
SELECT DISTINCT FATHER.*
FROM PERSON AS FATHER
RIGHT JOIN PERSON ON FATHER.persID = PERSON.fatherID
WHERE FATHER.fatherID IS NOT NULL
	AND FATHER.persGender = 'M';
 */


 SELECT DISTINCT FATHER.*
FROM PERSON AS FATHER
LEFT JOIN PERSON ON FATHER.persID = PERSON.fatherID
WHERE FATHER.fatherID IS NOT NULL
	AND FATHER.persGender = 'M';
 
	--2


SELECT DISTINCT FATHER.*
FROM PERSON AS FATHER
LEFT JOIN PERSON AS NOTAFATHER ON FATHER.persID = NOTAFATHER.fatherID
WHERE
	FATHER.fatherID IS NULL
	AND FATHER.persGender = 'M';  


--3 


  SELECT FATHER.persFName + ' ' + FATHER.persLName AS 'FATHER', MOTHER.persFName + ' ' + MOTHER.persLName AS 'MOTHER', CHILD.persFName + ' ' + CHILD.persLName AS 'CHILD'
 FROM PERSON AS FATHER 
 LEFT OUTER JOIN PERSON AS CHILD ON CHILD.fatherID = FATHER.persID
 LEFT OUTER JOIN PERSON AS MOTHER ON CHILD.motherID = MOTHER.persID
  WHERE FATHER.persGender = 'M' AND CHILD.motherID IS NOT NULL
  ORDER BY  MOTHER.persLName, MOTHER.persFName, CHILD.persDOB;



  -- 4
  SELECT man.persFName + ' ' + man.persLName AS 'Alpha_Spouse', DATEDIFF(year, man.persDOB, man.persDOD) AS 'Alpha_Spouse_Years_Lived', woman.persFName + ' ' + woman.persLName AS 'Omega_Spouse', DATEDIFF(year, woman.persDOB, woman.persDOD) AS 'Omega_Spouse_Years_Lived'
  FROM COUPLE
  	 JOIN PERSON AS man ON COUPLE.alphaspouse = man.persID
	 JOIN PERSON AS woman ON COUPLE.omegaspouse = woman.persID
	WHERE man.persDOD IS NOT NULL
	AND woman.persDOD IS NOT NULL;

	  /*SELECT *
  FROM PERSON
  	LEFT OUTER JOIN COUPLE ON PERSON.persID = COUPLE.alphaspouse
	LEFT OUTER JOIN COUPLE ON PERSON.persID = COUPLE.omegaspouse
	WHERE persDOD IS NOT NULL;
*/

 --5
 SELECT * FROM COUPLE;
 SELECT * FROM PERSON;
 SELECT man.persFName, man.persLName, count(*) AS 'Number_Of_Relationships'
FROM COUPLE
  	 JOIN PERSON AS man ON COUPLE.alphaspouse = man.persID
	 WHERE coupleEnd IS NOT NULL
	 ORDER BY man.persFName;
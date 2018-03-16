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
	FATHER.fatherID IS NOT NULL
	AND FATHER.persGender = 'M';  

















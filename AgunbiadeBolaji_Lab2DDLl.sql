create table WINE_TYPE
(
	wtCode CHAR(1),
	wtName VARCHAR(20),
	wtLeadFirst VARCHAR(25),
	wtLeadLast VARCHAR(30),
	wtServeTemp DECIMAL(3,1),

	constraint pk_WINE_TYPE_wtCode primary key(wtCode)

);

CREATE TABLE WINE
(
	wineID					INT,
	wineName				VARCHAR(75),
	wineYear				CHAR(4),
	winePrice				DECIMAL(5,2),
	wineDesc				VARCHAR(255),
	wineHarvest				DATE,
	wineAlcohol				DECIMAL(5,2),
	wineSugar_gl			DECIMAL(5,2),	
	wineAcidity_gl			DECIMAL(3,2),
	winePHLevel				DECIMAL(3,2),
	wineIsMaloLactic		BIT,
	wineCaseProduction		SMALLINT,
	wtCode					CHAR(1) NOT NULL,
	
	CONSTRAINT pk_wine_wineID	PRIMARY KEY(wineID),
	constraint fk_wine_type_wine FOREIGN KEY(wtCode) references wine_type(wtCode)
);

select * from WINE_TYPE;

insert into WINE values (
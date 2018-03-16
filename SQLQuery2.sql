create table CITY
(
	cityID INT IDENTITY,
	cityName VARCHAR(50),
	cityPop INT,
	stateID CHAR(4) NOT NULL,

	constraint pk_city_cityID primary key (cityID),
	constraint fk_state_city foreign key (stateID) references state(stateID)

);

insert into city (cityName, cityPop, stateID) values ('Toronto', 2481494, 'CA08');
insert into city (cityName, cityPop, stateID) values ('Ottawa', 812129, 'CA08');
insert into city (cityName, cityPop, stateID) values ('Vancouver', 5780541,'CA02');
insert into city (cityName, cityPop, stateID) values ('Victoria', 78057, 'CA02');
insert into city (cityName, cityPop, stateID) values ('Buffalo', 292649, 'US36');
insert into city (cityName, cityPop, stateID) values ('Albany', 94172, 'US36');
insert into city (cityName, cityPop, stateID) values ('Toronto',NULL, 'US18');

select * from CITY;
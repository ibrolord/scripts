create table STATE
(
	stateID char(4),
	stateName varchar(50),
	nationID char(2) NOT NULL,

	constraint pk_state_stateID primary key(stateID),
	constraint fk_nation_state foreign key(nationID) references NATION(nationID)

);


insert into STATE values ('CA08', 'Ontario', 'CA');
insert into STATE values ('CA02', 'Ottawa', 'CA');
insert into STATE values ('US36', 'New York', 'US');
insert into STATE values ('US18', 'Indiana', 'US');


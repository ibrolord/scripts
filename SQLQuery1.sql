create table NATION
(
	nationID char(2),
	nationName varchar(30),

	Constraint pk_nation_nationID primary key (nationID)

);

INSERT into nation values ('CA', 'Canada');
insert into nation values ('US', 'United States');

select * from NATION;
	
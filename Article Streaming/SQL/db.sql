DROP TABLE Article_Fact;
DROP TABLE Time_DIM;
DROP TABLE Date_DIM;

CREATE TABLE Time_DIM (
	timeID int primary key,
	time varchar,
	hour int,
	minute int
);

CREATE TABLE Date_DIM(
	dateID integer primary key,
	full_date varchar(20),
	dd integer,
	mm integer,
	yy integer
);

Create TABLE Article_FACT (
	dateID int,
	timeID int,
	title varchar(500),
	url varchar(100),
	comp_sentiment float(5,4),
	CONSTRAINT FK_dimtime FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);
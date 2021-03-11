DROP TABLE Article_Fact;
DROP TABLE sentiment_dim;
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
	comp_sentiment numeric(5,4),
	CONSTRAINT FK_dimtime FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);

Create TABLE Articles_FACT (
	id serial primary key,
	dateID int,
	timeID int,
	title varchar(500),
	url varchar(100),
	comp_sentiment numeric(5,4),
	CONSTRAINT FK_dimtime FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);

CREATE TABLE Sentiment_DIM (
	dateID int,
	timeID int,
	trading_symbol varchar(10),
	comp_sentiment numeric(5,4),
	CONSTRAINT FK_dimtime_sent FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate_sent FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);

CREATE SEQUENCE sent_seq START 0;


SELECT setval('sent_seq', (SELECT max(id) FROM your_table));

CREATE TABLE Sentiment_Fact (
	id integer primary key nextval('sent_seq'),
	dateID int,
	timeID int,
	trading_symbol varchar(10),
	comp_sentiment numeric(5,4),
	CONSTRAINT FK_dimtime_sent FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate_sent FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);

CREATE TABLE news_articles (
	desc varchar(500),
	news varchar(500),
	img varchar(500),
	url varchar(500),
);

CREATE TABLE MA_sentiment_dim (
	id serial primary key,
	dateID int,
	timeID int,
	trading_symbol varchar(10),
	comp_sentiment numeric(5,4),
	sma numeric(5,4),
	ema numeric(5,4),
	CONSTRAINT FK_dimtime_sent FOREIGN KEY (timeID) REFERENCES Time_DIM(timeID),
	CONSTRAINT FK_dimdate_sent FOREIGN KEY (dateID) REFERENCES Date_DIM(dateID)
);

DROP VIEW ma_view;
CREATE VIEW ma_view AS
SELECT  dateid, timeid, trading_symbol, AVG(comp_sentiment)::numeric(5,4) AS "comp_sentiment", AVG(sma)::numeric(5,4) AS "sma", AVG(ema)::numeric(5,4) AS "ema" FROM ma_sentiment_dim
GROUP BY (dateid, timeid, trading_symbol)
ORDER BY (dateid, timeid);

------ Not necessary --------------
DROP TABLE ma_tmp;
CREATE TABLE ma_tmp AS SELECT * FROM ma_view;

DROP SEQUENCE ma_seq;
CREATE SEQUENCE ma_seq START 1;

ALTER TABLE ma_tmp
ADD ID int;

UPDATE ma_tmp
SET id = nextval('ma_seq');

CREATE TABLE ma_sentiment_dim AS SELECT * FROM ma_tmp;
-------------------------------------


CREATE OR REPLACE VIEW sentiment_score AS
SELECT full_date, time, trading_symbol, comp_sentiment FROM sentiment_fact
JOIN time_dim ON time_dim.timeid = sentiment_fact.timeid
JOIN date_dim ON date_dim.dateid = sentiment_fact.dateid;

---- Unique values in sentiument table ----------
CREATE VIEW sent_fact AS
SELECT dateid, timeid, trading_symbol, avg(comp_sentiment)::numeric(5,4) FROM sentiment_dim
GROUP BY (timeid, dateid, trading_symbol)
ORDER BY (timeid, dateid);

CREATE TABLE sentiment_fact AS SELECT * FROM sent_fact ORDER BY (dateid, timeid);

DROP SEQUENCE sent_seq;
CREATE SEQUENCE sent_seq START 1;
SELECT nextval('sent_seq')

ALTER TABLE sentiment_fact
ADD ID int;

UPDATE sentiment_fact
SET id = nextval('sent_seq')

SELECT  full_date, time, comp_sentiment FROM sentiment_fact


------- Unique Value for ma tbale -------
CREATE VIEW ma_tmp AS
SELECT dateid, timeid, trading_symbol, avg(comp_sentiment)::numeric(5,4) AS "comp_sentiment", avg(sma)::numeric(5,4) AS "sma", avg(ema)::numeric(5,4) AS "ema" 
FROM ma_sentiment_dim
GROUP BY (timeid, dateid, trading_symbol)
ORDER BY (dateid, timeid);

DROP TABLE ma_temp_dim;
CREATE TABLE ma_temp_dim AS SELECT dateid, timeid, trading_symbol, comp_sentiment, sma, ema FROM ma_tmp ORDER BY (dateid, timeid);


DROP TABLE ma_sentiment_dim CASCADE;
DROP SEQUENCE ma_sent_seq;
CREATE SEQUENCE ma_sent_seq START 1;
CREATE TABLE ma_sentiment_dim AS SELECT * FROM ma_temp_dim;

DROP SEQUENCE ma_sent_seq;
CREATE SEQUENCE ma_sent_seq START 1;

ALTER TABLE ma_sentiment_dim
ADD ID int;
ALTER TABLE ma_sentiment_dim ALTER COLUMN id SET DEFAULT nextval('ma_sent_seq');
UPDATE ma_sentiment_dim
SET id = nextval('ma_sent_seq');
----- Create View --------

DROP VIEW sent_view;
CREATE VIEW sent_view AS
SELECT  id AS "sentid", (TO_DATE(full_date, 'DD/MM/YYY')||' '||time)::timestamp, sma AS "comp_sentiment" FROM ma_sentiment_dim
JOIN date_dim ON date_dim.dateid = ma_sentiment_dim.dateid
JOIN time_dim ON time_dim.timeid = ma_sentiment_dim.timeid
ORDER BY (timestamp);


CREATE VIEW sent_values AS
SELECT  id AS "sentid", (TO_DATE(full_date, 'DD/MM/YYY')||' '||time)::timestamp, comp_sentiment, sma, ema FROM ma_sentiment_dim
JOIN date_dim ON date_dim.dateid = ma_sentiment_dim.dateid
JOIN time_dim ON time_dim.timeid = ma_sentiment_dim.timeid
ORDER BY (timestamp);


----- Fixing ma_dim -----------
DELETE FROM ma_sentiment_dim WHERE dateid > 66 AND timeid > 720;

CREATE TABLE tmp_ma AS SELECT dateid, timeid, trading_symbol, comp_sentiment, sma, ema FROM ma_sentiment_dim;
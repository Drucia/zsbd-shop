CREATE SEQUENCE seq_EXECUTIONTIME;
CREATE SEQUENCE seq_QUERYTOEXEC;

CREATE TABLE EXECUTIONTIME (
EXECUTIONTIMEID   	number(10) GENERATED AS IDENTITY,
START 			timestamp,
END				timestamp,
queryid			number(10) NOT NULL, 
PRIMARY KEY (EXECUTIONTIMEID));

CREATE TABLE QUERYTOEXEC (
QUERYID			number(10) GENERATED AS IDENTITY,
name				varchar2(10),
PRIMARY KEY (QUERYID));
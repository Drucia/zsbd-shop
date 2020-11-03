CREATE SEQUENCE seq_EXECUTIONTIME;
CREATE SEQUENCE seq_QUERYTOEXEC;

CREATE TABLE EXECUTIONTIME (
EXECUTIONTIMEID number(10) GENERATED AS IDENTITY,
STARTQuery timestamp,
ENDQuery timestamp,
queryid number(10) NOT NULL, 
PRIMARY KEY (EXECUTIONTIMEID));

CREATE TABLE QUERYTOEXEC (
QUERYID			number(10) GENERATED AS IDENTITY,
nameQuery		varchar2(70),
PRIMARY KEY (QUERYID));

INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Nowa gra');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Usunięcie niepopularnych produktów');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Podbicie ceny popularnych produktów');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Koszt zamówienia po rabacie');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Blokada klienta');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Popyt na najpopularniejszych produktów z podziałem na kraje');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Obniżenie ceny słabo ocenianego oraz rzadko kupowanego');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Najrzadziej wykorzystywany typ płatności');
INSERT INTO QUERYTOEXEC (nameQuery) VALUES ('Jaki kolor konsol jest najpopularniejszy');
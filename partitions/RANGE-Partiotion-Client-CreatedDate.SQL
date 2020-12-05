CREATE TABLE Client (
  ClientID      number(10) GENERATED AS IDENTITY, 
  Name          varchar2(25) NOT NULL, 
  Surname       varchar2(50), 
  Login         varchar2(25) NOT NULL, 
  Password      varchar2(50) NOT NULL, 
  NIP           varchar2(10), 
  CompanyName   varchar2(50), 
  Blocked       number(1) NOT NULL, 
  AccountNumber varchar2(26) UNIQUE, 
  Email         varchar2(50) NOT NULL UNIQUE, 
  AddressID     number(10) NOT NULL UNIQUE, 
  CreatedDate   timestamp NOT NULL, 
  LockDate      timestamp, 
  PRIMARY KEY (ClientID))
  PARTITION BY RANGE (CreatedDate) (
    PARTITION p0 VALUES LESS THAN (TIMESTAMP '2020-06-05 00:00:00.000000'),
    PARTITION pmax VALUES LESS THAN (MAXVALUE)
);
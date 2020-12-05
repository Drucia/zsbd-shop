CREATE TABLE Review (
  ReviewID   number(10) GENERATED AS IDENTITY, 
  Content    varchar2(3078) NOT NULL, 
  CreateDate timestamp NOT NULL, 
  Title      varchar2(255) NOT NULL, 
  ImageLink  varchar2(255), 
  Bought     number(1) NOT NULL, 
  Score      number(2) NOT NULL, 
  ClientID   number(10) NOT NULL, 
  ProductID  number(10) NOT NULL, 
  PRIMARY KEY (ReviewID))
  PARTITION BY HASH (ReviewID)
   PARTITIONS 4;
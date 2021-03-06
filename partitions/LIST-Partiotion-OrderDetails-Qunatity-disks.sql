Create Tablespace ssd
datafile 'd:\\oracle\\ssd-order-details.dbf'
size 100M autoextend on next 10M

--drop Tablespace ssd

Create Tablespace hdd
datafile 'e:\\oracle\\hdd-order-details.dbf'
size 100M autoextend on next 10M

--drop Tablespace hdd

CREATE TABLE OrderDetails (
  OrderDetailsID number(10) GENERATED AS IDENTITY, 
  Quantity       number(10) NOT NULL, 
  OrderID        number(10) NOT NULL UNIQUE, 
  ProductID      number(10) NOT NULL, 
  PRIMARY KEY (OrderDetailsID))
  PARTITION BY LIST (Quantity)
      (PARTITION low VALUES (1, 2, 3),
      (PARTITION medium VALUES (4, 5, 6),
      (PARTITION high VALUES (7, 8),
      (PARTITION top VALUES (9, 10)
      STORE IN (ssd, hdd, hdd, ssd);
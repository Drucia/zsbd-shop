CREATE TABLE OrderDetails (
  OrderDetailsID number(10) GENERATED AS IDENTITY, 
  Quantity       number(10) NOT NULL, 
  OrderID        number(10) NOT NULL UNIQUE, 
  ProductID      number(10) NOT NULL, 
  PRIMARY KEY (OrderDetailsID))
  PARTITION BY LIST (Quantity)
      (PARTITION q1_northwest VALUES (1),;
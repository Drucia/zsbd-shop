CREATE TABLE "ORDER" (
  OrderID        number(10) GENERATED AS IDENTITY, 
  SubmissionDate timestamp NOT NULL, 
  ReceiptDate    timestamp, 
  Paid           number(1) NOT NULL, 
  ShippingDate   timestamp, 
  DeliveryDate   timestamp, 
  PaymentID      number(10), 
  AddressID      number(10), 
  ClientID       number(10) NOT NULL, 
  OrderStatusID  number(10) NOT NULL, 
  PRIMARY KEY (OrderID))
  PARTITION BY RANGE (SubmissionDate) (
    PARTITION p0 VALUES LESS THAN (TIMESTAMP '2020-02-05 00:00:00.000000'),
    PARTITION pmax VALUES LESS THAN (MAXVALUE)
);
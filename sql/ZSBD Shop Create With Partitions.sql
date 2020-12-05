CREATE TABLE City (
  CityID number(10) GENERATED AS IDENTITY, 
  Name   varchar2(255), 
  PRIMARY KEY (CityID));
  
CREATE TABLE Country (
  CountryID number(10) GENERATED AS IDENTITY, 
  Name      varchar2(255), 
  PRIMARY KEY (CountryID));
  
CREATE TABLE District (
  DistritID number(10) GENERATED AS IDENTITY, 
  Name      varchar2(255), 
  PRIMARY KEY (DistritID));
  
CREATE TABLE Address (
  AddressID       number(10) GENERATED AS IDENTITY, 
  PostCode        varchar2(255), 
  HouseNumber     number(10) NOT NULL, 
  ApartmentNumber number(10), 
  CityID          number(10) NOT NULL, 
  CountryID       number(10) NOT NULL, 
  DistrictID      number(10) NOT NULL, 
  PRIMARY KEY (AddressID));
  
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
    PARTITION p0 VALUES LESS THAN (add_months(currentdate, -2)),
    PARTITION p1 VALUES LESS THAN MAXVALUE
);
  
CREATE TABLE Color (
  ColorID number(10) GENERATED AS IDENTITY, 
  Color   varchar2(20) NOT NULL, 
  PRIMARY KEY (ColorID));
  
CREATE TABLE ConsoleProducer (
  ConsoleProducerID number(10) GENERATED AS IDENTITY, 
  ConsoleProdName   varchar2(255) NOT NULL, 
  PRIMARY KEY (ConsoleProducerID));
  
CREATE TABLE MonitorProducer (
  MonitorProducerID number(10) GENERATED AS IDENTITY, 
  MonitorProdName   varchar2(255) NOT NULL, 
  PRIMARY KEY (MonitorProducerID));
  
CREATE TABLE GameGenre (
  GameGenreID number(10) GENERATED AS IDENTITY, 
  Genre       varchar2(255) NOT NULL, 
  PRIMARY KEY (GameGenreID));
  
CREATE TABLE ProductType (
  ProductTypeID number(10) GENERATED AS IDENTITY, 
  Type          varchar2(255) NOT NULL, 
  PRIMARY KEY (ProductTypeID));
  
CREATE TABLE Product (
  ProductID          number(10) GENERATED AS IDENTITY, 
  CurrentPrice       float(10) NOT NULL, 
  LastModified       timestamp NOT NULL, 
  ImageLink          varchar2(255) NOT NULL, 
  Description        varchar2(1024) NOT NULL, 
  WarrantyPeriod     number(2) NOT NULL, 
  Name               varchar2(255) NOT NULL, 
  ResolutionH        number(5), 
  ResolutionW        number(5), 
  RefreshRate        number(4), 
  "Size"             number(3), 
  Curved             number(1), 
  DiskSpace          number(5), 
  ControllerIncluded number(1), 
  PhisycalDrive      number(1), 
  Multiplayer        number(1), 
  MonitorProducerID  number(10), 
  ColorID            number(10), 
  GameGenreID        number(10), 
  ConsoleProducerID  number(10), 
  ProductTypeID      number(10), 
  PRIMARY KEY (ProductID));
  
CREATE TABLE TypeOfPayment (
  TypeOfPaymentID number(10) GENERATED AS IDENTITY, 
  Type            varchar2(25) NOT NULL, 
  PRIMARY KEY (TypeOfPaymentID));
  
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
  PARTITION BY HASH (ProductID)
  PARTITIONS 4;
  
CREATE TABLE OrderStatus (
  OrderStatusID number(10) GENERATED AS IDENTITY, 
  Status        varchar2(20) NOT NULL, 
  PRIMARY KEY (OrderStatusID));
  
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
    PARTITION p0 VALUES LESS THAN (6),
    PARTITION p1 VALUES LESS THAN (11),
    PARTITION p2 VALUES LESS THAN (16),
    PARTITION p3 VALUES LESS THAN (21)
);
  
CREATE TABLE OrderDetails (
  OrderDetailsID number(10) GENERATED AS IDENTITY, 
  Quantity       number(10) NOT NULL, 
  OrderID        number(10) NOT NULL UNIQUE, 
  ProductID      number(10) NOT NULL, 
  PRIMARY KEY (OrderDetailsID));
  
CREATE TABLE Payment (
  PaymentID       number(10) GENERATED AS IDENTITY, 
  Cost            float(10) NOT NULL, 
  AccountNumber   varchar2(26), 
  Confirmed       number(1) NOT NULL, 
  ExecutionDate   timestamp, 
  TypeOfPaymentID number(10) NOT NULL, 
  PRIMARY KEY (PaymentID));
  
CREATE TABLE Invoice (
  InvoiceID     number(10) GENERATED AS IDENTITY, 
  CreateDate    timestamp, 
  VAT           number(10) NOT NULL, 
  BankName      varchar2(100), 
  PaymentID     number(10) NOT NULL, 
  PRIMARY KEY (InvoiceID));
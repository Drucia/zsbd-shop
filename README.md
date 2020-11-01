# zsbd-shop  
Aleksandra Druciak

Aleksander Gerasimuk

Tomasz Demczuk

## Konfiguracja bazy danych

W pliku sql/Configuration.sql znajduje się przykładowa konfiguracja bazy danych dzięki, której można tworzyć tabele dla konkretnego użytkownika.

*Plik `Configuration.sql`:*

```sql
alter session set "_ORACLE_SCRIPT"=true;  

-- USER SQL

CREATE USER "OWNER" IDENTIFIED BY "szbd"  ;

-- QUOTAS

-- ROLES

-- SYSTEM PRIVILEGES
GRANT SELECT ANY TABLE TO "OWNER" ;
GRANT CREATE TABLE TO "OWNER" ;
GRANT DROP ANY TABLE TO "OWNER" ;
GRANT ALTER USER TO "OWNER" ;
GRANT UPDATE ANY TABLE TO "OWNER" ;
GRANT DROP USER TO "OWNER" ;
GRANT INSERT ANY TABLE TO "OWNER" ;
GRANT CREATE ANY TABLE TO "OWNER" ;

ALTER USER OWNER quota unlimited on USERS;

alter session set current_schema = owner; 
```

## Wypełnienie bazy danych

Aby utworzyć schemat oraz wypełnić go danymi postępuj zgodnie z następującymi krokami:

### Utworzenie schematu

W pliku sql/ZSBD Shop Create.sql znajdują się wszystkie niezbędne komendy do utworzenia schematu bazy.

*Wycinek `ZSBD Shop Create.sql`:*

```sql
CREATE SEQUENCE seq_Address;
CREATE SEQUENCE seq_City;
CREATE SEQUENCE seq_Client;
CREATE SEQUENCE seq_Color;
CREATE SEQUENCE seq_ConsoleProducer;
CREATE SEQUENCE seq_Country;
CREATE SEQUENCE seq_District;
CREATE SEQUENCE seq_GameGenre;
CREATE SEQUENCE seq_Invoice;
CREATE SEQUENCE seq_MonitorProducer;
CREATE SEQUENCE seq_Order;
CREATE SEQUENCE seq_OrderDetails;
CREATE SEQUENCE seq_OrderStatus;
CREATE SEQUENCE seq_Payment;
CREATE SEQUENCE seq_Product;
CREATE SEQUENCE seq_ProductType;
CREATE SEQUENCE seq_Review;
CREATE SEQUENCE seq_TypeOfPayment;

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
```

### Wypełnienie danymi

Pliki z wszystkimi "insertami" znajdują się w sql/inserts/all jeżeli nie chcesz wykonywać wszystkich operacji na raz, można po kolei wykonywać inserty z forlderu sql/inserts.
*Niezbędne jest jednak wstawienie obiektów w kolejności Order -> OrderDetails -> Payment -> Invoice*

*Wycinek `Produkct.sql`:*

``` sql
-- Product - 6348

INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (420.8,'2019-02-16 08:38:02','http://dummyimage.com/115x136.jpg/5fa2dd/ffffff','In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',5,'Superman II',0,3,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,ResolutionH,ResolutionW,RefreshRate,"Size",Curved,MonitorProducerID,ColorID,ProductTypeID) VALUES (4667.77,'2015-01-13 09:52:25','http://dummyimage.com/234x142.bmp/ff4444/ffffff','Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',30,'Princess and the Pirate, The',864,3840,240,33.4,0,5,NULL,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (787.27,'2017-01-02 18:20:25','http://dummyimage.com/108x122.png/dddddd/000000','Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',6,'Giants and Toys (Kyojin to gangu)',0,10,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (971.96,'2019-05-16 09:24:14','http://dummyimage.com/212x140.bmp/dddddd/000000','Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',63,'Drona',0,13,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (977.92,'2020-07-08 16:26:26','http://dummyimage.com/108x236.png/dddddd/000000','Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',55,'Tai-Pan',1,11,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (349.18,'2017-02-15 08:45:35','http://dummyimage.com/157x180.bmp/dddddd/000000','Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',15,'Violent Years, The',0,3,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (413.14,'2019-10-23 16:55:34','http://dummyimage.com/103x175.jpg/ff4444/ffffff','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',7,'Princess Protection Program',0,9,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (61.69,'2018-09-22 18:22:47','http://dummyimage.com/236x164.png/5fa2dd/ffffff','Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',35,'Cabin in the Sky',0,3,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (65.54,'2020-09-09 06:42:07','http://dummyimage.com/248x109.bmp/dddddd/000000','Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',91,'Daddy Day Camp',0,10,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (399.01,'2017-06-15 12:00:00','http://dummyimage.com/180x172.png/cc0000/ffffff','Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.',18,'Addicted to Love',0,11,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (998.06,'2015-08-11 13:30:53','http://dummyimage.com/202x210.png/ff4444/ffffff','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',64,'Ogre, The (Unhold, Der)',0,1,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,ResolutionH,ResolutionW,RefreshRate,"Size",Curved,MonitorProducerID,ColorID,ProductTypeID) VALUES (4702.52,'2018-09-10 05:49:14','http://dummyimage.com/168x217.bmp/5fa2dd/ffffff','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.',26,'Operation Endgame',1080,2048,75,22.0,1,27,NULL,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (352.79,'2016-05-05 15:53:07','http://dummyimage.com/211x227.jpg/dddddd/000000','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',26,'That Darn Cat',1,2,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (897.79,'2019-01-19 13:02:07','http://dummyimage.com/131x168.jpg/5fa2dd/ffffff','Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.',59,'Million Dollar Hotel, The',0,10,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (743.15,'2016-05-02 22:26:56','http://dummyimage.com/158x197.png/5fa2dd/ffffff','Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.',4,'Rebellion (L''ordre et la morale)',1,1,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,DiskSpace,ControllerIncluded,PhisycalDrive,ColorID,ConsoleProducerID,ProductTypeID) VALUES (1084.58,'2015-12-17 19:54:07','http://dummyimage.com/216x138.bmp/dddddd/000000','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.',33,'Italian Job, The',256,1,0,NULL,29,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,ResolutionH,ResolutionW,RefreshRate,"Size",Curved,MonitorProducerID,ColorID,ProductTypeID) VALUES (2783.73,'2019-03-05 15:49:44','http://dummyimage.com/231x244.jpg/5fa2dd/ffffff','Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',33,'Shiro Amakusa, the Christian Rebel (Amakusa Shiro tokisada)',2160,2560,240,35.4,0,2,NULL,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,ResolutionH,ResolutionW,RefreshRate,"Size",Curved,MonitorProducerID,ColorID,ProductTypeID) VALUES (882.85,'2016-03-21 09:16:01','http://dummyimage.com/120x140.bmp/cc0000/ffffff','Aliquam erat volutpat.',31,'Generation Iron',1152,2048,60,37.1,0,26,NULL,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (269.23,'2019-04-19 14:11:12','http://dummyimage.com/122x121.bmp/cc0000/ffffff','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',18,'Barbie in the Nutcracker',0,10,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,ResolutionH,ResolutionW,RefreshRate,"Size",Curved,MonitorProducerID,ColorID,ProductTypeID) VALUES (4676.56,'2017-02-24 05:14:49','http://dummyimage.com/179x214.jpg/5fa2dd/ffffff','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',26,'Big Ass Spider!',1152,1360,240,25.9,1,26,NULL,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (581.33,'2015-04-14 04:00:03','http://dummyimage.com/115x214.png/5fa2dd/ffffff','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',52,'Walk on the Wild Side',0,4,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (416.15,'2015-02-11 11:23:17','http://dummyimage.com/138x166.bmp/5fa2dd/ffffff','Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.',83,'Every Which Way But Loose',0,7,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (341.62,'2019-10-02 15:26:41','http://dummyimage.com/101x185.bmp/5fa2dd/ffffff','Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',25,'Oh Happy Day',0,8,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (176.93,'2016-02-20 00:27:11','http://dummyimage.com/136x111.png/5fa2dd/ffffff','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.',53,'Wolves',1,4,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (571.22,'2016-09-14 01:19:39','http://dummyimage.com/147x113.bmp/5fa2dd/ffffff','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',54,'Mr. Turner',1,11,3);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (833.73,'2016-02-16 20:51:47','http://dummyimage.com/230x160.jpg/dddddd/000000','Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',98,'Doulos, Le',1,7,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (709.31,'2019-05-07 10:37:03','http://dummyimage.com/171x250.jpg/cc0000/ffffff','Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',63,'Attack of the 50 Foot Woman',0,12,1);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (214.08,'2016-11-15 16:38:52','http://dummyimage.com/139x165.png/dddddd/000000','Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',14,'Reprise',0,11,2);
INSERT INTO Product(CurrentPrice,LastModified,ImageLink,Description,WarrantyPeriod,Name,Multiplayer,GameGenreID,ProductTypeID) VALUES (617.16,'2017-06-30 11:30:06','http://dummyimage.com/137x182.bmp/ff4444/ffffff','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',1,'Rage in Heaven',1,4,2);

```

### Dodanie constraintów

Aby wszystkie klucze obce były powiązane z odpowiednimi tabelami należy wykonać update utworzonych tabel i nadać im ograniczenia. Plik z ograniczeniami znajduje się w sql/Constrints.sql.

*`Constrints.sql`:*

``` sql
ALTER TABLE Address ADD CONSTRAINT FKAddressCityID FOREIGN KEY (CityID) REFERENCES City (CityID);
ALTER TABLE Address ADD CONSTRAINT FKAddressCountryID FOREIGN KEY (CountryID) REFERENCES Country (CountryID);
ALTER TABLE Address ADD CONSTRAINT FKAddressDistrictID FOREIGN KEY (DistrictID) REFERENCES District (DistritID);
ALTER TABLE Product ADD CONSTRAINT FKProductMonitorProducerID FOREIGN KEY (MonitorProducerID) REFERENCES MonitorProducer (MonitorProducerID);
ALTER TABLE Product ADD CONSTRAINT FKProductGameGenreID FOREIGN KEY (GameGenreID) REFERENCES GameGenre (GameGenreID);
ALTER TABLE Product ADD CONSTRAINT FKProductConsoleProducerID FOREIGN KEY (ConsoleProducerID) REFERENCES ConsoleProducer (ConsoleProducerID);
ALTER TABLE Product ADD CONSTRAINT FKProductColorID FOREIGN KEY (ColorID) REFERENCES Color (ColorID);
ALTER TABLE Product ADD CONSTRAINT FKProductProductTypeID FOREIGN KEY (ProductTypeID) REFERENCES ProductType (ProductTypeID);
ALTER TABLE Client ADD CONSTRAINT FKClientAddressID FOREIGN KEY (AddressID) REFERENCES Address (AddressID);
ALTER TABLE Review ADD CONSTRAINT FKReviewClientID FOREIGN KEY (ClientID) REFERENCES Client (ClientID);
ALTER TABLE Review ADD CONSTRAINT FKReviewProductID FOREIGN KEY (ProductID) REFERENCES Product (ProductID);
ALTER TABLE Payment ADD CONSTRAINT FKPaymentTypeOfPaymentID FOREIGN KEY (TypeOfPaymentID) REFERENCES TypeOfPayment (TypeOfPaymentID);
ALTER TABLE "ORDER" ADD CONSTRAINT FKOrderAddressID FOREIGN KEY (AddressID) REFERENCES Address (AddressID);
ALTER TABLE "ORDER" ADD CONSTRAINT FKOrderClientID FOREIGN KEY (ClientID) REFERENCES Client (ClientID);
ALTER TABLE "ORDER" ADD CONSTRAINT FKOrderOrderStatusID FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus (OrderStatusID);
ALTER TABLE OrderDetails ADD CONSTRAINT FKOrderDetaiOrderID FOREIGN KEY (OrderID) REFERENCES "ORDER" (OrderID);
ALTER TABLE OrderDetails ADD CONSTRAINT FKOrderDetaiProductID FOREIGN KEY (ProductID) REFERENCES Product (ProductID);
ALTER TABLE Invoice ADD CONSTRAINT FKInvoicePaymentID FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID);
ALTER TABLE "ORDER" ADD CONSTRAINT FKOrderPaymentID FOREIGN KEY (PaymentID) REFERENCES Payment (PaymentID);
```

Po wykonaniu tych wszystkich kroków baza danych powinna być gotowa.

## Usuwanie bazy

Jeżeli chcesz usunąć wszystkie dane z bazy należy wykonać polecenia z pliku sql/ZSBD Shop Drop.sql.

*Wycinek `ZSBD Shop Drop.sql`:*

``` sql
DROP TABLE Address CASCADE CONSTRAINTS;
DROP TABLE City CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Color CASCADE CONSTRAINTS;
DROP TABLE ConsoleProducer CASCADE CONSTRAINTS;
DROP TABLE Country CASCADE CONSTRAINTS;
DROP TABLE District CASCADE CONSTRAINTS;
DROP TABLE GameGenre CASCADE CONSTRAINTS;
DROP TABLE Invoice CASCADE CONSTRAINTS;
DROP TABLE MonitorProducer CASCADE CONSTRAINTS;
DROP TABLE "ORDER" CASCADE CONSTRAINTS;
DROP TABLE OrderDetails CASCADE CONSTRAINTS;
DROP TABLE OrderStatus CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE ProductType CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE TypeOfPayment CASCADE CONSTRAINTS;
```

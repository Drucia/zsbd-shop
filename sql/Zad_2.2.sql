INSERT INTO "SYSTEM"."CITY" ( NAME) VALUES ( 'Kamienna Gora');
INSERT INTO "SYSTEM"."COUNTRY" ( NAME) VALUES ( 'POLSKA');
INSERT INTO "SYSTEM"."DISTRICT" ( NAME) VALUES ( 'Dolny ');
INSERT INTO "SYSTEM"."COLOR" ( COLOR) VALUES ( 'niebieski');
INSERT INTO "SYSTEM"."GAMEGENRE" ( genre) VALUES ( 'RPG');
INSERT INTO "SYSTEM"."CONSOLEPRODUCER" ( consoleprodname) VALUES ( 'Microsoft');
INSERT INTO "SYSTEM"."PRODUCTTYPE" ( type) VALUES ( 'CONSOLE');
INSERT INTO "SYSTEM"."PRODUCTTYPE" ( type) VALUES ( 'GAME');
INSERT INTO "SYSTEM"."PRODUCTTYPE" ( type) VALUES ( 'MONITOR');
INSERT INTO "SYSTEM"."MONITORPRODUCERS" ( monitorprodname) VALUES ( 'AOC');
INSERT INTO "SYSTEM"."ADDRESS" ( POSTCODE, HOUSENUMBER, CITYID, COUNTRYID, DISTRICTID) VALUES ( '58-400', '27','1', '1', '1');
INSERT INTO "SYSTEM"."CLIENT" (  name, surname, login, password, blocked, accountnumber, email, addressid, createddate) VALUES ( 'Jan', 'Kowalski', 'JanK', '1234', 0, '12345678912345678900123456', 'Jan@email.pl', 1, CURRENT_DATE);
-- konsola
INSERT INTO product (  currentprice, lastmodified, imagelink, description, warrantyperiod, name, diskspace, controllerincluded, phisycaldrive, addeddate, colorid, consoleproducerid, producttypeid )VALUES ( 65, CURRENT_DATE, 'http://dummyimage.com/152x144.jpg/dddddd/000000', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 13, 'PlayStation 34', 500, 0, 1, CURRENT_DATE, 1, 1, 1 );
-- gra
INSERT INTO product (  currentprice, lastmodified, imagelink, description, warrantyperiod, name, addeddate, gamegenreid, producttypeid )VALUES ( 65, CURRENT_DATE, 'http://dummyimage.com/152x144.jpg/dddddd/000000', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud', 1, 'Cyberpunk 2077', CURRENT_DATE, 1, 2 );
-- monitor
INSERT INTO product (  currentprice, lastmodified, imagelink, description, warrantyperiod, name, resolutionh, resolutionw, refreshrate, "Size", curved, addeddate, monitorproducerid, colorid, producttypeid ) VALUES ( 4565, CURRENT_DATE, 'http://dummyimage.com/152x144.jpg/dddddd/000000', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 12, 'AOC 4k', 1234, 4321, 154, 65, 1, CURRENT_DATE, 1, 1, 3 );
INSERT INTO "SYSTEM"."ORDERSTATUS" ( STATUS) VALUES ( 'ongoing');
INSERT INTO "SYSTEM"."Order" ( SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ( TO_DATE('2020-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),  '1', '1', '1',   '1');
INSERT INTO "SYSTEM"."Order" ( SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ( TO_DATE('2020-09-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1', '1',   '1');
INSERT INTO "SYSTEM"."Order" ( SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ( TO_DATE('2020-10-17 19:49:46', 'YYYY-MM-DD HH24:MI:SS'),  '1', '1', '1',  '1');
INSERT INTO "SYSTEM"."Order" ( SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ( TO_DATE('2020-10-17 19:49:46', 'YYYY-MM-DD HH24:MI:SS'),    '1', '1', '1','1');
INSERT INTO "SYSTEM"."ORDERDETAILS" ( QUANTITY, PRODUCTID, ORDERID) VALUES ( '10',  '1',  '1');
INSERT INTO "SYSTEM"."ORDERDETAILS" ( QUANTITY, PRODUCTID, ORDERID) VALUES ( '4', '1', '2');
INSERT INTO "SYSTEM"."ORDERDETAILS" ( QUANTITY, PRODUCTID, ORDERID) VALUES ( '11', '2', '3');
INSERT INTO "SYSTEM"."ORDERDETAILS" ( QUANTITY, PRODUCTID, ORDERID) VALUES ( '7', '3', '4');

-- ________  .__           ________   
-- \_____  \ |  | _____    \______ \  
--  /   |   \|  | \__  \    |    |  \ 
-- /    |    \  |__/ __ \_  |    `   \
-- \_______  /____(____  / /_______  /
--         \/          \/          \/ 

-- select
-- przeszukaj zamówienia i znajdz jaki produkt jest najbardziej pozadany, wybierz najbardziej pozadane produkty i sprawdz skad sa klienci, ktorzy je zamawiaja,
-- wypisz jaki produkt kupiono najczesciej, ile razy i skad
-- mozna jako parametr wybrać n porządanych produktow, ograniczyć do konkretnych krajow

-- relacja na wyjsciu
-- product.productid | product.name | "Sum of quantity" | client.clientid | country.name

select res.productid, (select p.name from system.product p where p.productid = res.productid) "Product name",
res."Sum of quantity", res.clientid, (select c.name from system.country c where c.countryid = a.countryid) "Country"
from (
select od.productid, sum(od.quantity) "Sum of quantity", o.clientid
from system.orderdetails od join system."Order" o on od.orderid = o.orderid
where od.productid in 
(select pid
from
( 
select p.productid pid, sum(od.quantity) sumofquantity-- uporzadkuj malejaco po ilosci zamawiane produkty
from system.orderdetails od join system.product p on od.productid = p.productid
group by p.productid
order by sum(od.quantity) DESC
)
where sumofquantity = ( -- wybierz tylko najbardziej pozadane produkty (do poprawki)
select max(sum(od.quantity))
from system.orderdetails od join system.product p on od.productid = p.productid
group by p.productid
)) -- wez max ilosc
group by o.clientid, od.productid) res left join system.address a on res.clientid = a.addressid;

-- UPDATE
-- znajdz produkty, ktorych srednia ocen jest mniejsza niz 2.0 oraz jezeli dany produkt byl kupiony mniej niz 100 razy pomniejsz jego cene o 10%
-- parametrem moze byc procent o jaki sie pomniejsza, srenia i ile razy kupiono dany produkt
           
update system.product
set currentprice = currentprice*0.9
where productid in (
select p.productid
from system.review r join system.product p on p.productid = r.productid
group by p.productid
having avg(r.score) < 2.0 and p.productid in (
select p.productid
from system.orderdetails od join system.product p on p.productid = od.productid
group by p.productid
having sum(od.quantity) < 100
));


-- ________                     __    
-- \__  __/____   _____   ____ |  | __
--   |  | /  _ \ /     \_/ __ \|  |/ /
--   |  |(  <_> )  Y Y  \  ___/|    < 
--   |__| \____/|__|_|  /\___  >__|_ \
--                    \/     \/     \/

-- Zwiększenie ceny 10 najchętniej kupowanych produktów w ostatnim miesiącu jeżeli ocena tego produktu to jest równa bądź większa niż 4

-- Usunięcie produktu, który nie sprzedał się od pół roku lub ma ocenę poniżej 2 majac więcej niż 40 wystawionych recenzji od użytkowników istniejących dłużej niż 2 miesiące

-- Wstawienie nowej gry i ustalenie jej ceny na podstawie średniej ocen innych gier z tego samego gatunku

-- ________  .__             ________ 
-- \_____  \ |  | _____     /  _____/ 
--  /   |   \|  | \__  \   /   \  ___ 
-- /    |    \  |__/ __ \_ \    \_\  \
-- \_______  /____(____  /  \______  /
--         \/          \/          \/ 


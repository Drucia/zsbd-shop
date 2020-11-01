-- SELECT 1
-- przeszukaj zamówienia i znajdz jaki produkt jest najbardziej porzadany, wybierz 2 najbardzije porzadane produkty i sprawdz skad sa klienci, ktorzy je zamawiaja, wypisz jaki produkt kupiono najczesciej, ile razy i skad

INSERT INTO "SYSTEM"."CLIENT" (CLIENTID, NAME, SURNAME, LOGIN, PASSWORD, BLOCKED, EMAIL, ADDRESSID) VALUES ('1', 'aleksandra', 'druciak', 'druciak', 'nananan', '0', 'ola@email', '1');
INSERT INTO "SYSTEM"."CITY" (CITYID, NAME) VALUES ('1', 'Kamienna Gora');
INSERT INTO "SYSTEM"."COUNTRY" (COUNTRYID, NAME) VALUES ('1', 'POLSKA');
INSERT INTO "SYSTEM"."DISTRICT" (DISTRITID, NAME) VALUES ('1', 'Dolny ');
INSERT INTO "SYSTEM"."COLOR" (COLORID, COLOR) VALUES ('1', 'niebieski');
INSERT INTO "SYSTEM"."PRODUCT" (PRODUCTID, NAME, CURRENTPRICE, LASTMODIFIDED, PHOTOLINK, DESCRIPTION, PRODUCENT, WARRANTYPERIOD, COLORID) VALUES ('1', 'Pilka', '10.0', '10-12-2020', 'eewrwe', 'were', 'werew', '4', '1');
INSERT INTO "SYSTEM"."PRODUCT" (PRODUCTID, NAME, CURRENTPRICE, LASTMODIFIDED, PHOTOLINK, DESCRIPTION, PRODUCENT, WARRANTYPERIOD, COLORID) VALUES ('2', 'Ksiazka', '5', '11-12-2020', 'fdg', 'dsfg', 'sfg', '1', '1');
INSERT INTO "SYSTEM"."PRODUCT" (PRODUCTID, NAME, CURRENTPRICE, LASTMODIFIDED, PHOTOLINK, DESCRIPTION, PRODUCENT, WARRANTYPERIOD, COLORID) VALUES ('3', 'Zegar', '45', '09-09-2020', 'fdsg', 'sdfg', 'fsg', '3', '1');
INSERT INTO "SYSTEM"."ORDERSTATUS" (ORDERSTATUSID, STATUS) VALUES ('1', 'ongoing');
INSERT INTO "SYSTEM"."ADDRESS" (ADDRESSID, POSTCODE, HOUSENUMBER, CITYID, COUNTRYID, DISTRICTID) VALUES ('1', '58-400', '27', '1', '1', '1');
INSERT INTO "SYSTEM"."Order" (ORDERID, SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ('1', TO_DATE('2020-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1', '1', '1');
INSERT INTO "SYSTEM"."Order" (ORDERID, SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ('2', TO_DATE('2020-09-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', '1', '1', '1');
INSERT INTO "SYSTEM"."Order" (ORDERID, SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ('3', TO_DATE('2020-10-17 19:49:46', 'YYYY-MM-DD HH24:MI:SS'), '1', '1', '1', '1');
INSERT INTO "SYSTEM"."Order" (ORDERID, SUBMISSIONDATE, PAID, ADDRESSID, CLIENTID, ORDERSTATUSID) VALUES ('4', TO_DATE('2020-10-17 19:49:46', 'YYYY-MM-DD HH24:MI:SS'), '1', '1', '1', '1');
INSERT INTO "SYSTEM"."ORDERDETAILS" (ORDERDETAILSID, QUANTITY, PRODUCTID, ORDERID) VALUES ('1', '10', '1', '1');
INSERT INTO "SYSTEM"."ORDERDETAILS" (ORDERDETAILSID, QUANTITY, PRODUCTID, ORDERID) VALUES ('2', '4', '1', '2');
INSERT INTO "SYSTEM"."ORDERDETAILS" (ORDERDETAILSID, QUANTITY, PRODUCTID, ORDERID) VALUES ('3', '11', '2', '3');
INSERT INTO "SYSTEM"."ORDERDETAILS" (ORDERDETAILSID, QUANTITY, PRODUCTID, ORDERID) VALUES ('4', '7', '3', '4');

-- przeszukaj zamówienia i znajdz jaki produkt jest najbardziej pozadany, wybierz najbardziej pozadane produkty i sprawdz skad sa klienci, ktorzy je zamawiaja,
-- wypisz jaki produkt kupiono najczesciej, ile razy i skad
-- mozna jako parametr wybrać n porządanych produktow, ograniczyć do konkretnych krajow

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
where sumofquantity = ( -- wybierz tylko najbardziej pozadane produkty
select max(sum(od.quantity))
from system.orderdetails od join system.product p on od.productid = p.productid
group by p.productid
)) -- wez max ilosc
group by o.clientid, od.productid) res left join system.address a on res.clientid = a.addressid;

-- UPDATE
-- znajdz produkty, ktorych srednia ocen jest mniejsza niz 2.0 oraz jezeli dany produkt byl kupiony mniej niz 10 razy pomniejsz jego cene o 10%
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



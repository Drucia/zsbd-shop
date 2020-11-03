alter session set current_schema = druciak; 

-- wybierz najczesciej zamawiane produkty, posortuj je po liczbie, sredniej ocen i liczbie oplaconych transakcji

select p.productid, sum(od.quantity) "Liczba zamowien" , case when avg(r.score) is null then 0 else avg(r.score) end "Srednia ocen", sum((
select count(*)
from payment
where paymentid = o.paymentid
)) / count(o.orderid) "Procent oplaconych zamowien"
from orderdetails od join product p on od.productid = p.productid left join review r on p.productid = r.productid
join "ORDER" o on od.orderid = o.orderid
group by p.productid
order by sum(od.quantity) DESC, (sum((
select count(*)
from payment
where paymentid = o.paymentid
)) / count(o.orderid)) DESC, "Srednia ocen" DESC;

-- wybierz clientow, ktorych srednia wartosc zamowien jest wyzsza niz srednia zamowien, pogrupuj ich w kraje i posortuj po sredniej, liczbie zakupow oraz wartosci
select (select name from country where countryid = a.countryid), avg(od.quantity * p.currentprice) "Srednia wartosc zamowien", count(*) "Liczba zamowien", sum(od.quantity * p.currentprice) "Calkowita suma zamowien"
from "ORDER" o join client c on o.clientid = c.clientid join orderdetails od on o.orderid = od.orderid join product p on od.productid = p.productid
join address a on c.addressid = a.addressid join country co on a.countryid = co.countryid
group by a.countryid, c.clientid
having avg(od.quantity * p.currentprice) > (
select avg(od.quantity * p.currentprice)
from orderdetails od join product p on od.productid = p.productid
) order by count(*) DESC, avg(od.quantity * p.currentprice) DESC, sum(od.quantity * p.currentprice) DESC
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
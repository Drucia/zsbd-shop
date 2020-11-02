alter session set current_schema = druciak; 

-- wybierz najczesciej zamawiane produkty, posortuj je po ilo?ci i ?redniej ocen

select p.productid, sum(od.quantity), avg(r.score)
from orderdetails od join product p on od.productid = p.productid join review r on p.productid = r.productid 
group by p.productid
order by sum(od.quantity) DESC, avg(r.score) DESC;
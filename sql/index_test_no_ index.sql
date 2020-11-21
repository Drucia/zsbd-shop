--drop table EXECUTIONTIME;
create table EXECUTIONTIME(
        querynumber number, 
        starttime timestamp, 
        endtime timestamp);
-----------------------------------------------------------------------------------------------------------------------
alter system flush buffer_cache;
alter system flush shared_pool;

insert into EXECUTIONTIME (querynumber, starttime) values(3, systimestamp);

SAVEPOINT savepoint3;

DELETE FROM product
WHERE
    product.productid IN (
        SELECT
            p.productid
        FROM
            review    r
            JOIN product   p ON p.productid = r.productid
            JOIN client    c ON r.clientid = c.clientid
        WHERE
            add_months(c.createddate, 2) > current_date
        GROUP BY
            p.productid
        HAVING AVG(r.score) < 2
               AND COUNT(r.reviewid) >= 5
    )
    OR product.productid IN (
        SELECT
            p.productid
        FROM
            "ORDER"        o
            JOIN orderdetails   d ON o.orderid = d.orderid
            JOIN product        p ON p.productid = d.productid
        WHERE
            add_months(o.submissiondate, 6) > current_date
    );

ROLLBACK TO SAVEPOINT savepoint3;

update EXECUTIONTIME 
        set endtime = systimestamp
        where querynumber = 3 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------
alter system flush buffer_cache;
alter system flush shared_pool;

insert into EXECUTIONTIME (querynumber, starttime) values(6, systimestamp);

SAVEPOINT savepoint6;

select c.clientid, co.name
from (("ORDER" o join client c on o.clientid = c.clientid) join orderdetails od on o.orderid = od.orderid)
join address ad on c.addressid = ad.addressid join country co on ad.countryid = co.countryid
where c.createddate <= o.submissiondate - 60
and od.quantity < (
select avg(od.quantity)
from ("ORDER" o join client cl on o.clientid = cl.clientid) join orderdetails od on o.orderid = od.orderid
join address a on cl.addressid = a.addressid join city cit on a.cityid = cit.cityid
where a.countryid = ad.countryid or INSTR(cit.name, '%w%')
or cl.companyname = 'Voomm' -- index bit mapa
)
order by co.name desc;

ROLLBACK TO SAVEPOINT savepoint6;

update EXECUTIONTIME 
        set endtime = systimestamp
        where querynumber = 6 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into EXECUTIONTIME (querynumber, starttime) values(7, systimestamp);

SAVEPOINT savepoint7;

select p.productid, sum(od.quantity) "Liczba zamowien" , case when avg(r.score) is null then 0 else avg(r.score) end "Srednia ocen", sum((
select count(*)
from payment
where paymentid = o.paymentid
)) / count(o.orderid) "Procent oplaconych zamowien"
from orderdetails od join product p on od.productid = p.productid left join review r on p.productid = r.productid
join "ORDER" o on od.orderid = o.orderid
where o.paid = 1 or p.colorid is null -- czy tu moze byc bitmapa?
group by p.productid
order by sum(od.quantity) DESC, (sum((
select count(*)
from payment
where paymentid = o.paymentid
)) / count(o.orderid)) DESC, "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint7;

update EXECUTIONTIME 
        set endtime = systimestamp
        where querynumber = 7 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
select querynumber, 
        min(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MIN", 
        max(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MAX",
        avg(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "AVG" ,
        count(8) as "Count"
    from EXECUTIONTIME
    group by querynumber;

select * from EXECUTIONTIME;
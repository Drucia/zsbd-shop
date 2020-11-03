--drop table diff_timestamp;
create table diff_timestamp(
        querynumber number, 
        starttime timestamp, 
        endtime timestamp);
-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(1, systimestamp);

SAVEPOINT halababa;

select DISTINCT r.clientid 
    from review r join product p 
    on r.productid = p.productid 
    where p.productid not in (
        select od.productid
        from "ORDER" o join orderdetails od 
        on o.orderid = od.orderid 
        where o.clientid = r.clientid) ;

ROLLBACK TO SAVEPOINT halababa;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 1 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(2, systimestamp);

SAVEPOINT halababa2;

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

ROLLBACK TO SAVEPOINT halababa2;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 2 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(3, systimestamp);

SAVEPOINT halababa3;

EXEC update_review_content('% et %');

ROLLBACK TO SAVEPOINT halababa3;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 3 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------
alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(4, systimestamp);

SAVEPOINT halababa4;

EXEC delete_unpopular_products(2);

ROLLBACK TO SAVEPOINT halababa4;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 4 and endtime is null;
-----------------------------------------------------------------------------------------------------------------------

select querynumber, 
        min(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MIN", 
        max(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MAX",
        avg(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "AVG" 
    from diff_timestamp
    group by querynumber;

select * from diff_timestamp;
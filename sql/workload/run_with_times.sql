drop table diff_timestamp;
create table diff_timestamp(querynumber number, starttime timestamp, endtime timestamp);
----insert into diff_timestamp values(systimestamp-1, systimestamp+2);
----select cast(f2 as date) - cast (f1 as date) from diff_timestamp
--alter session set current_schema = druciak; 

-- select query nb 1

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(1, systimestamp);

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

update diff_timestamp 
set endtime = systimestamp
where querynumber = 1 and endtime is null;

select querynumber, min(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MIN", 
max(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MAX",
avg(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "AVG" 
from diff_timestamp
group by querynumber;

select * from diff_timestamp;

-- select query nb 2 - DELETE
insert into diff_timestamp (querynumber, starttime) values(2, systimestamp);

exec delete_unpopular_products(2);

update diff_timestamp 
set endtime = systimestamp
where querynumber = 2 and endtime is null;
rollback;

select count(*) from product
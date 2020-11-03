alter session set current_schema = owner; 
alter system flush buffer_cache;
alter system flush shared_pool;

Insert INTO EXECUTIONTIME (STARTQuery, queryid) values (Systimestamp, 2);

SAVEPOINT halababa1;


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
		
ROLLBACK TO SAVEPOINT halababa1;
--Update EXECUTIONTIME SET ENDQuery = systimestamp where EXECUTIONTIMEID = (Select max(EXECUTIONTIMEID) from EXECUTIONTIME);
--
--SELECT
--TIME_FORMAT(avg(cast((("A1"."ENDQUERY_2" as time),'%h:%i:%s %p') - (("A1"."STARTQUERY_1" as time)),'%h:%i:%s %p')))
--FROM
--    (
--        SELECT
--            "A3"."QUERYID"       "QUERYID_0",
--            "A3"."STARTQUERY"    "STARTQUERY_1",
--            "A3"."ENDQUERY"      "ENDQUERY_2"
--        FROM
--            "OWNER"."EXECUTIONTIME"    "A3",
--            "OWNER"."QUERYTOEXEC"      "A2"
--        WHERE
--            "A3"."QUERYID" = "A2"."QUERYID"
--    ) "A1"
--GROUP BY
--    "A1"."QUERYID_0"
--ORDER BY
--    "A1"."QUERYID_0";
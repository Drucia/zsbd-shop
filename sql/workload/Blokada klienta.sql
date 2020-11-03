alter system flush buffer_cache;
alter system flush shared_pool;

Update OWNER.client c set c.blocked = 1 
    where c.clientid = ( 
        select DISTINCT r.clientid 
            from review r join product p 
            on r.productid = p.productid 
            where p.productid not in (
                select od.productid
                from "ORDER" o join orderdetails od 
                on o.orderid = od.orderid 
                where o.clientid = r.clientid)
                )
    OR c.clientid = (
        Select o.clientid from "ORDER" o
        where o.submissiondate > (
        SELECT current_timestamp  - 7 ts FROM DUAL
        ) AND PAID = 0
        );
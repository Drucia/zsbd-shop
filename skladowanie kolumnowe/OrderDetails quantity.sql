ALTER TABLE OrderDetails INMEMORY;
-- 501 OrderDetails  no mem compress
ALTER TABLE OrderDetails INMEMORY NO MEMCOMPRESS (quantity);
Create INMEMORY JOIN GROUP orderdetails_orders_jg (owner.Orderdetails(orderid), owner."Order"(orderid) );

ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    501,
    systimestamp
);

SAVEPOINT savepoint501;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint501;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 501
    AND endtime IS NULL;

    
-- 502 OrderDetails  MEMCOMPRESS FOR DML
ALTER TABLE OrderDetails  INMEMORY MEMCOMPRESS FOR DML (quantity);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    502,
    systimestamp
);

SAVEPOINT savepoint502;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint502;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 502
    AND endtime IS NULL;

    

-- 503 OrderDetails  MEMCOMPRESS FOR QUERY LOW 
ALTER TABLE OrderDetails INMEMORY MEMCOMPRESS FOR QUERY LOW  (quantity);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    503,
    systimestamp
);

SAVEPOINT savepoint503;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint503;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 503
    AND endtime IS NULL;

    

-- 504 OrderDetails  MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE OrderDetails INMEMORY MEMCOMPRESS FOR QUERY HIGH (quantity);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    504,
    systimestamp
);

SAVEPOINT savepoint504;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint504;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 504
    AND endtime IS NULL;

    

-- 505 OrderDetails  MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE OrderDetails INMEMORY MEMCOMPRESS FOR CAPACITY LOW (quantity);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    505,
    systimestamp
);

SAVEPOINT savepoint505;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint505;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 505
    AND endtime IS NULL;

    

-- 506 OrderDetails  MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE OrderDetails INMEMORY MEMCOMPRESS FOR CAPACITY HIGH (quantity);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    506,
    systimestamp
);

SAVEPOINT savepoint506;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint506;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 506
    AND endtime IS NULL;

------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    
------------------------------------------------------------------    

-- 601 Order no mem compress
ALTER TABLE "ORDER" INMEMORY NO MEMCOMPRESS (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    601,
    systimestamp
);

SAVEPOINT savepoint601;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint601;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 601
    AND endtime IS NULL;

    
-- 602 Order MEMCOMPRESS FOR DML
ALTER TABLE "ORDER" INMEMORY MEMCOMPRESS FOR DML (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    602,
    systimestamp
);

SAVEPOINT savepoint602;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint602;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 602
    AND endtime IS NULL;

    

-- 603 Order MEMCOMPRESS FOR QUERY LOW 
ALTER TABLE "ORDER" INMEMORY MEMCOMPRESS FOR QUERY LOW  (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    603,
    systimestamp
);

SAVEPOINT savepoint603;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint603;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 603
    AND endtime IS NULL;

    

-- 604 Order MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE "ORDER" INMEMORY MEMCOMPRESS FOR QUERY HIGH (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    604,
    systimestamp
);

SAVEPOINT savepoint604;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint604;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 604
    AND endtime IS NULL;

    

-- 605 Order MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE "ORDER" INMEMORY MEMCOMPRESS FOR CAPACITY LOW (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    605,
    systimestamp
);

SAVEPOINT savepoint605;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint605;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 605
    AND endtime IS NULL;

    

-- 606 Order MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE "ORDER" INMEMORY MEMCOMPRESS FOR CAPACITY HIGH (paid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    606,
    systimestamp
);

SAVEPOINT savepoint606;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint606;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 606
    AND endtime IS NULL;



-- 701 Product no mem compress
ALTER TABLE Product INMEMORY NO MEMCOMPRESS (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    701,
    systimestamp
);

SAVEPOINT savepoint701;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint701;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 701
    AND endtime IS NULL;

    
-- 702 Product MEMCOMPRESS FOR DML
ALTER TABLE Product INMEMORY MEMCOMPRESS FOR DML (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    702,
    systimestamp
);

SAVEPOINT savepoint702;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint702;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 702
    AND endtime IS NULL;

    

-- 703 Product MEMCOMPRESS FOR QUERY LOW 
ALTER TABLE Product INMEMORY MEMCOMPRESS FOR QUERY LOW  (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    703,
    systimestamp
);

SAVEPOINT savepoint703;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint703;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 703
    AND endtime IS NULL;

    

-- 704 Product MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE Product INMEMORY MEMCOMPRESS FOR QUERY HIGH (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    704,
    systimestamp
);

SAVEPOINT savepoint704;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint704;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 704
    AND endtime IS NULL;

    

-- 705 Product MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE Product INMEMORY MEMCOMPRESS FOR CAPACITY LOW (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    705,
    systimestamp
);

SAVEPOINT savepoint705;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint705;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 705
    AND endtime IS NULL;

    

-- 706 Product MEMCOMPRESS FOR QUERY HIGH
ALTER TABLE Product INMEMORY MEMCOMPRESS FOR CAPACITY HIGH (colorid);


ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;

--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;

ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;
--
ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO executiontime (
    querynumber,
    starttime
) VALUES (
    706,
    systimestamp
);

SAVEPOINT savepoint706;

select
    p.productid,
    sum(od.quantity) "Liczba zamowien",
    case
        when avg(r.score) is null then 0
        else avg(r.score)
    end "Srednia ocen",
    sum(
        (
            select
                count(*)
            from
                payment
            where
                paymentid = o.paymentid
        )
    ) / count(o.orderid) "Procent oplaconych zamowien"
from
    orderdetails od
    join product p on od.productid = p.productid
    left join review r on p.productid = r.productid
    join "ORDER" o on od.orderid = o.orderid
where
    o.paid = 1
    or p.colorid is null
group by
    p.productid
order by
    sum(od.quantity) DESC,
    (
        sum(
            (
                select
                    count(*)
                from
                    payment
                where
                    paymentid = o.paymentid
            )
        ) / count(o.orderid)
    ) DESC,
    "Srednia ocen" DESC;


ROLLBACK TO SAVEPOINT savepoint706;

UPDATE executiontime
SET
    endtime = systimestamp
WHERE
    querynumber = 706
    AND endtime IS NULL;




--
SELECT
    querynumber,
    MIN(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "MIN",
    MAX(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "MAX",
    AVG(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "AVG"
FROM
    executiontime
GROUP BY
    querynumber
    order by querynumber;

--update executiontime set querynumber = 201 where querynumber = 512;
--select * from EXECUTIONTIME order by querynumber desc;
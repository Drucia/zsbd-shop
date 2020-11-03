DROP TABLE diff_timestamp;

CREATE TABLE diff_timestamp (
    querynumber   NUMBER,
    starttime     TIMESTAMP,
    endtime       TIMESTAMP
);
----insert into diff_timestamp values(systimestamp-1, systimestamp+2);
----select cast(f2 as date) - cast (f1 as date) from diff_timestamp
--alter session set current_schema = druciak; 

-- select query nb 1

ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

INSERT INTO diff_timestamp (
    querynumber,
    starttime
) VALUES (
    1,
    systimestamp
);

SELECT
    p.productid,
    SUM(od.quantity) "Liczba zamowien",
    CASE
        WHEN AVG(r.score) IS NULL THEN
            0
        ELSE
            AVG(r.score)
    END "Srednia ocen",
    SUM((
        SELECT
            COUNT(*)
        FROM
            payment
        WHERE
            paymentid = o.paymentid
    )) / COUNT(o.orderid) "Procent oplaconych zamowien"
FROM
    orderdetails   od
    JOIN product        p ON od.productid = p.productid
    LEFT JOIN review         r ON p.productid = r.productid
    JOIN "ORDER"        o ON od.orderid = o.orderid
GROUP BY
    p.productid
ORDER BY
    SUM(od.quantity) DESC,
    ( SUM((
        SELECT
            COUNT(*)
        FROM
            payment
        WHERE
            paymentid = o.paymentid
    )) / COUNT(o.orderid) ) DESC,
    "Srednia ocen" DESC;

UPDATE diff_timestamp
SET
    endtime = systimestamp
WHERE
    querynumber = 1
    AND endtime IS NULL;

SELECT
    querynumber,
    MIN(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "MIN",
    MAX(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "MAX",
    AVG(EXTRACT(MINUTE FROM(endtime - starttime)) * 60 + EXTRACT(SECOND FROM(endtime - starttime))) "AVG"
FROM
    diff_timestamp
GROUP BY
    querynumber;

SELECT
    *
FROM
    diff_timestamp;

-- select query nb 2 - DELETE

INSERT INTO diff_timestamp (
    querynumber,
    starttime
) VALUES (
    2,
    systimestamp
);

EXEC delete_unpopular_products(2);

UPDATE diff_timestamp
SET
    endtime = systimestamp
WHERE
    querynumber = 2
    AND endtime IS NULL;

ROLLBACK;

SELECT
    COUNT(*)
FROM
    product

-- update 

INSERT INTO diff_timestamp (
    querynumber,
    starttime
) VALUES (
    3,
    systimestamp
);

EXEC update_review_content('% et %');

UPDATE diff_timestamp
SET
    endtime = systimestamp
WHERE
    querynumber = 3
    AND endtime IS NULL;

ROLLBACK;
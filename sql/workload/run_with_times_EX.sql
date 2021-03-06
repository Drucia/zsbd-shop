--drop table diff_timestamp;
create table diff_timestamp(
        querynumber number, 
        starttime timestamp, 
        endtime timestamp);
-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(1, systimestamp);

SAVEPOINT savepoint1;

select DISTINCT r.clientid 
    from review r join product p 
    on r.productid = p.productid 
    where p.productid not in (
        select od.productid
        from "ORDER" o join orderdetails od 
        on o.orderid = od.orderid 
        where o.clientid = r.clientid) ;

ROLLBACK TO SAVEPOINT savepoint1;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 1 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(2, systimestamp);

SAVEPOINT savepoint2;

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

ROLLBACK TO SAVEPOINT savepoint2;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 2 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(3, systimestamp);

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
            add_months(c.createddate, 2) > current_date -- kandydat na funkcyjne idx
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
            add_months(o.submissiondate, 6) > current_date -- kandydat na funkcyjne idx
    );

ROLLBACK TO SAVEPOINT savepoint3;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 3 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(4, systimestamp);

SAVEPOINT savepoint4;

UPDATE review r
SET
    r.content = concat((
        SELECT
           concat (p.name, substr(p.description, 0, 5) )
        FROM
            product p
        WHERE
            p.productid = r.productid
    ),concat('__--__', r.content));

ROLLBACK TO SAVEPOINT savepoint4;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 4 and endtime is null;
		
-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(5, systimestamp);

SAVEPOINT savepoint5;

INSERT INTO owner.review (
    content,
    createdate,
    clientid,
    productid,
    title,
    imagelink,
    bought,
    score
) VALUES (
    'savepoint',
    current_date,
    (
        SELECT
            "idx"
        FROM
            (
                SELECT
                    r.clientid AS "idx",
                    AVG(r.score)
                FROM
                    review r
                GROUP BY
                    r.clientid
                HAVING
                    AVG(r.score) > 3
                ORDER BY
                    AVG(r.score) DESC
            )
        WHERE
            ROWNUM = 1
    ),
    (
        SELECT
            *
        FROM
            (
                SELECT
                    r.productid
                FROM
                    review r
                GROUP BY
                    r.productid
                HAVING
                    AVG(r.score) = (
                        SELECT
                            MAX(AVG(score))
                        FROM
                            review
                        GROUP BY
                            productid
                    )
            )
        WHERE
            ROWNUM = 1
    ),
    (
        SELECT
            c.name
        FROM
            client c
        WHERE
            c.clientid = (
                SELECT
                    "idx"
                FROM
                    (
                        SELECT
                            r.clientid AS "idx",
                            AVG(r.score)
                        FROM
                            review r
                        GROUP BY
                            r.clientid
                        HAVING
                            AVG(r.score) > 3
                        ORDER BY
                            AVG(r.score) DESC
                    )
                WHERE
                    ROWNUM = 1
            )
    ),
    '',
    (
        SELECT
            *
        FROM
            (
                SELECT
                    CASE
                        WHEN (
                            SELECT
                                *
                            FROM
                                (
                                    SELECT
                                        c.clientid
                                    FROM
                                        client c
                                    WHERE
                                        c.clientid = (
                                            SELECT
                                                "idx"
                                            FROM
                                                (
                                                    SELECT
                                                        r.clientid AS "idx",
                                                        AVG(r.score)
                                                    FROM
                                                        review r
                                                    GROUP BY
                                                        r.clientid
                                                    HAVING
                                                        AVG(r.score) > 3
                                                    ORDER BY
                                                        AVG(r.score) DESC
                                                )
                                            WHERE
                                                ROWNUM = 1
                                        )
                                )
                        ) IN (
                            SELECT DISTINCT
                                r.clientid
                            FROM
                                     review r
                                JOIN product p ON r.productid = p.productid
                            WHERE
                                p.productid IN (
                                    SELECT
                                        od.productid
                                    FROM
                                             "ORDER" o
                                        JOIN orderdetails od ON o.orderid = od.orderid
                                    WHERE
                                        o.clientid = r.clientid
                                )
                        ) THEN
                            1
                        ELSE
                            0
                    END "bout"
                FROM
                    review
            )
        WHERE
            ROWNUM = 1
    ),
        ( SELECT
    *
FROM
    (
        SELECT
            Round(AVG(r.score), 2)
        FROM
            review r
        GROUP BY
            r.clientid
        HAVING
            AVG(r.score) > 3
        ORDER BY
            AVG(r.score) DESC
    )
WHERE
    ROWNUM = 1
)
);

ROLLBACK TO SAVEPOINT savepoint5;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 5 and endtime is null;

-----------------------------------------------------------------------------------------------------------------------

alter system flush buffer_cache;
alter system flush shared_pool;

insert into diff_timestamp (querynumber, starttime) values(6, systimestamp);

SAVEPOINT savepoint6;

        SELECT
            *
        FROM
            (
                SELECT
                    CASE
                        WHEN (
                            SELECT
                                *
                            FROM
                                (
                                    SELECT
                                        c.clientid
                                    FROM
                                        client c
                                    WHERE
                                        c.clientid = (
                                            SELECT
                                                "idx"
                                            FROM
                                                (
                                                    SELECT
                                                        r.clientid AS "idx",
                                                        AVG(r.score)
                                                    FROM
                                                        review r
                                                    GROUP BY
                                                        r.clientid
                                                    HAVING
                                                        AVG(r.score) > 3
                                                    ORDER BY
                                                        AVG(r.score) DESC
                                                )
                                            WHERE
                                                ROWNUM = 1
                                        )
                                )
                        ) IN (
                            SELECT DISTINCT
                                r.clientid
                            FROM
                                     review r
                                JOIN product p ON r.productid = p.productid
                            WHERE
                                p.productid IN (
                                    SELECT
                                        od.productid
                                    FROM
                                             "ORDER" o
                                        JOIN orderdetails od ON o.orderid = od.orderid
                                    WHERE
                                        o.clientid = r.clientid
                                )
                        ) THEN
                            1
                        ELSE
                            0
                    END "bout"
                FROM
                    review
            )
        WHERE
            ROWNUM = 1
;

ROLLBACK TO SAVEPOINT savepoint6;

update diff_timestamp 
        set endtime = systimestamp
        where querynumber = 6 and endtime is null;
-----------------------------------------------------------------------------------------------------------------------
select querynumber, 
        min(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MIN", 
        max(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "MAX",
        avg(extract (minute from (endtime-starttime))*60 + extract (second from (endtime-starttime))) "AVG" 
    from diff_timestamp
    group by querynumber;

select * from diff_timestamp;
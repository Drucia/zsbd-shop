alter session set current_schema = druciak; 

select c.clientid, co.name
from (("ORDER" o join client c on o.clientid = c.clientid) join orderdetails od on o.orderid = od.orderid)
join address ad on c.addressid = ad.addressid join country co on ad.countryid = co.countryid
where c.createddate <= o.submissiondate - 60
and od.quantity < (
select avg(od.quantity)
from ("ORDER" o join client cl on o.clientid = cl.clientid) join orderdetails od on o.orderid = od.orderid
join address a on cl.addressid = a.addressid join city cit on a.cityid = cit.cityid
where a.countryid = ad.countryid or cit.name LIKE '%w%'
or cl.companyname = 'Voomm' -- index bit mapa
)
order by co.name desc;

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

INSERT INTO review (
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
                                        o.clientid = r.clientid or o.orderstatusid >= 3
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





select DISTINCT r.clientid, c.createddate
    from (review r join product p 
    on r.productid = p.productid) join client c on r.clientid = c.clientid
    where p.productid not in (
        select od.productid
        from "ORDER" o join orderdetails od 
        on o.orderid = od.orderid 
        where o.clientid = r.clientid)
    and r.createdate >= c.createddate - 31 and c.blocked = 0
    order by c.createddate desc;
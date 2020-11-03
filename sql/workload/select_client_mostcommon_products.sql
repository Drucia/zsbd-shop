SELECT
    c.clientid,
    c.name,
    CASE
        WHEN AVG(r.score) IS NULL THEN
            0
        ELSE
            AVG(r.score)
    END "Srednia ocen",
    (
        SELECT
            SUM(od.quantity * p.currentprice)
        FROM
            orderdetails   od
            JOIN product        p ON od.productid = p.productid
            JOIN "ORDER"        o ON od.orderid = o.orderid
        WHERE
            o.clientid = c.clientid
    ) "Wydano",
    CASE
        WHEN STATS_MODE(pr.colorID) IS NULL THEN
            0
        ELSE
            STATS_MODE(pr.colorID)
    END "najpopularniejszy kolor",
        CASE
        WHEN STATS_MODE(pr.producttypeid) IS NULL THEN
            0
        ELSE
            STATS_MODE(pr.producttypeid)
    END "najpopularniejszy typ produktu",
            CASE
        WHEN STATS_MODE(pr.monitorproducerid) IS NULL THEN
            0
        ELSE
            STATS_MODE(pr.monitorproducerid)
    END "najpopularniejszy typ produktu"
FROM
    client   c
    JOIN review   r ON c.clientid = r.clientid
    join product pr on r.productid = pr.productid
GROUP BY
    c.clientid,
    c.name
ORDER BY
    c.clientid,
    "Srednia ocen",
    ( SUM((
        SELECT
            COUNT(*)
        FROM
            review
        WHERE
            reviewid = pr.productid
    )) / COUNT(pr.productid) ) DESC,
    "najpopularniejszy kolor";

ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;


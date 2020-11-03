-- usuniecie produktow, ktore
-- nie sprzedaly sie od pol roku
-- lub maja ocene ponizej score_limit 
-- majac wiecej niz 5 wystawionych recenzji 
-- od uzytkownikow istniejacych dluzej niz 2 miesiace
CREATE OR REPLACE PROCEDURE delete_unpopular_products (
    score_limit NUMBER
) IS
BEGIN
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
            HAVING AVG(r.score) < score_limit
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

    

   
-- print out contact's information

    dbms_output.put_line('delete_products finished');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
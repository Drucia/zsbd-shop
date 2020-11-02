
-- usuniecie produktow, ktore
-- nie sprzedaly sie od pol roku
-- lub maja ocene ponizej score_limit 
-- majac wiecej niz 5 wystawionych recenzji 
-- od uzytkownikow istniejacych dluzej niz 2 miesiace
CREATE
OR REPLACE PROCEDURE delete_unpopular_products(score_limit NUMBER) IS BEGIN -- get contact based on customer id
DELETE FROM
    Products
WHERE
    products.productid in (
        select
            p.productid
        from
            review r
            join product p on p.productid = r.productid
            join client c on r.clientid = c.clientid
        where
            AVG(r.score) < score_limit
            and count(r.reviewid) >= 5
            and c.createddate
    )
    or products.productid in (
        select
            p.productid
        from
            order o
            JOIN orderdetails d on o.orderid = d.ORDERid
            join product p on p.productid = d.productid
        where
            ADD_MONTHS(o.submissiondate, 6) > CURRENT_DATE
    );

-- print out contact's information
dbms_output.put_line('delete_products finished');

EXCEPTION
WHEN OTHERS THEN dbms_output.put_line(SQLERRM);

END;

-- zwiekszenie ceny product_number najchetniej kupowanych produktow 
-- w ostatnich months miesiacach, 
-- jezeli ocena tego produktu 
-- jest rowna badz wieksza niz score.
CREATE OR REPLACE PROCEDURE increase_products_price (
    product_number   NUMBER,
    months           NUMBER,
    score            NUMBER
) IS 


------------------------------------------

-------------------------------------------

    cursor prodcur IS
    SELECT
        p.currentprice
    FROM
        product        p
        JOIN REVIEW        r ON r.productid = p.productid
        JOIN ORDERDETAILS   d ON p.productid = d.productid
        JOIN "ORDER"        o ON d.orderid = o.orderid
    WHERE
        add_months(o.submissiondate, months) > current_date
       
--    HAVING
  --      AVG(r.score) >= score
         for update of p.currentprice;
    

BEGIN
    FOR prod IN prodcur LOOP
        --dbms_output.put_line(prod);
        UPDATE product p
        SET
            p.currentprice = p.currentprice * ( 1 + 1 / 5 )
        WHERE
           CURRENT OF prodcur;

    END LOOP;

    dbms_output.put_line('increase_products_price finished');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
------------------------------------------
--BEGIN UPDATE top ( product_number ) products
--SET
--    p.currentprice = currentprice * ( 1 + 1 / 5 )
--FROM
--    products       p
--    JOIN reviews        r ON r.productid = p.productid
--    JOIN orderdetails   d ON p.productid = d.productid
--    JOIN order          o ON d.orderid = o.orderid
--WHERE
--    add_months(o.submissiondate, months) > current_date
--    AND AVG(r.score) >= score
--);dbms_output.put_line('increase_products_price finished');
--EXCEPTION
--    WHEN OTHERS THEN
--        dbms_output.put_line(sqlerrm);
--END;

 --exec increase_products_price(2, 24, 4);
 --select * from product order by currentprice;
 --select count(*) from product;
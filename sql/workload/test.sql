CREATE OR REPLACE PROCEDURE update-review-content (
    word   varchar2,
) IS 


------------------------------------------

    CURSOR product_cursor IS
    SELECT
        p.Name, p.Description, p.ProductID
    FROM
        PRODUCTS p
    WHERE
        p.Description like word;

    CURSOR review_cursor IS
    SELECT
        r.Title, r.ProductID
    FROM
        REVIEW r;
    

BEGIN
    FOR product IN product_cursor LOOP
        FOR review IN review_cursor LOOP
        
        UPDATE REVIEW rev
        SET
            rev.Content = CONCAT(review.Title, product.Name, product.Description)
        WHERE
        review.ProductID = product.ProductID
        AND
            CURRENT OF review;

        END LOOP;
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

-- exec increase_products_price(1, 12, 4);
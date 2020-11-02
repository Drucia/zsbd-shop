CREATE OR REPLACE PROCEDURE update_review_content (
    word VARCHAR2
) IS

    CURSOR product_cursor IS
    SELECT
        p.name,
        p.description,
        p.productid
    FROM
        owner.product p
    WHERE
        p.description LIKE word;

    CURSOR review_cursor IS
    SELECT
        r.title,
        r.productid
    FROM
        owner.review r
        for update of r.content;

BEGIN
    FOR prod IN product_cursor LOOP FOR rev IN review_cursor LOOP
        UPDATE owner.review r
        SET
            r.content = concat(rev.title, concat(prod.name, prod.description))
        WHERE
            CURRENT OF review_cursor;

    END LOOP;
    END LOOP;

    dbms_output.put_line('update_review_content finished');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;

exec update_review_content('%et%');

select * from OWNER.review;
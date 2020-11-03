CREATE OR REPLACE PROCEDURE update_review_content (
    word VARCHAR2
) IS

    CURSOR c1 IS
    SELECT
        r.reviewid   AS "id",
        p.name       AS "name",
        p.description     
    FROM
        owner.review   r
        JOIN product        p ON r.productid = p.productid
    WHERE
        p.description LIKE word;

    c1_reviewid   NUMBER(10);
    c1_name       VARCHAR2(255);
    c1_desc       VARCHAR2(3000);
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO
            c1_reviewid,
            c1_name,
            c1_desc;
        EXIT WHEN c1%notfound;
        UPDATE review rev
        SET
            rev.content = concat(c1_name,concat('--__--', concat(substr(c1_desc, 0, 5), concat('__--__', rev.content))))
        WHERE
            rev.reviewid = c1_reviewid;

    END LOOP;

    dbms_output.put_line('update_review_content finished');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
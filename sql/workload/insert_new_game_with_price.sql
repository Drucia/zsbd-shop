-- Wstawienie nowej gry i ustalenie jej ceny na podstawie sredniej ocen innych gier z tego samego gatunku.

CREATE OR REPLACE PROCEDURE insert_new_game_with_price (
    original_price    NUMBER,
    image_link        VARCHAR,
    description       VARCHAR,
    warranty_period   NUMBER,
    name              VARCHAR,
    multiplayer       VARCHAR,
    game_genre_id     NUMBER,
    product_type_id   NUMBER
) IS
    price       FLOAT;
    avg_score   FLOAT;
BEGIN -- get contact based on customer id
    SELECT
        AVG(r.score)
    INTO avg_score
    FROM
        review    r
        JOIN product   p ON r.productid = p.productid
    WHERE
        p.gamegenreid = game_genre_id;

    price := avg_score * 0.1 * original_price + original_price;
    INSERT INTO owner.product (
        currentprice,
        lastmodified,
        imagelink,
        description,
        warrantyperiod,
        name,
        multiplayer,
        gamegenreid,
        producttypeid
    ) VALUES (
        price,
        current_date,
        image_link,
        description,
        warranty_period,
        name,
        multiplayer,
        game_genre_id,
        product_type_id
    );

-- print out contact's information

    dbms_output.put_line('new_game finished');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlerrm);
END;
-- Wstawienie nowej gry i ustalenie jej ceny na podstawie średniej ocen innych gier z tego samego gatunku.
CREATE
OR REPLACE PROCEDURE insert_new_game_with_price(
    original_price NUMBER,
    image_link VARCHAR,
    description VARCHAR,
    warranty_period NUMBER,
    name VARCHAR,
    multiplayer VARCHAR,
    game_genre_id NUMBER,
    product_type_id NUMBER
) IS price Float;

avg_score Float;

avg_score is
SELECT
    AVG(r.SCORE)
FROM
    Review r
    JOIN Product p ON r.productId = p.ProductID
WHERE
    p.GameGenreID = game_genre_id;

price := avg_score * 0.1 * original_price + original_price;

BEGIN -- get contact based on customer id
INSERT INTO
    owner.product (
        currentprice,
        lastmodified,
        imagelink,
        description,
        warrantyperiod,
        name,
        multiplayer,
        gamegenreid,
        producttypeid
    )
VALUES
    (
        price,
        CURRENT_DATE,
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

EXCEPTION
WHEN OTHERS THEN dbms_output.put_line(SQLERRM);

END;

exec insert_new_game_with_price();

-- Usunięcie produktów, które 
-- nie sprzedały się od pół roku 
-- lub mają ocenę poniżej score_limit 
-- mając więcej niż 5 wystawionych recenzji 
-- od użytkowników istniejących dłużej niż 2 miesiące.
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

exec delete_unpopular_products(2);

-- Zwiększenie ceny product_number najchętniej kupowanych produktów 
-- w ostatnich months miesiącach, 
-- jeżeli ocena tego produktu 
-- jest równa bądź większa niż score.
CREATE
OR REPLACE PROCEDURE increase_products_price(
    product_number NUMBER,
    months NUMBER,
    score NUMBER
) IS BEGIN -- get contact based on customer id
Update
    TOP(product_number) Products
SET
    p.CurrentPrice = CurrentPrice *(1 + 1 / 5)
FROM
    Products p
    JOIN Reviews r on r.productid = p.productid
    JOIN OrderDetails d on p.productid = d.productid
    JOIN Order o on d.orderid = o.orderid
WHERE
    ADD_MONTHS(o.submissiondate, months) > CURRENT_DATE
    AND avg(r.score) >= score
);

-- print out contact's information
dbms_output.put_line('increase_products_price finished');

EXCEPTION
WHEN OTHERS THEN dbms_output.put_line(SQLERRM);

END;

exec increase_products_price(1, 12, 4);
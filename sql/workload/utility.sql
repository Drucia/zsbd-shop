exec insert_new_game_with_price(120, null, 'Lorem ipsum', 12, 'gra test', 0, 1, 1);
select count(*) from owner.PRODUCT;
select * from owner.PRODUCT order by currentprice desc;


alter system flush buffer_cache;
alter system flush shared_pool;


alter session set current_schema = owner; 





EXEC insert_new_game_with_price(120, NULL, 'Lorem ipsum', 12, 'gra test',
                           0, 1, 1);

SELECT
    COUNT(*)
FROM
    owner.product;

SELECT
    *
FROM
    owner.product
ORDER BY
    currentprice DESC;

ALTER SYSTEM FLUSH BUFFER_CACHE;

ALTER SYSTEM FLUSH SHARED_POOL;

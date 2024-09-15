CREATE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS TABLE (a bigint) AS $$ WITH RECURSIVE f(a, b) AS (
    SELECT 0 AS a,
        1 as b
    UNION ALL
    SELECT b,
        a + b
    FROM f
    WHERE b < pstop
)
SELECT a
FROM f;
$$ LANGUAGE SQL;
-- To check yourself and call a function, you can make a statements like below.
select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
CREATE FUNCTION func_minimum(VARIADIC arr numeric []) RETURNS numeric AS $$ -- unnest(arr) разворачивает массив в набор строк
SELECT min(i)
FROM unnest(arr) g(i);
$$ LANGUAGE SQL;
SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);
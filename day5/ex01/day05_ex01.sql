-- планировщик будет использовать всё, что только можно, дабы избежать последовательного сканирования
SET enable_seqscan = off;
-- команда, которая выводит то, как работает ваш SQL в рамках базы данных, какие подтягиваются структуры, какие страницы, статистика и так далее
EXPLAIN ANALYZE
SELECT m.pizza_name,
    pz.name as pizzeria_name
FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
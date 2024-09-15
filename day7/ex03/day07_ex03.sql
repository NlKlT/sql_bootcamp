WITH orders AS (
    SELECT pz.name,
        count(*) as count,
        'order' as action_type
    FROM person_order po
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
),
visits AS (
    SELECT pz.name,
        count(*) as count,
        'visit' as action_type
    FROM person_visits pv
        JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
),
statistic AS (
    SELECT o.name,
        (o.count + v.count) AS total_count
    FROM orders o
        JOIN visits v ON v.name = o.name
)
SELECT pizzeria.name,
    CASE
        WHEN total_count IS NULL THEN 1
        ELSE total_count
    END total_count
FROM pizzeria
    FULL JOIN statistic ON pizzeria.name = statistic.name
ORDER BY total_count DESC,
    name;
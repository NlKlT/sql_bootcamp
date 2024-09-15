SELECT pz.name,
    count(*) as count_of_orders,
    round(avg(m.price), 2) as average_price,
    max(m.price) as max_price,
    min(m.price) as min_price
FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY 1;
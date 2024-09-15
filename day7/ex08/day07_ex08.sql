SELECT p.address,
    pz.name,
    count(*) as count_of_orders
FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person p ON po.person_id = p.id
GROUP BY p.address,
    pz.name
ORDER BY 1,
    2;
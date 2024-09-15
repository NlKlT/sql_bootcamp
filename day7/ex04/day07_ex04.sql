SELECT p.name, count(*) as count_of_visits
FROM person_visits pv
JOIN person p
    ON pv.person_id = p.id
GROUP BY p.name
HAVING count(*) > 3
CREATE FUNCTION fnc_person_visits_and_eats_on_datem(
    IN pperson varchar default 'Dmitriy',
    IN pprice numeric default 500,
    IN pdate date default '2022-01-08'
) RETURNS TABLE (name varchar) AS $$ BEGIN RETURN QUERY
SELECT pz.name as pizzeria_name
FROM person_visits pv
    INNER JOIN person_order po ON po.person_id = pv.person_id
    INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    INNER JOIN menu m ON m.id = po.menu_id
    AND m.pizzeria_id = pz.id
    INNER JOIN person p ON p.id = po.person_id
    AND p.id = pv.person_id
WHERE p.name = pperson
    and m.price < pprice
    and po.order_date = pdate;
END;
$$LANGUAGE plpgsql;
-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);
--
-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
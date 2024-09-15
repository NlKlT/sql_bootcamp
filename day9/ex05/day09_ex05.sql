DROP FUNCTION IF EXISTS public.fnc_persons_female();
DROP FUNCTION IF EXISTS public.fnc_persons_male();
CREATE OR REPLACE FUNCTION fnc_persons(IN pgen varchar default 'female') RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
    ) AS $$ (
        SELECT *
        FROM person
        WHERE person.gender = pgen
    );
$$ LANGUAGE sql;
select *
from fnc_persons(pgen := 'male');
select *
from fnc_persons();
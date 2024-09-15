SELECT id,
    name,
    case
        WHEN (
            age >= '10'
            AND age <= '20'
        ) then 'interval #1'
        WHEN (
            age > '20'
            AND age < '24'
        ) then 'interval #2'
        else 'interval #3'
    end interval_info
FROM person
ORDER BY interval_info ASC;
SELECT address,
    round((max(age) - min(age) / max(age::numeric)), 2) as formula,
    round(avg(age), 2) as average,
    case
        when round((max(age) - min(age) / max(age::numeric)), 2) > round(avg(age), 2) then 'true'
        else 'false'
    end comparison
FROM person
GROUP BY address
ORDER BY 1;
WITH RECURSIVE rec_roads AS (
SELECT CONCAT(point1,',',point2) AS path,
point2,
cost 
FROM roads
WHERE point1 LIKE 'a%'
UNION
SELECT CONCAT(rec_roads.path,',',roads.point2) AS path,
roads.point2,
rec_roads.cost+roads.cost
FROM rec_roads
JOIN roads ON roads.point1=rec_roads.point2
WHERE path NOT LIKE CONCAT('%', roads.point2, '%') OR (LENGTH(path)=7 AND roads.point2='a')
)

SELECT 
cost AS total_cost,
CONCAT('{',path,'}') AS tour
FROM rec_roads
WHERE LENGTH(path)=9 AND cost=(SELECT MIN(cost) FROM rec_roads WHERE LENGTH(path)=9)
UNION
SELECT 
cost AS total_cost,
CONCAT('{',path,'}') AS tour
FROM rec_roads
WHERE LENGTH(path)=9 AND cost=(SELECT MAX(cost) FROM rec_roads WHERE LENGTH(path)=9)
ORDER BY 1,2
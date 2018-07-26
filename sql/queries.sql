-- Query xyz cluster;

WITH RECURSIVE tree(tx,tc) AS (
SELECT c.id, c.cid FROM cluster c
INNER JOIN star s ON s.id = c.id
WHERE s.name = 'rakudo'
UNION ALL
SELECT id, cid FROM cluster c
JOIN tree t ON c.id = t.tc
)
SELECT DISTINCT name FROM star s
JOIN tree t ON t.tx = s.id;



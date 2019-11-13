SELECT STRFTIME('%m', l_shipdate), AVG(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '%1996%'
GROUP BY STRFTIME('%m',l_shipdate);
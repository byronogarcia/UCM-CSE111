SELECT MAX(julianday(l_shipdate) - julianday(l_commitdate))
FROM lineitem
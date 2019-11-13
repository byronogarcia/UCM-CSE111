SELECT c_name, COUNT(*)
FROM orders
JOIN customer on (o_custkey = c_custkey)
JOIN nation on (c_nationkey = n_nationkey)
WHERE n_name = 'GERMANY'
      AND o_orderdate >= '1995-01-01'
      AND o_orderdate <= '1995-12-31'
      GROUP BY c_name;
SELECT n_name
FROM lineitem, (SELECT n_name, SUM(l_extendedprice)
                FROM nation, supplier, lineitem
                WHERE n_nationkey = s_nationkey
                      AND s_suppkey = l_suppkey) AS result
WHERE l_shipdate LIKE '%1996%'
GROUP BY n_name;
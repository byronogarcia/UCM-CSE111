SELECT name1, (sum1 - sum2)
FROM (SELECT n_name AS name1, SUM(l_extendedprice) AS sum1
      FROM customer, orders, lineitem, supplier, nation
      WHERE c_custkey = o_custkey
            AND l_orderkey = o_orderkey
            AND l_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND c_nationkey != n_nationkey
            AND l_shipdate LIKE '%1996%'
      GROUP BY n_name), 
      (SELECT n_name AS name2, SUM(l_extendedprice) AS sum2
       FROM customer, orders, lineitem, supplier, nation
       WHERE c_custkey = o_custkey
             AND l_orderkey = o_orderkey
             AND l_suppkey = s_suppkey
             AND c_nationkey = n_nationkey
             AND s_nationkey != n_nationkey
             AND l_shipdate LIKE '%1996%'
             GROUP BY n_name)
WHERE name1 = name2;
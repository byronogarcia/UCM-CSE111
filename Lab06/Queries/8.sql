SELECT COUNT(DISTINCT(c_custkey))
FROM orders, customer
WHERE c_custkey = o_custkey
      AND o_orderkey NOT IN (SELECT DISTINCT(o_orderkey)
      -- Using NOT IN to get values needed
                             FROM nation, region, supplier, lineitem, orders
                             WHERE r_regionkey = n_regionkey
                                   AND n_nationkey = s_nationkey
                                   AND s_suppkey = l_suppkey
                                   AND o_orderkey = l_orderkey
                                   -- NOT IN again getting tuples necessary
                                   AND r_name NOT IN ('ASIA'));
-- Allows for the tuples needed, and extact customers that have at least one order supplied by only suppliers in ASIA
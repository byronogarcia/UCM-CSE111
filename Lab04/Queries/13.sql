SELECT COUNT(DISTINCT o_orderkey)
FROM orders, lineitem,
    (SELECT s_suppkey
     FROM supplier, nation, region
     WHERE r_regionkey = n_regionkey
           AND n_nationkey = s_nationkey
           AND r_name = 'EUROPE') ONE,
    (SELECT c_custkey
     FROM customer, nation, region
     WHERE r_regionkey = n_regionkey
           AND n_nationkey = c_nationkey
           AND n_name = 'CANADA') TWO
WHERE o_orderkey = l_orderkey
      AND ONE.s_suppkey = l_suppkey
      AND TWO.c_custkey = o_custkey;
 
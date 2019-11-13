SELECT COUNT(o_orderpriority), strftime('%Y', o_orderdate) AS orderdate, r_name
FROM orders, nation, supplier, region, lineitem
WHERE s_suppkey = l_suppkey 
      AND l_orderkey = o_orderkey 
      AND s_nationkey = n_nationkey 
      AND r_regionkey = n_regionkey 
      AND o_orderpriority = '3-MEDIUM' 
      GROUP BY r_name, orderdate;
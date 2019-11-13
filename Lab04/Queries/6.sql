SELECT p_mfgr, o_orderpriority, COUNT (p_partkey)
FROM region, nation, supplier, lineitem, orders, part
WHERE r_regionkey = n_regionkey
      AND n_nationkey = s_nationkey
      AND s_suppkey = l_suppkey
      AND l_partkey = p_partkey
      AND l_orderkey = o_orderkey
      GROUP BY p_mfgr, o_orderpriority;
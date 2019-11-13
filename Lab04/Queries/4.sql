SELECT s_name, COUNT(p_partkey)
FROM part, partsupp, supplier, nation
WHERE p_partkey = ps_partkey
      AND ps_suppkey = s_suppkey
      AND s_nationkey = n_nationkey
      AND n_name = 'BRAZIL'
      AND p_size < 20
      GROUP BY s_name;

SELECT COUNT(DISTINCT s_name)
FROM part, partsupp, supplier 
WHERE p_type LIKE '%MEDIUM POLISHED%' 
      AND s_suppkey = ps_suppkey
      AND ps_partkey = p_partkey
      AND p_size IN (3, 23, 26, 49);
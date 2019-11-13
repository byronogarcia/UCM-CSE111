SELECT s_name, p_size , MIN(ps_supplycost)
FROM part, supplier, partsupp, nation, region 
WHERE p_type LIKE '%STEEL%' 
      AND p_partkey = ps_partkey 
      AND s_suppkey = ps_suppkey 
      AND n_nationkey = s_nationkey 
      AND n_regionkey = r_regionkey 
      AND r_name = 'AMERICA'
      GROUP BY p_size
      ORDER BY s_name;

SELECT COUNT(suppAtLeast4)
-- At least 4 different parts
FROM (SELECT COUNT(DISTINCT(s_suppkey)) AS suppAtLeast4
      FROM part, partsupp, supplier, nation
      WHERE p_partkey = ps_partkey 
            AND ps_suppkey = s_suppkey
            AND n_nationkey = s_nationkey
            -- Suppliers from CANADA
            AND n_name = 'CANADA'
            GROUP BY s_suppkey
            -- Have to supply at least 4  parts
            HAVING COUNT(p_partkey) >= 4) AS result;
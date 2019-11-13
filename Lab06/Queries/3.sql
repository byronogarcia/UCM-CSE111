SELECT COUNT(partsuppMorethanOne)
FROM (SELECT COUNT(DISTINCT(p_partkey)) AS partsuppMorethanONe
      -- Parts supplied and their key
      FROM part, partsupp, supplier, nation
      WHERE p_partkey = ps_partkey 
            AND s_suppkey = ps_suppkey 
            AND s_nationkey = n_nationkey
            -- Make sure the parts are supplied by CANADA
            AND n_name = 'CANADA'
GROUP BY ps_partkey
-- Parts are supplied by more than one supp
HAVING COUNT(s_suppkey) > 1);
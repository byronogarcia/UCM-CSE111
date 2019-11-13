SELECT COUNT(*)
FROM nation, supplier, partsupp
WHERE s_nationkey = n_nationkey 
      AND n_name = 'CANADA'  --specifying that the parts are from canada
      AND s_suppkey = ps_suppkey 
      AND ps_supplycost * ps_availqty IN (SELECT ps_supplycost * ps_availqty 
                                          FROM partsupp
      --using given (ps_supplycost*ps_availqty
ORDER BY ps_supplycost * ps_availqty 
DESC LIMIT (SELECT COUNT(*) * 0.03  --in the top 3%  value across all parts
            FROM partsupp));
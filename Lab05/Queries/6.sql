SELECT p_mfgr
FROM (SELECT p_mfgr, MIN(ps_availqty) FROM  supplier, part, partsupp 
      WHERE s_name = 'Supplier#000000053' 
            AND p_partkey = ps_partkey 
            AND ps_suppkey = s_suppkey);
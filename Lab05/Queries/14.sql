SELECT suppreg.r_name, custreg.r_name, SUBSTR(l_shipdate,1,4), SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem, orders, customer, nation cn, region custreg, supplier, nation sn, region suppreg 
WHERE l_orderkey = o_orderkey 
      AND o_custkey = c_custkey 
      AND c_nationkey = cn.n_nationkey 
      AND cn.n_regionkey = custreg.r_regionkey 
      AND l_suppkey = s_suppkey 
      AND s_nationkey = sn.n_nationkey 
      AND sn.n_regionkey = suppreg.r_regionkey 
      AND substr(l_shipdate,1,4) IN ('1995','1996') 
GROUP BY suppreg.r_name, custreg.r_name, substr(l_shipdate,1,4) 
ORDER BY suppreg.r_name, custreg.r_name, substr(l_shipdate,1,4);
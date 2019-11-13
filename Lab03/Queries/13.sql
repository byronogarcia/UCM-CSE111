SELECT avg(c_acctbal) 
FROM customer, nation, region 
WHERE c_nationkey = n_nationkey 
      AND n_regionkey = r_regionkey 
      AND r_name = 'EUROPE' 
      AND c_mktsegment = 'MACHINERY';
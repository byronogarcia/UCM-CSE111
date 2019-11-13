SELECT COUNT(c_custkey)
FROM nation, region, customer
WHERE n_regionkey = r_regionkey
      AND n_nationkey = c_nationkey
      AND r_name <> 'AFRICA'
      AND r_name <> 'EUROPE';
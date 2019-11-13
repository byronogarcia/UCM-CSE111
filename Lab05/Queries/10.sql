SELECT r_name, COUNT(DISTINCT c_name)
FROM customer, nation, region, orders 
WHERE c_nationkey = n_nationkey 
      AND n_regionkey = r_regionkey
      AND NOT c_custkey IN (SELECT o_custkey 
                            FROM orders) 
      AND c_acctbal > (SELECT AVG(c_acctbal) 
                       FROM customer) 
GROUP BY r_name;
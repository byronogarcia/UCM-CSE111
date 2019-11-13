SELECT DISTINCT c_nation, tot_customers, tot_suppliers 
FROM (SELECT COUNT(c_custkey) AS tot_customers, n_name AS c_nation, r_name, c_custkey
      FROM customer, nation, region 
      WHERE r_regionkey = n_regionkey
            AND r_name = 'EUROPE' 
            AND c_nationkey = n_nationkey 
            GROUP BY n_name), (SELECT COUNT(s_suppkey) AS tot_suppliers, n_name AS s_nation, r_name 
                               FROM supplier, nation, region 
                               WHERE r_regionkey = n_regionkey 
                               AND r_name = 'EUROPE' 
                               AND s_nationkey = n_nationkey 
                               GROUP BY n_name), nation 
WHERE c_nation = s_nation;
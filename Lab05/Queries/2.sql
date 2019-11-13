SELECT r_name, COUNT(s_acctbal)
--FROM region_acctbal, region, nation, supplier
FROM (SELECT r_name AS suppregion, AVG(s_acctbal) AS r_acctbal
      --renamed to provide easier resability and see what is being compared
      FROM region, nation, supplier
      --through this nested select a region average is created
      WHERE s_nationkey = n_nationkey 
            AND r_regionkey = n_regionkey 
            GROUP BY r_name), region , nation , supplier
WHERE r_name = suppregion
      AND s_acctbal > r_acctbal
      AND r_regionkey = n_regionkey 
      AND s_nationkey = n_nationkey
      GROUP BY r_name;
SELECT r_name, MAX(s_acctbal)
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey
      AND n_regionkey = r_regionkey
      GROUP BY r_name;
SELECT *
FROM (SELECT COUNT(*) AS num_supp, n_name, AVG(s_acctbal)
     FROM supplier, nation
     WHERE s_nationkey = n_nationkey
     GROUP BY n_name)
WHERE num_supp >= 5;
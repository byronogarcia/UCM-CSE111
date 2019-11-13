SELECT s_name, s_acctbal
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey
        AND n_regionkey = r_regionkey
        AND r_name = 'ASIA'
        AND s_acctbal > '1000';
SELECT n_name
FROM (SELECT n_name, MAX(largestNation)
      FROM (SELECT n_name, SUM(o_totalprice) AS largestNation
            FROM orders, nation, customer
            WHERE n_nationkey = c_nationkey
                  AND o_custkey = c_custkey
            GROUP BY n_name));
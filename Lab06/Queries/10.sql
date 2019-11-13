SELECT r_name
-- Returns the region
FROM (SELECT r_name, MAX(exact4)
      -- Max gets the most amount of money spent in a region
      FROM (SELECT r_name, SUM (l_extendedprice) AS exact4
            FROM region, nation, customer, supplier, lineitem
            WHERE r_regionkey = n_regionkey
                  AND n_nationkey = c_nationkey
                  AND s_nationkey = n_nationkey
                  AND l_suppkey = s_suppkey
            -- Gets the regions needed
            GROUP BY r_name));
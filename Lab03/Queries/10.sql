SELECT SUM(o_totalprice)
FROM nation, customer, orders, region
WHERE o_custkey = c_custkey
        AND c_nationkey = n_nationkey
        AND n_regionkey = r_regionkey
        AND r_name = 'EUROPE'
        AND o_orderdate >= '1996-01-01'
        AND o_orderdate <= '1996-12-31'
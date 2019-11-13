SELECT DISTINCT n_name
FROM nation, customer, orders
WHERE c_custkey = o_custkey 
        AND o_orderdate >= '1996-12-01' 
        AND o_orderdate <= '1996-12-31';
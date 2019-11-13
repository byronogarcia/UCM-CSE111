SELECT COUNT(*) AS totalitems, l_receiptdate
FROM lineitem, customer, orders
WHERE c_name = 'Customer#000000118' 
    AND c_custkey = o_custkey 
    AND o_orderkey = l_orderkey 
    GROUP BY l_receiptdate;
SELECT o_orderpriority, COUNT(*) 
FROM orders, lineitem
WHERE o_orderkey = l_orderkey
      AND l_commitdate > l_receiptdate
      AND o_orderdate LIKE '%1996%'
GROUP BY o_orderpriority;
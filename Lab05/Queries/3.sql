SELECT MAX(l_discount)
FROM (SELECT AVG(l_discount) AS avg_discount
      FROM lineitem), orders, lineitem
      --averagediscount, orders, lineitem
WHERE l_orderkey = o_orderkey
      AND o_orderdate LIKE '1995-05-%'
      AND avg_discount > l_discount;
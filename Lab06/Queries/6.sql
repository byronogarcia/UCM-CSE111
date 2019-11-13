SELECT s_name, c_name
-- Supplier-customer pairs
FROM supplier, customer, orders, lineitem
WHERE l_suppkey = s_suppkey
      AND o_orderkey = l_orderkey
      AND c_custkey = o_custkey
      -- Completed orders denoted by F
      AND o_orderstatus = 'F'
      -- Most expensive completed orders
      AND o_totalprice = (SELECT MAX(o_totalprice)
                          FROM orders
                          WHERE o_orderstatus = 'F');
                          -- Again showing completed orders
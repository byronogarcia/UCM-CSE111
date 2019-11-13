SELECT COUNT(DISTINCT(l_suppkey))
-- Distinct suppliers
FROM (SELECT l_suppkey, COUNT(DISTINCT o_orderkey) AS lessThan30
      -- Denoting the tuple as lessThan30
      FROM orders, lineitem, nation, customer
      -- Used or here to count the tuples from both
      WHERE (n_name = 'GERMANY' OR n_name = 'FRANCE')
             AND n_nationkey = c_nationkey
             AND c_custkey = o_custkey
             AND o_orderkey = l_orderkey
             GROUP BY l_suppkey) AS result
-- Here the tuples that meet the condition of less that 30 orders are accounted for
WHERE result.lessThan30 < 30;
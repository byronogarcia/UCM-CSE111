SELECT COUNT(DISTINCT(s_suppkey)) 
-- Distinct suppliers
FROM partsupp, part, supplier
WHERE p_partkey = ps_partkey
      AND s_suppkey = ps_suppkey
      -- Selecting the minimum retailprice
      AND p_retailprice = (SELECT MIN(p_retailprice)
                           FROM part);
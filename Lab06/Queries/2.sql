SELECT COUNT(atMostTwo)
FROM (SELECT COUNT(DISTINCT(o_custkey)) AS atMostTwo
      FROM customer, orders
      WHERE c_custkey = o_custkey
            -- Finding customers with orders in August 1995
            -- AND o_orderdate = '%1995-08%'
            AND o_orderdate LIKE '%1995-08%'
            GROUP BY o_custkey
            -- At most 2 orders
            HAVING COUNT(o_orderkey) <= 2);
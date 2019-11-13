SELECT COUNT(*)
FROM (SELECT COUNT(c_name) AS amtCust, l_discount, c_name
      FROM lineitem, orders, customer
      WHERE l_discount <= .04
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey
            GROUP BY c_name);
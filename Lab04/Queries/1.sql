SELECT c_name, SUM(o_totalprice), n_name
FROM (SELECT o_totalprice, c_custkey, o_custkey, c_name, n_name
      FROM orders, customer, nation 
      WHERE n_name = 'FRANCE' 
            AND orders.o_custkey = customer.c_custkey
            AND customer.c_nationkey = nation.n_nationkey)
      GROUP BY o_custkey;
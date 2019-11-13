SELECT (SELECT SUM(l_extendedprice*(1-l_discount)) 
--using the given l_extendedprice*(1-l_discount)
--looking for the sum of the fraction of revenues
       FROM lineitem, orders, customer, nation cn, region cr, supplier, nation sn 
       WHERE l_orderkey = o_orderkey 
             AND o_custkey = c_custkey 
             --using easier names than last time to keep track of
             AND c_nationkey = cn.n_nationkey 
             AND cn.n_regionkey = cr.r_regionkey 
             AND cr.r_name = 'EUROPE' 
             AND l_suppkey = s_suppkey 
             AND s_nationkey = sn.n_nationkey 
             AND sn.n_name = 'UNITED STATES' 
             --making sure to differentiate the market share of US in EU
             AND substr(l_shipdate,1,4) = '1996')/(SELECT SUM(l_extendedprice*(1-l_discount)) 
                                                   FROM lineitem, orders, customer, nation cn, region cr 
                                                   WHERE l_orderkey = o_orderkey 
                                                         AND o_custkey = c_custkey 
                                                         AND c_nationkey = cn.n_nationkey 
                                                         --specifying ship dates
                                                         AND cn.n_regionkey = cr.r_regionkey 
                                                         AND cr.r_name = 'EUROPE' 
                                                         AND substr(l_shipdate,1,4) = '1996');
--Questions for myself:
--Since there are limitations to SQL which can result in long queries like these,
-- is there any other way to solve this problem
-- is there a more readable and efficient way
-- What kind of syntax allows for easier readability?


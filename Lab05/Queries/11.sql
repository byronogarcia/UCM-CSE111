SELECT MAX(Val) 
FROM (SELECT l_extendedprice*(1-l_discount) AS Val
      FROM lineitem 
      WHERE l_shipdate > '1994-10-02' 
      ORDER BY (l_extendedprice*(1-l_discount))); 
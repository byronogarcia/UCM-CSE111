SELECT p_type, MAX(l_discount) 
FROM lineitem, part 
WHERE l_partkey = p_partkey 
      AND p_type LIKE '%ECONOMY%' 
      GROUP BY p_type 
      ORDER BY p_type;

SELECT l_quantity, l_extendedprice
FROM Lineitem
WHERE l_returnflag = 'N' AND l_shipdate = '1995-09-25';
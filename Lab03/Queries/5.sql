SELECT MIN(c_acctbal), MAX(c_acctbal)
FROM customer
WHERE c_mktsegment = 'BUILDING';
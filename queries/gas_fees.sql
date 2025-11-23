SELECT
    date_trunc('hour', block_time) as hour_of_day,
    SUM(cast(gas_used as double) * cast(gas_price as double)) / 1e18 as total_eth_spent
FROM ethereum.transactions
-- Uniswap Universal Router Address
WHERE "to" = 0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD
AND block_time > now() - interval '24' hour
GROUP BY 1
ORDER BY 1 ASC

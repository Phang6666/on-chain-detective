SELECT
    date_format(date_trunc('hour', block_time), '%H:%i') as hour_label,
    SUM(cast(gas_used as double) * cast(gas_price as double)) / 1e18 as total_eth_spent
FROM ethereum.transactions
-- Uniswap Universal Router
WHERE "to" = 0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD
AND block_time > now() - interval '24' hour
GROUP BY 1, date_trunc('hour', block_time)
-- Important: Sort by the hidden timestamp, not the label string
ORDER BY date_trunc('hour', block_time) ASC

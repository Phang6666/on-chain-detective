select
    evt_tx_hash as transaction_hash
    , "to" as wallet_address
    , value / 1e18 as amount_bought
from erc20_ethereum.evt_Transfer
where contract_address = 0x6982508145454Ce325dDbE47a25d4ec3d2311933 -- PEPE Contract Address
   and evt_block_time > now() - interval '24' hour
order by
    amount_bought desc
limit 10

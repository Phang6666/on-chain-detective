# On-Chain Detective: Market & Cost Analysis

### 1. Project Overview
I built this live dashboard to monitor high-value transactions and operational costs on the Ethereum network. The goal was to translate raw blockchain data into actionable insights for trading or product teams.

**[👉 Click Here to View Live Dashboard](https://dune.com/jet6666/crypto-market-activity-monitor)**

### 2. Business Questions Answered
* **Customer Segmentation:** Who are the high-net-worth individuals ("Whales") accumulating PEPE tokens right now?
* **Cost Analysis:** What are the peak times for transaction fees on the Uniswap protocol, and how does this impact user acquisition costs?

### 3. Technical Approach
* **Tool:** Dune Analytics (SQL based).
* **Data Structures:**
    * `erc20_ethereum.evt_Transfer`: Used to track token movements.
    * `ethereum.transactions`: Used to calculate gas consumption (Revenue/Cost).
* **Key SQL Concepts Used:** Aggregations (`SUM`, `COUNT`), Time-series grouping (`date_trunc`), and Data Normalization (adjusting for 18 decimal places).

### 4. Sample SQL Code
*See the /queries folder for full code.*

```sql
-- Example: calculating gas costs
SELECT
    date_trunc('hour', block_time) as hour,
    SUM(gas_used * effective_gas_price) / 1e18 as cost
FROM ethereum.transactions
GROUP BY 1

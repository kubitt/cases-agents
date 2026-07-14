---
name: ozon-data
description: Collects Ozon Seller API data and computes all metrics via the deterministic pipeline. Run on the scheduled collect task and whenever fresh numbers are needed before a report ("collect", "refresh data", "update").
---

# Skill: ozon-data — collect & compute

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

All collection and math is done by `files/scripts/pipeline.sh` (run `sh files/scripts/pipeline.sh`). Environment: use only `curl` and `jq` (python/node are blocked on the platform). Keys come from the environment (`OZON_CLIENT_ID`, `OZON_API_KEY`), set in Settings → Secrets — never in the command line or files.

## Endpoints (Ozon Seller API, https://api-seller.ozon.ru)
- `POST /v2/posting/fbo/list` — ORDERS (the sales source; финансовые проводки лагают и для продаж не используются). Gives products[].{sku, offer_id, name, quantity, price}, financial_data.products[].{commission_amount, payout, cluster_from, cluster_to}, analytics_data.{city, warehouse_name}, created_at, status.
- `POST /v2/analytics/stock_on_warehouses` — STOCK by warehouse.
- `POST /v3/product/list` — catalog (optional).

## Not available without extra access
Ads / ДРР — a separate Ozon Performance API (performance.ozon.ru, its own client_id/secret). Until connected, ad cost = 0 and ДРР is not computed.

## Output
`pipeline.sh` writes `files/data/results_profit.json` and `files/data/results_stock.json` — read by skills `profit` and `stock`. If cost prices are missing, `net_profit` is null and a note says so.

## Config (filled by the seller)
- `files/data/cost_prices.json` — cost by offer_id (required for profit).
- `files/data/clusters.json` — warehouse names (exactly as in the stock export) and lead times.

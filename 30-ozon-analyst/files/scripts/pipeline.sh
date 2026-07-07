#!/bin/sh
set -e
ROOT="$(CDPATH= cd "$(dirname "$0")/../.." && pwd)"
D="$ROOT/files/data"
S="$ROOT/files/scripts"
mkdir -p "$D"
: "${OZON_CLIENT_ID:?set OZON_CLIENT_ID}"
: "${OZON_API_KEY:?set OZON_API_KEY}"
TO="$(date -u +%Y-%m-%dT%H:%M:%S.000Z)"
NOW="$(date -u +%s)"
FROM="$(date -u -d @$((NOW - 604800)) +%Y-%m-%dT00:00:00.000Z)"
curl -s -X POST https://api-seller.ozon.ru/v2/posting/fbo/list \
  -H "Client-Id: $OZON_CLIENT_ID" -H "Api-Key: $OZON_API_KEY" -H "Content-Type: application/json" \
  -d "{\"dir\":\"DESC\",\"filter\":{\"since\":\"$FROM\",\"to\":\"$TO\"},\"limit\":1000,\"offset\":0,\"with\":{\"analytics_data\":true,\"financial_data\":true}}" > "$D/raw_postings.json"
curl -s -X POST https://api-seller.ozon.ru/v2/analytics/stock_on_warehouses \
  -H "Client-Id: $OZON_CLIENT_ID" -H "Api-Key: $OZON_API_KEY" -H "Content-Type: application/json" \
  -d '{"limit":1000,"offset":0,"warehouse_type":"ALL"}' > "$D/raw_stocks.json"
curl -s -X POST https://api-seller.ozon.ru/v3/product/list \
  -H "Client-Id: $OZON_CLIENT_ID" -H "Api-Key: $OZON_API_KEY" -H "Content-Type: application/json" \
  -d '{"filter":{"visibility":"ALL"},"last_id":"","limit":1000}' > "$D/raw_products.json"
jq -n --slurpfile post "$D/raw_postings.json" --slurpfile cost "$D/cost_prices.json" -f "$S/compute_profit.jq" > "$D/results_profit.json"
jq -n --slurpfile stk "$D/raw_stocks.json" --slurpfile prof "$D/results_profit.json" --slurpfile post "$D/raw_postings.json" --slurpfile clu "$D/clusters.json" -f "$S/compute_stock.jq" > "$D/results_stock.json"
echo "OK orders=$(jq '.result|length' "$D/raw_postings.json") offers=$(jq '.by_offer|length' "$D/results_profit.json") stock_rows=$(jq '.by_sku_warehouse|length' "$D/results_stock.json") revenue=$(jq '.totals.revenue' "$D/results_profit.json") ozon_net=$(jq '.totals.ozon_net' "$D/results_profit.json")"

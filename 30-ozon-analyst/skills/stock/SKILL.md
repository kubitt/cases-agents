---
name: stock
description: Builds the daily Ozon stock & localization report from files/data/results_stock.json. Triggers on "stock", "остатки", "локализация", "где дефицит", and inside the scheduled stock-report task.
---

# Skill: stock — daily stock & localization report

Answers one question: where does a stock-out cost the most. NOT "where to put goods" — prioritize by lost profit; the seller decides shipment quantities.

## Data
Source: `files/data/results_stock.json` (produced by `files/scripts/pipeline.sh`; do NOT compute yourself). Fields:
- `by_sku_warehouse[]`: {sku, name, warehouse, free_to_sell, ads, days_of_stock, horizon_days, at_risk, profit_per_unit, lost_profit}
- `risk[]`, `top_lost[]`, `demand_by_city[]`, `notes[]`
`days_of_stock` = stock / ADS. `horizon_days` = prep + delivery. `at_risk` = stock lasts less than the replenishment horizon.

## Principles
1. The main measure is lost sales in money (`lost_profit`), not a low stock number by itself.
2. Don't panic over a SKU that barely sells (ads≈0).
3. Distinguish "out everywhere" from "out in a cluster where there is demand."

## Telegram format (same rules: no tables/#, short lines, emoji as section markers)
📦 Ozon · остатки на <date>
🚨 Риск нехватки: позиции с риском по убыванию lost_profit; остаток в днях, ADS, когда отгружать.
🗺 Локализация: где спрос (demand_by_city); где спрос есть, а товара мало/нет.
✅ Действия (по цене отсутствия): до 3 приоритетов.
If there is no lost profit yet — say so honestly and show current stock levels.

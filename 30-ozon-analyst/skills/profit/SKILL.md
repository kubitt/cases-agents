---
name: profit
description: Builds the daily Ozon profit report from files/data/results_profit.json. Triggers on "profit", "прибыль", "money report", and inside the scheduled profit-report task.
---

# Skill: profit — daily profit report (main)

Answers one question: where are we losing money and how to earn more. Conclusions only in money.

## Data
Source: `files/data/results_profit.json` (produced by `files/scripts/pipeline.sh`; do NOT compute numbers yourself). Fields:
- `totals`: {orders, units, revenue, ozon_net, net_profit}
- `by_offer[]`: {offer, sku, name, units, revenue, commission, ozon_net, cogs, ad_cost, net_profit, margin_pct, drr_pct, profit_share_pct}
- `notes[]`
`ozon_net` = Ozon payout after commissions. `net_profit` = ozon_net − cost − ads. If `net_profit` is null → cost prices not filled: say so plainly, don't invent profit.

## Principles
1. Only by profit; a high ДРР is not a problem if the SKU has a large profit share.
2. Don't touch SKUs that carry profit.
3. Before advising "advertise more" or "raise price," check stock (`results_stock.json`) — don't push a SKU that's about to run out.
4. Max 3 recommendations.
5. No data → say so. Ads not counted until Performance API is connected — note it.

## Telegram format (no markdown tables or #, short lines, emoji as section markers, ₽, % to 1 decimal)
📊 Ozon · прибыль за <date>
💰 Деньги: выручка и выплата Ozon за 7 дней, чистая прибыль, лучший/худший SKU.
📉 Потери: где теряем (высокая комиссия, низкая маржа).
✅ Действия: до 3 рекомендаций «что → по какому SKU → эффект в ₽».

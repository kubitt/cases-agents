---
name: price-report
description: Format the morning price summary and update the history table. Use right after price-diff to deliver the daily report.
---

# Price report

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: deliver a short, scannable summary of what changed and store today's values as the new baseline — so tomorrow's diff is accurate.

## Algorithm
1. Take the change list from price-diff.
2. If there are no real changes and no flags, send one line: "📊 Price watch — {date}: No changes ✅". Then go to step 5.
3. Otherwise build the summary: one numbered line per change — competitor / item / was → now / delta %. Group increases, decreases, promos, and flags. Keep it under ~15 lines; if longer, list the top changes and note "+N more in the sheet".
4. Send the summary to the notification channel (Telegram by default).
5. Append today's values to the "Competitor Prices" history (date, competitor, item, price, currency, period, raw) so they become the new baseline. Mark unavailable items so they're retried tomorrow (don't overwrite good data with a blank).
6. Log a one-line run record (date, competitors checked, changes, flags).

## Output (Telegram summary)
```
📊 Price watch — 2026-07-13
Increases:
1. Acme / Pro: $49 → $59 /mo (+20.4%)
Promos:
2. Acme: 20% off annual until Jul 31
Flags:
3. ⚠️ Globex: site unavailable
Total: 2 changes, 1 flag across 4 competitors. Full history: [sheet link]
```

## Edge cases
- All competitors unavailable → send "⚠️ Could not reach any competitor site today — will retry tomorrow", keep yesterday's baseline intact.
- Very many changes at once (e.g., a competitor rebranded pricing) → summarize the competitor in one block, put per-item detail in the sheet, link it.
- Delivery channel down → keep the report in files/ and retry next run; never silently drop a report.
- Report scheduled outside the notification window → hold the message until the window opens (unless it's a critical alert), history still updates on time.

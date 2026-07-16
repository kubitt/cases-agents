---
name: dashboard-build
description: The core build — read every registered metric, compute changes and status, render the HTML dashboard and CSV snapshot, append history, and send the summary. Use during the Morning dashboard build task or when the user says "refresh the dashboard".
---

# Dashboard build

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce one honest, current dashboard — a readable HTML file, a CSV snapshot, and a short summary — from the registered metrics, and grow the history so trends compound. This step writes and runs a small Python helper in files/scripts/.

## Algorithm
1. Read "Metrics Registry" (metric_name, source, source_ref, unit, good_direction, warn_threshold, target, notes).
2. For each metric, read its current value from its source: a Google Sheets cell/range, or a public number via web search. If a source is unreadable, set value blank and status=no_data — never guess.
3. Find each metric's previous reading in "Metrics History" (date, metric_name, value, delta_abs, delta_pct, status). Run files/scripts/compute.py: delta_abs = value - prev; delta_pct = delta_abs / prev * 100 (blank if no prev). Status per knowledge/METRIC_DEFINITIONS.md: up → breach if value < warn_threshold, on_target if value >= target, else watch; down → mirror. Blank threshold/target → status "—".
4. Append today's rows to "Metrics History".
5. Render files/dashboard.html: one card per metric (name, value+unit, delta_pct with up/down arrow, a colored status dot, a small inline SVG sparkline from the last readings) plus a header with the date. Write files/dashboard_snapshot.csv with today's rows. If Drive is connected, save both to the "Dashboard" folder; if Docs is connected, update the "Dashboard Summary" doc.
6. Build the summary: top movers by absolute delta_pct, any status=breach, the on-target count, and links to the files. Send it to the notification channel.

## Output
```
Dashboard — 2026-07-16 08:00  (6 on target, 2 watch, 1 breach)
Top movers: New signups +18% (420) | MRR +3% ($42,300)
Breach: trial-to-paid 7.1% (warn below 9%)
No data: ad spend (source unreadable — check Ads!B2)
Files: dashboard.html, dashboard_snapshot.csv (Drive/Dashboard)
```

## Edge cases
- A source is unreadable → that metric shows status=no_data on the card and a "No data" line in the summary; the rest of the dashboard still builds.
- A metric has only one reading so far → show the value with delta "—" and label it "new — no trend"; do not draw a sparkline through a single point.
- Every source fails → do not send an empty dashboard; send a short "build failed to read all sources" alert (a critical alert may go out even off-window) and keep the last good files.
- A value looks impossible (e.g., a percent above 100 or a negative count) → flag it on the card as "check source", keep the raw value, and note it in the summary instead of silently correcting it.

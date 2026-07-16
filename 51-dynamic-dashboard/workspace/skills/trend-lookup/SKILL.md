---
name: trend-lookup
description: Answer a historical question about a metric from "Metrics History" — trend, average, min/max over a period, with a small chart. Use when the user asks "how did {metric} trend over 30 days?", "what's the average {metric} this month?", or similar.
---

# Trend lookup

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: answer a specific question about how a metric moved over a period, using only the readings already in "Metrics History" — with a short, honest chart and no invented points.

## Algorithm
1. Parse the metric_name and the period from the question (default: last 30 days).
2. Pull all "Metrics History" rows for that metric_name in range (columns: date, metric_name, value, delta_abs, delta_pct, status).
3. If fewer than two readings exist in range → say so and stop; do not draw a trend from a single point or fabricate the missing dates.
4. Run files/scripts/trend.py over the values: first, last, change over period (absolute + percent), average, min, max, and the count of readings.
5. Render a small inline SVG line chart of value over date; save it into dashboard.html's history section or a standalone files/trend_{metric}.html.
6. Reply with the numbers plus the chart link; note any gaps (dates with no reading) rather than interpolating across them.

## Output
```
New signups — last 30 days (22 readings)
Start 356 -> latest 420  |  change +64 (+18.0%)
Average 389 | min 331 | max 452
2 days missing (no reading recorded) — shown as gaps, not interpolated.
Chart: files/trend_new-signups.html
```

## Edge cases
- Fewer than two readings in the period → reply "not enough history yet — need at least two readings"; do not chart a single point.
- Metric not in "Metrics History" → check the "Metrics Registry"; if it exists but has never been read, say "registered but no readings yet"; if unknown, list the tracked metrics.
- Gaps in the dates (skipped builds) → show them as gaps in the chart and note the missing dates; never interpolate a value to fill them.
- The user asks for a future projection → give the observed trend only and state plainly that this is history, not a forecast; correlation is not causation.

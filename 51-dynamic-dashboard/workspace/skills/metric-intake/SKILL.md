---
name: metric-intake
description: Add, edit, or remove a metric in the "Metrics Registry" — its source, unit, direction, threshold, and target. Use when the user says "track {metric}", "add a metric", "change the threshold for {metric}", or during onboarding Step 5.
---

# Metric intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a plainly described metric into one clean, readable row in the "Metrics Registry" so the daily build can read it without guesswork. Confirm the source is reachable before saving.

## Algorithm
1. Get the metric name and unit from the user (e.g., "trial-to-paid", unit "%").
2. Get the source and its reference: source=sheet with source_ref like "Funnel!B7" (a Google Sheets cell/range), or source=web with source_ref = the public URL plus what number to read from it. If neither is reachable, set source=none and mark the metric no_data.
3. Get good_direction (up = higher is better, down = lower is better), warn_threshold (blank if none), and target (blank if none).
4. Do one live read of the source to confirm it returns a number; if it fails, tell the user exactly what failed and save the row with source=none / no_data rather than a guess.
5. Append or update the row in "Metrics Registry" with columns: metric_name, source, source_ref, unit, good_direction, warn_threshold, target, notes. Keep one row per metric_name (no duplicates).
6. Confirm back in one line and note whether the source read succeeded.

## Output
```
Added to Metrics Registry:
- metric_name: trial-to-paid | unit: % | source: sheet | source_ref: Funnel!B7
- good_direction: up | warn_threshold: 9 | target: 12
Live read OK: current value 10.4%. It will appear on tomorrow's dashboard (or say "refresh the dashboard" to build now).
```

## Edge cases
- Source cannot be read (bad cell, dead URL, page changed) → save with source=none and status no_data; report exactly what failed, don't invent a value.
- Metric name already exists → update that row in place; never create a duplicate row for the same metric_name.
- No threshold or target given → leave both blank; the dashboard then shows value and change only, with status "watch" suppressed to "—".
- Ambiguous unit or a percent given as 0.1 vs 10 → confirm the unit with the user before saving so deltas are computed on a consistent scale.

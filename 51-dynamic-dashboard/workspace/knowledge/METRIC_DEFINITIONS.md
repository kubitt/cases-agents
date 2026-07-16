# Metric Definitions

> Your reference file: the rules the agent uses to compute change and status, and how the dashboard is drawn. The agent reads it before every build. Edit freely to tune the dashboard.
[FILLED DURING ONBOARDING — user-tunable; the agent follows the current version]

## Registry columns (one row per metric in the "Metrics Registry")
- metric_name: short label shown on the card
- source: sheet / web / none
- source_ref: the Google Sheets cell/range (e.g., Funnel!B7) or the public URL + what number to read
- unit: $, %, count, or a custom label
- good_direction: up (higher is better) or down (lower is better)
- warn_threshold: [FILL DURING ONBOARDING — the value at which the metric moves to breach; blank = no status]
- target: [FILL DURING ONBOARDING — the value at which the metric is on_target; blank = no status]
- notes: any context

## History columns (one row per metric per build in "Metrics History")
- date, metric_name, value, delta_abs, delta_pct, status

## Status rubric (computed by the Python script, never eyeballed)
- good_direction=up: breach if value < warn_threshold; on_target if value >= target; otherwise watch
- good_direction=down: breach if value > warn_threshold; on_target if value <= target; otherwise watch
- warn_threshold and target both blank: status is "—" (value and change shown, no judgement)
- value missing / source unreadable: status = no_data (never guessed)

## Rendering rules
- One card per metric: name, value + unit, delta_pct with an up/down arrow, a status dot (green on_target, amber watch, red breach, grey no_data), and a small inline SVG sparkline.
- A metric with one reading: show value, delta "—", label "new — no trend".
- Order cards by the "Metrics to track" list in DASHBOARD_PROFILE.md.

## Example filled
- trial-to-paid: source=sheet, source_ref=Funnel!B7, unit=%, good_direction=up, warn_threshold=9, target=12
  -> value 7.1 -> below warn 9 -> status breach (red), delta_pct vs previous shown
- ad spend: source=sheet, source_ref=Ads!B2, unit=$, good_direction=down, warn_threshold=5000, target=3000
  -> value 4200 -> between target and warn -> status watch (amber)

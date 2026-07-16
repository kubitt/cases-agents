---
name: earnings-calendar-scan
description: The weekly look-ahead. Scan the upcoming earnings calendar by web search, filter to the watchlist, and log confirmed report dates. Use during the weekly preview task or on "what reports this week / next week".
---

# Earnings calendar scan

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce a factual week-ahead preview of which watchlist companies report, and log every confirmed report_date and report_time into the Google Sheet "Earnings Log".

## Algorithm
1. Read the tracked companies from knowledge/WATCHLIST.md.
2. For the target week, web-search each company's next earnings date from reputable sources (investor-relations pages, exchange calendars, established financial media). Record report_date, report_time (BMO before open / AMC after close / TBD), and fiscal_period.
3. Cross-check the date against two sources when possible; if they disagree, log report_date as TBD and note both dates in highlights with their source_url.
4. Write or update one row per reporting company in "Earnings Log": ticker, company, report_date, report_time, fiscal_period, status=scheduled, source_url. Do not overwrite results already recorded.
5. Build the preview list, sorted by report_date, for delivery to the user's channel.

## Output
```
Earnings next week (Mar 10–14) — 4 of your companies report:
- ORCL — Oracle — Mon Mar 10, AMC (Q3 FY25)
- NVDA — NVIDIA — Wed Mar 12, AMC (Q4 FY25)
- AVGO — Broadcom — Thu Mar 13, AMC (Q1 FY25)
- ADBE — Adobe — Thu Mar 13, AMC (Q1 FY25)
Logged to "Earnings Log". Not financial advice.
```

## Edge cases
- No confirmed date found → log status=scheduled with report_date TBD and the estimate's source_url; tell the user it is unconfirmed.
- Nothing on the watchlist reports that week → send a one-line "nothing on your watchlist reports this week"; do not pad the list.
- Date moved since the last scan → update the row and flag the change in the preview.
- Sources disagree on the date → log TBD, show both dates with sources, and do not pick one silently.

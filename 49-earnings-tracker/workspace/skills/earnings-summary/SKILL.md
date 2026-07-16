---
name: earnings-summary
description: After a watchlist company reports, pull the results and deliver a fact-only summary — beat/miss, revenue, EPS, guidance, highlights, each with a source. Use during the daily results check or on "summarize {company} earnings".
---

# Earnings summary

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a fresh earnings report into an accurate, sourced summary and record it in the Google Sheet "Earnings Log" — never an opinion on whether to buy, sell, or hold.

## Algorithm
1. Take the company row from "Earnings Log" whose report_date has passed and status is still scheduled.
2. Web-search the results from reputable sources (the company press release / IR page first, then established financial media). Extract revenue_actual and revenue_estimate (consensus), eps_actual and eps_estimate, guidance, and 2–4 highlights per the user's interests in knowledge/SUMMARY_FORMAT.md (e.g., AI/segment growth).
3. Set beat_miss for revenue and EPS by comparing actual versus estimate, naming the source of each consensus figure. If no consensus is available, mark "no consensus found" — do not invent one.
4. If sources disagree on a figure, record both verbatim with their source_url and flag it; never average or smooth them.
5. Write the numbers to the row (status=reported, source_url, updated_at) and deliver the summary per knowledge/SUMMARY_FORMAT.md, ending with the not-financial-advice note.

## Output
```
NVDA — NVIDIA — Q4 FY25 (reported Feb 26, AMC)
Revenue: $39.3B actual vs $38.1B est — BEAT (+3.1%)
EPS: $0.89 actual vs $0.85 est — BEAT
Guidance: Q1 revenue about $43B, above the ~$42B consensus
Highlights: data-center revenue +93% YoY; Blackwell ramp ongoing
Source: NVIDIA press release, Reuters. Logged to "Earnings Log".
Facts only — not financial advice.
```

## Edge cases
- Results not published yet → leave status=scheduled, tell the user it has not reported, check again next run; never fabricate numbers.
- No analyst consensus available → report actuals only and mark beat_miss "no consensus found".
- Sources disagree on a figure → show both with their sources, flag the discrepancy, do not pick one.
- User asks "should I buy or sell?" → decline and restate that this is facts-only and not financial advice.

---
name: watchlist-setup
description: Capture, edit, or clean the list of companies the user tracks. Use when the user says "track X", "add/remove company", pastes tickers, or during onboarding.
---

# Watchlist setup

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: keep an accurate, de-duplicated list of the companies the user tracks — each with a confirmed ticker and an optional sector tag — saved to knowledge/WATCHLIST.md and mirrored as rows in the Google Sheet "Earnings Log".

## Algorithm
1. Take the companies from the user (names, tickers, or a pasted list). For each, confirm the official ticker and exchange by web search; if a name is ambiguous, ask which company is meant — never guess the ticker.
2. Normalize: one entry per company — uppercase ticker, official company name, optional sector tag (e.g., AI/semis, cloud, consumer).
3. De-duplicate against the current WATCHLIST.md: skip exact repeats, and point out near-matches for the user to confirm.
4. Save the list to knowledge/WATCHLIST.md, and ensure each company has a row in "Earnings Log" (ticker, company filled; report_date and status left blank until the next calendar scan fills them).
5. Confirm back the companies added and removed, and the new total count.

## Output
```
Watchlist updated (12 companies):
+ NVDA — NVIDIA (AI/semis)
+ MSFT — Microsoft (cloud/AI)
- SNAP — removed on your request
2 already tracked, skipped. The next weekly scan will fill report dates into "Earnings Log".
```

## Edge cases
- Ambiguous or delisted name → ask the user to confirm ticker/exchange; do not add a guessed ticker.
- Duplicate already on the list → skip it and tell the user it was already tracked.
- Very large list (50+ tickers) → warn that weekly scans cost more credits and offer to prioritize a core set.
- Private company or no public ticker → note that it cannot be earnings-tracked and leave it off the list.

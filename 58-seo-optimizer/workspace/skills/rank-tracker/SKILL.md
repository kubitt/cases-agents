---
name: rank-tracker
description: Pull ranking and traffic data from Google Search Console and compare periods. Use when the user asks "how are we ranking?", wants a traffic snapshot, or during the weekly Monday report.
---

# Rank tracker

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: show whether search traffic is rising or falling, and where the fastest wins are — grounded in real Search Console numbers.

## Algorithm
1. Set the periods: the requested window (default last 7 days) and the equal window before it, for comparison.
2. Pull Google Search Console for the connected property: clicks, impressions, CTR, and average position, broken out by query and by page.
3. Append one dated row per tracked query and page to the "Rank Tracker" tab of "SEO Tracker" (columns: date, item, item_type, clicks, impressions, ctr, position, position_change, clicks_change, opportunity, notes). item_type is "query" or "page".
4. Compute position_change and clicks_change vs the prior period (a smaller position number is better).
5. Find opportunities: striking-distance keywords are queries at position 8–20 with real impressions — one improvement from page one; mark opportunity = "striking-distance". Pages with a big clicks drop → mark opportunity = "refresh".
6. Sort: biggest gainers, biggest losers, and top opportunities. Keep the top 3 of each.
7. Deliver a short summary (max 15 lines); never invent numbers for missing periods.

## Output
Chat/Telegram summary plus rows in "Rank Tracker". Example:
- Clicks: 1,240 (+8% vs last week). Impressions: 41,300 (+3%). Avg position: 18.4 (improved 1.1).
- Top opportunity: "dental crm pricing" position 9, 620 impressions, 0.9% CTR — striking-distance, push /pricing.
- Biggest loser: /blog/old-guide, clicks_change -42 — opportunity: refresh.

## Edge cases
- Search Console not connected or returns nothing → report "data not provided for period" and stop; do not estimate.
- Very small numbers (few clicks in a slice) → flag low-confidence; do not draw trends from noise.
- Google data delay (last 2–3 days often incomplete) → note it and use the most recent complete day as the cutoff.
- A ranking spike or drop with no matching change on the page → label it a hypothesis (possible algorithm update or seasonality), not a proven cause.

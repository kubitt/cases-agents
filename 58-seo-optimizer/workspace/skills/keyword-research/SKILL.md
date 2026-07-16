---
name: keyword-research
description: Build or expand a clustered keyword map. Use when the user says "find keywords for X", "build a keyword map", plans a new topic, or wants to know what to target next.
---

# Keyword research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a seed topic and the site's real search data into a short, prioritized keyword map — each keyword tied to one target page.

## Algorithm
1. Gather seeds: the user's topic, brand terms from SITE_PROFILE.md, and — if Search Console is connected — the queries already bringing impressions (these are proven demand).
2. Expand: for each seed, run web searches and read the "People also ask" and related searches; collect real variations people type. Read 2–3 competitor pages (SITE_PROFILE.md) for terms they target.
3. Cluster: group keywords that share the same answer into one cluster (one cluster = one page, not one page per keyword).
4. Tag intent per keyword: informational (learning), commercial (comparing), or transactional (ready to buy/act).
5. Estimate difficulty from the live results, not a paid tool: strong brands and lots of in-depth pages on page one = harder. Label it "estimate". Mark volume "estimate" too.
6. Map each cluster to a target_page (existing URL or "new"), set priority = high demand + reachable difficulty + close to money.
7. Write rows to the "Keyword Map" tab of "SEO Tracker" (columns: keyword, cluster, intent, target_page, difficulty, position, priority, notes). Fill position from Search Console if available.

## Output
Chat summary plus rows in "Keyword Map". Example row set:
- keyword: best crm for dentists | cluster: dental-crm | intent: commercial | target_page: /dental-crm | difficulty: medium (estimate) | position: 14 | priority: high | notes: competitor acme ranks #3, thin content there
- keyword: how to reduce no-shows | cluster: no-shows | intent: informational | target_page: new | difficulty: low (estimate) | position: — | priority: medium | notes: strong "people also ask" demand

## Edge cases
- No Search Console access → work from seeds and competitor pages only; note that positions are blank until connected.
- Keyword already in the map → update the existing row, do not duplicate; note the change in notes.
- Ambiguous intent (could be several) → pick the dominant one from the live results and note the secondary in notes; never guess silently.
- Seed too broad (e.g. "marketing") → ask the user to narrow, or propose 3 sub-topics and continue on the chosen one.

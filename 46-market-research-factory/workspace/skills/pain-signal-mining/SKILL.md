---
name: pain-signal-mining
description: Collect real user pain quotes for a topic from public sources. Use when the user says "research pain around {topic}", during the weekly mining run, or when adding a new topic to watch.
---

# Pain signal mining

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: gather real, sourced complaints and feature requests about a topic — the raw material for opportunities — without inventing anything.

## Algorithm
1. Read knowledge/RESEARCH_PROFILE.md for the topic's sources and audience. If a last_run marker exists in memory, only keep items surfaced since then.
2. Build 4–6 web searches per topic mixing pain language with the sources, e.g. "{topic} frustrating", "{topic} I wish", "{topic} site:reddit.com", "{topic} alternative to", "{topic} reviews complaints".
3. Open the most relevant public pages and read them. Extract each distinct complaint or feature request as: a short verbatim quote (under 15 words), the source URL, and the date if shown.
4. Tag each signal with a provisional pain_cluster (a plain 2–4 word label) so ranking can group them later.
5. Dedupe against source_urls already in Google Sheets "Opportunity Ledger"; skip anything already logged.
6. Append each new signal as a row: date, topic, pain_cluster, mentions=1, example_quote, source_urls, opportunity (leave blank), opportunity_score (blank), existing_solutions (blank), status=new, brief_link (blank), notes (source date / context). Report a count of new signals and the clusters seen.

## Output (rows added to "Opportunity Ledger", summary to the user)
```
Topic: freelance invoicing — 9 new signals across 4 clusters
- late-payment chasing (4): "chasing invoices eats my whole Friday" [reddit.com/r/freelance/...]
- multi-currency mess (2): "no clean way to invoice in USD and EUR" [g2.com/...]
- clunky recurring bills (2) | tax-export pain (1)
Logged as status=new; run opportunity-ranking to cluster and score.
```

## Edge cases
- No pain found / quiet topic → report "insufficient signal" for that topic, log nothing, and suggest a broader or adjacent search term. Never pad with invented quotes.
- Source unreachable or login-gated → skip it, note it in the summary, and continue with public pages; cap effort at a few minutes per topic.
- Same complaint from several places → keep separate rows with distinct source_urls (ranking counts them as mentions); do not merge yet.
- Quote longer than a short snippet → paraphrase in your own words and keep the URL; never paste whole posts or reviews.

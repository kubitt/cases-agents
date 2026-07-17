---
name: competitor-pricing-research
description: Research and structure competitors' public pricing and packaging from their pricing pages, then flag the price and packaging gap the user could own. Use on "research competitor pricing", "how do rivals package this", when adding a competitor, and inside the quarterly repricing review.
---

# Competitor pricing research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Turn competitors' public pricing pages into a clean, comparable record and a clear read of the price and packaging position the user could own — every number traceable to its source page, nothing invented.

## Algorithm
1. Read the competitor list from knowledge/PRODUCT_PROFILE.md (name + pricing URL); if a URL is missing, find the official pricing page via web search.
2. For each competitor, read the public pricing page with built-in web reading. Capture each plan: plan name, price, billing period (monthly/annual), and 2–4 key features.
3. Note the positioning signal on the page: who each plan targets and the headline promise (this goes in positioning_note).
4. Record every row in Google Sheets "Competitor Pricing" (columns: competitor, plan, price, billing, key_features, positioning_note, source_url). Put the exact page URL in source_url. If a price can't be read, write "unknown" — never guess or carry a stale number.
5. Analyze the field: where prices cluster, which tiers exist, and which segment or price band is thinly served — the gap the user could own.
6. Summarize in chat: the market range, the notable packaging patterns, and the gap, with facts (source URLs) separated from judgment.

## Output
Written to "Competitor Pricing" and summarized in chat:
```
Competitor Pricing (read 2026-07-17)
- Acme | Pro | $49 | monthly | tasks, 10 users, integrations | "for growing teams" | acme.com/pricing
- Globex | Team | $79 | monthly | tasks, SSO, reporting | "enterprise-ready" | globex.io/pricing
- Initech | Free | $0 | — | tasks, 3 users | "start free" | initech.com/pricing
Market range: $0 free entry, paid tiers cluster $49–$79/mo.
Gap you could own: no one prices a $25–35 tier aimed at small agencies with margin reporting (judgment).
```

## Edge cases
- Pricing hidden behind "contact sales" → record the plan as "custom / contact sales", price "unknown"; do not estimate.
- JS-heavy page that returns no prices with built-in reading → mark the competitor "unreadable", note it, and suggest the optional Firecrawl upgrade rather than guessing.
- A competitor changed its page structure since last time → capture what is visible, flag "verify", never carry the old number as if fresh.
- Duplicate competitor already in the sheet → update the existing rows rather than adding new ones; note the refresh date.

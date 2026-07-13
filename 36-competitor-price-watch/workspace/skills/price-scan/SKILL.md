---
name: price-scan
description: Fetch each competitor's pricing page and extract the tracked prices. Use on the daily run, on "check prices now", or when adding a new competitor.
---

# Price scan

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: read every competitor's public pricing page and pull the current numbers into a clean per-competitor record — reliably, never inventing a value.

## Algorithm
1. Read the competitor list from Google Sheets "Competitor Prices": name, pricing_url, what_to_track (plans/products), and the parsing hint per competitor.
2. For each competitor, fetch the pricing page: built-in web reading first; if the page is JS-heavy and returns no prices, use Firecrawl (secret FIRECRAWL_API_KEY) if connected.
3. Extract the tracked values using knowledge/PRICE_PARSING.md hints: plan name → price, currency, billing period (monthly/annual), and any visible discount/promo.
4. Normalize: strip currency symbols to a number + currency code; note the period; keep the raw string too for verification.
5. If a value can't be found, mark it `unreadable` for that item (do not guess); if the whole page failed, mark the competitor `unavailable` with the reason.
6. Hand the per-competitor records to price-diff.

## Output (records handed to price-diff)
```
Competitor: Acme | acme.com/pricing | read 2026-07-13 08:02
- Starter: 19 USD/mo (raw "$19/month") — ok
- Pro: 49 USD/mo (raw "$49/month") — ok
- Promo: "20% off annual until Jul 31" — noted
Competitor: Globex | globex.io/prices — ⚠️ unavailable (timeout)
```

## Edge cases
- JS-rendered page returns no prices with built-in fetch → retry via Firecrawl; if still empty, mark `unreadable`, don't guess.
- Price shown as "from $X" or a range → capture as a range, note it's a "from" price.
- Currency or period changed (e.g., switched to annual-only display) → capture the new period explicitly so price-diff compares like-for-like.
- Page structure changed and hint no longer matches → mark `unreadable`, flag "parsing hint needs update" for the user.
- More than ~30 competitors → process in batches, report progress, respect polite request spacing.

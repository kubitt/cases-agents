---
name: battlecard-builder
description: Build or refresh a one-page competitor battlecard. Use on "build a battlecard for <competitor>", when a new competitor shows up in a deal, and during the weekly enablement refresh task.
---

# Battlecard builder

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a one-page, honest card per competitor that a seller can glance at mid-deal — where we win, where they win, and the trap questions to plant.

## Algorithm
1. Read knowledge/COMPETITOR_BATTLECARDS.md (your standing positioning) and the current card in the "Battlecard Library" Doc if one exists.
2. Research the competitor on the open web: pricing, positioning, recent launches, and public reviews (last 6 months). Record a source URL for every claim; no source, mark it "unverified".
3. Fill five sections: their strengths, their weaknesses, where we win, where they win, and 2–3 trap-setting discovery questions that expose their weak spots.
4. Keep it honest — no invented flaws, no dismissing real strengths. If a comparison depends on the buyer's situation, say so.
5. Write or update the competitor's section in the "Battlecard Library" Doc; note the refresh date and sources. Flag any big change (new pricing, acquisition) in the weekly digest.

## Output
```
Battlecard: RackBot (refreshed 2026-07-16)
Their strengths: lower sticker price; strong SMB brand (source: rackbot.com/pricing).
Their weaknesses: no retrofit — rip-and-replace only (source: g2 reviews, 3 cited).
Where we win: 3-week retrofit vs their 9-month install; peak-season SLA.
Where they win: budget-first buyers under 50 staff.
Trap questions: "Can it run alongside your current racking?" "What's their install downtime?"
```

## Edge cases
- Thin public data on the competitor → build from your own positioning, mark web sections "unverified", ask the seller for field intel.
- Conflicting sources (e.g. pricing) → show the range and cite both; do not pick one silently.
- Competitor not seen before → create a new section, and add it to knowledge/COMPETITOR_BATTLECARDS.md so future briefs know it.

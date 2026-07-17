# Pricing & Positioning Advisor

Decide what to charge, how to package your tiers, and how to position against competitors — with framework-grounded recommendations instead of a $300–500/hr consultant.

## Value & ROI
A pricing consultant runs $300–500/hr and a positioning engagement $2,000–10,000. This agent applies the same frameworks — value-based pricing, good-better-best tiers, willingness-to-pay, anchoring — to your real costs and researched competitor prices, for $29/mo (ASCN Start, 10,000 credits). No external APIs, no keys, no per-use cost — native web reading, Google Sheets, and Google Docs only. Total cost: $29/mo. Payback vs $29: one better-set price or one extra tier that lands a single additional conversion, or a 10% lift in average revenue per customer, clears the subscription many times over. The recurring value is the quarterly repricing review and the monthly positioning-drift check — not a one-shot.

## What it does
1. Captures your product, costs, target margin, segment, and competitors in a product profile it maintains as it learns.
2. Researches competitors' public pricing and packaging into Google Sheets "Competitor Pricing" (competitor, plan, price, billing, key_features, positioning_note, source_url), each row citing its source page.
3. Recommends a price and good-better-best tiers into Google Sheets "Pricing Model" (tier, price, billing, features_included, target_segment, rationale, margin, notes), with explicit rationale and a cost-plus margin floor.
4. Builds a positioning statement plus 3 messaging pillars into the Google Doc "Positioning Brief" (April Dunford style: category, target segment, competitive alternative, unique value, proof).
5. Flags the price and packaging gap you could own versus the field.
6. Quarterly: re-researches competitor pricing and proposes adjustments. Monthly: a light positioning-drift check that notifies you only on a notable move.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (product and costs, competitors, Sheets and Docs, then a first real pricing and positioning pass).

## Required integrations
Native: Google Sheets (required — the two pricing tables), Google Docs (recommended — the "Positioning Brief"), built-in web reading (required, free). External: none. Channel: Telegram (recommended for the review notifications). Secrets: none.

## Deliberate limitations
- It is advisory — it recommends, you decide and implement.
- Competitor pricing comes from public pricing pages only; private or negotiated deals are invisible.
- It does not run live price A/B tests — that is agents 42 CRO and 43 Growth Experiment Engine.
- For raw daily competitor-price monitoring, pair it with agent 38 Competitor Price Watch; this agent is the strategic-interpretation layer on top of that raw feed.
- Recommendations are framework-based reasoning, not a guarantee, and are only as good as the real costs and margins you provide.
- This is business pricing strategy, NOT personalized financial or investment advice.

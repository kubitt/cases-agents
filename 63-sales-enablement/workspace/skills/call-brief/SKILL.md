---
name: call-brief
description: Prepare a one-page pre-meeting brief with discovery questions. Use before any sales meeting, on "brief me on <account>", and during the overnight brief prep task for each of today's calendar meetings.
---

# Call brief

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: in one page, give the seller everything to walk into the meeting ready — who is in the room, what to ask, what they will push back on, and how to win versus the competitor.

## Algorithm
1. Read the "Deal Room Tracker" row for the account (stage, last_touch, open_objections, notes) and knowledge/SALES_PROFILE.md (offer, methodology, stages).
2. Research from the open web: the company (what they do, size, recent news, hiring, funding) and each named attendee (title, tenure, focus). Record a source URL for every fact; no source, mark it "unverified".
3. Map attendees to buying-committee roles: Economic Buyer, Champion, Technical Evaluator, User, Coach, Blocker. Roles are inferred from titles — label them inferred.
4. Draft 5–7 discovery questions using the methodology in SALES_PROFILE.md (SPIN: situation, problem, implication, need-payoff — or MEDDPICC gaps if that is the method). Tie each question to this account's likely pain.
5. List the 2–3 likely objections (from open_objections and knowledge/COMPETITOR_BATTLECARDS.md) with a one-line suggested response each. Pull the matching competitor card from the "Battlecard Library".
6. Save as a Google Doc "Call Brief — account — date"; write the link into the tracker column brief_link.

## Output
```
Call Brief — Northwind Logistics — 2026-07-18, 14:00 (Demo)
Account: 3PL, ~400 staff, opened a Dallas hub in June (source: northwind.com/news). Hiring 6 ops roles = scaling pain (unverified: LinkedIn count).
Room: Dana Ruiz, VP Ops — likely Economic Buyer (inferred). Sam Ito, Ops Lead — Champion, requested the demo.
Discovery (SPIN): 1) How is the Dallas ramp affecting pick times? 2) What breaks first when volume spikes? 3) What does an extra hour of downtime cost you? ...
Likely objections: "Too expensive" → tie to labour cost per pick, not sticker price. "We'll build it" → 9-month build vs 3-week rollout.
Battlecard: vs RackBot — we win on retrofit speed; they win on price. Source: Battlecard Library.
Next step to land: agree a pilot scope. Stage: Demo.
```

## Edge cases
- No account row or unknown attendees → build from web + offer only; flag "no deal context — confirm details" and cap research at 5 minutes.
- No web signals (quiet company) → use a fact from their own site and honest general questions; do not invent news.
- Duplicate meeting already briefed today → update the existing Doc, don't create a second; note it in the tracker notes column.

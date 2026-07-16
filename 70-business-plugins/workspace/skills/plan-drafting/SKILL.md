---
name: plan-drafting
description: Draft or refresh a business plan, strategy one-pager, or initiative brief in Google Docs. Use when the user says "draft a plan for X", "write a strategy one-pager", "refresh the growth plan", or during the monthly review when a plan needs updating.
---

# Plan drafting

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a goal or idea into a tight, decision-ready plan document — one primary metric, real initiatives, honest risks — sourced and short enough to actually be read.

## Algorithm
1. Read knowledge/BUSINESS_PROFILE.md (context, goals, KPIs) and knowledge/REPORTING_STYLE.md (voice, audience). Confirm the one thing this plan must achieve.
2. Pick the ONE primary metric the plan moves and its target; note guardrail metrics separately, never blend them into one score.
3. If market or benchmark context helps, use built-in web search; record each figure with its source URL. No source, no claim.
4. Draft into a Google Doc named "Plan — {name}" with sections: Context, Goal and primary metric (with target), Initiatives (each with owner and expected effect), Risks and unknowns, Timeline. Keep it to roughly one page unless the user asks for depth.
5. Cross-check the primary metric against the KPI Dashboard: if it is tracked, name the exact metric row so reporting stays consistent; if not, propose adding it.
6. Deliver the Doc link and a 3-line summary. It is a draft — the user edits and decides; nothing is shared for them.

## Output
```
Plan — Q3 Activation Lift  (Google Doc: <link>)
Goal: raise activation from 35% to 45% this quarter (primary metric: activation rate).
Initiatives: (1) guided onboarding — Product/Mei; (2) day-2 email nudge — Growth/Sam; (3) remove the org-setup step — Eng/Ana.
Risks: email deliverability unknown; activation definition may shift if we change signup.
Source note: 45% target benchmarked from OpenView 2024 SaaS report (link in Doc). Tracked as KPI "activation rate".
```

## Edge cases
- Goal has no measurable outcome → ask for the one metric before drafting; an unmeasurable plan is not written.
- User wants a "guaranteed" projection → give a scenario range with assumptions stated, refuse a single guaranteed number.
- A web benchmark can't be verified → label it "unverified" in the Doc rather than presenting it as fact.
- Plan overlaps an existing "Plan — {name}" Doc → refresh that Doc and note what changed; don't create a near-duplicate.

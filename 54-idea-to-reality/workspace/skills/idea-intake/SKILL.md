---
name: idea-intake
description: Capture a raw idea and structure it into the Idea Ledger. Use when the user says "new idea: {x}", proposes something to build, or drops a rough concept to validate later.
---

# Idea intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a vague idea into a clean, comparable entry — problem, target user, the ONE core value, and category — and log it to the "Idea Ledger" so nothing is lost and every idea is structured the same way.

## Algorithm
1. Read the raw idea from the user; read knowledge/IDEA_PROFILE.md for the user's building context and goals.
2. Structure it into four fields: problem (the pain it removes), target_user (who has that pain), core_value (the ONE thing it does better — pick one, do not list five), and category (a short label for the space, e.g. "AI code review", "meal-planning app").
3. If any of the four is unclear, ask one short clarifying question before logging — do not guess a problem the user did not state.
4. Append a row to Google Sheets "Idea Ledger" with columns: date, idea_name, problem, target_user, core_value, category, reality_signal, trend, verdict, top_competitors, differentiation, brief_link, status, next_review. Set status=captured; leave reality_signal, trend, verdict, top_competitors, differentiation, brief_link empty; set next_review to today + 30 days.
5. Confirm the structured idea and its ledger row, and offer to run skill reality-check next.

## Output
```
Logged to Idea Ledger:
  Idea: Figma-to-React CLI
  Problem: designers hand off Figma files devs re-build by hand, slowly
  Target user: solo React devs and small agencies
  Core value: one command turns a Figma frame into clean React components
  Category: design-to-code tooling
  Status: captured | next_review: 2026-08-15 | row #7
Want me to run a reality check on it now?
```

## Edge cases
- Idea bundles several products → split into separate ledger rows, one core_value each; never blend them into one blurry entry.
- Problem is unclear or unstated → ask one clarifying question first; an idea with no stated problem is not logged.
- Near-duplicate of an existing ledger row → flag it, point to the existing row, and ask whether to merge rather than adding a second entry.
- User gives only a solution ("an app with AI") → ask what problem it solves and for whom before scoring.

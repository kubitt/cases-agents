---
name: ops-briefing
description: Assemble the daily ops briefing or the weekly ops digest from the Ops Tracker, GitHub, Calendar, and Slack. Use on "brief me" / "ops status", in daily mode for the morning briefing, and in weekly mode for the Monday digest.
---

# Ops briefing

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the team a single, source-cited view of what needs attention — a daily snapshot with the top 3 next actions, or a weekly rollup — without inventing anything.

## Algorithm
1. Read knowledge/OPS_PROFILE.md (owners, areas, watched repos, ops channel, work hours) and knowledge/OPS_PLAYBOOK.md (briefing length, priority and status definitions).
2. Read the Google Sheet "Ops Tracker" tab "Tasks" (date_added, task, owner, area, priority, due_date, status, source, notes): count open work by area; find overdue rows (due_date in the past, status not done).
3. Read GitHub for the watched repos: PRs open and needing review, and any checks currently failing. Record repo, number, title, link.
4. Read today's Google Calendar events (daily mode) and flagged or unread items in the ops Slack channel.
5. Daily mode: build the snapshot and pick the top 3 next actions (overdue P1 first, then review-blocking PRs, then checklists whose next_due is today). Weekly mode: over 7 days, count closed vs opened tasks, list overdue, PR throughput, checklists due this week, SOPs changed.
6. Write each flagged line with its source; where a source is empty, write "data not provided". Keep to the length in OPS_PLAYBOOK.md; deliver to the ops Slack channel.

## Output
```
Ops briefing — Tue 2026-07-21 08:00
Tasks: 14 open (eng 6, product 5, finance-ops 3) | 2 overdue
GitHub: 3 PRs need review, 1 check failing
  - your-org/api #482 "rate limiter" ready 2d — link
  - your-org/web check failing on main — link
Calendar: 2 meetings (Sprint review 11:00, 1:1 15:00)
Checklists due today: Weekly access review (Ana)
Top 3 next actions:
  1. Review api #482 — blocking release (source: PR #482)
  2. Close overdue task "vendor renewal" — due 07-18 (source: Tasks row 31)
  3. Run access-review checklist (source: Checklists row 2)
```

## Edge cases
- A source is unreachable (GitHub/Calendar/Slack down) → note "section unavailable: {source}", deliver the rest, never block the whole briefing.
- Nothing needs attention → send a two-line "all clear" with the counts; do not pad it to look busy.
- Fewer than 3 real next actions → list only the real ones; never invent a filler action.
- Conflicting task status between the sheet and a linked PR → report both and flag for the user; do not silently pick one.

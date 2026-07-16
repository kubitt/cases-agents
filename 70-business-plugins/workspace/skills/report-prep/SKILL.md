---
name: report-prep
description: Assemble the weekly executive brief and per-meeting situation briefs from the KPI Dashboard, plan Docs, and Calendar. Use during the daily meeting-prep and weekly/monthly report jobs, or when the user says "prep me for X" or "bring me up to speed".
---

# Report prep

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the user a headline-first brief they can act on — the RAG rollup for a weekly report, or the who / goal / numbers / decision for a specific meeting — pulled only from real sources.

## Algorithm
1. Read knowledge/REPORTING_STYLE.md for audience, voice, and RAG thresholds; read the KPI Dashboard for current status.
2. For a weekly or monthly report: compute one overall RAG headline (red if any critical metric is red), list each metric's status and trend, and build the red list with sources. Add progress from active "Plan — {name}" Docs and the week/month-ahead from Google Calendar. Write long output to a Google Doc ("Weekly Executive Brief — {date}" or "Monthly Business Review — {month}") and send a short summary.
3. For a meeting brief: read the Calendar event (attendees, agenda), pull the 2–3 KPI rows and the plan Doc relevant to it, and state the decision likely needed. Keep it to a screen.
4. Surface up to 3 "decisions needed" — the things only a human can settle — at the top; everything else is context below.
5. Mark any missing figure "data not provided for this period"; label any explanation of a change as a hypothesis, not a proven cause.

## Output
```
Weekly Executive Brief — 2026-07-13  →  overall status: AMBER
Decisions needed: (1) approve extra $3k email budget to fix churn; (2) pick launch date for guided onboarding.
KPIs: MRR $46.2k amber (up) | signups 512 green (up) | churn 3.9% red (rising).
Plans: "Plan — Q3 Activation Lift" on track (2 of 3 initiatives started).
Week ahead: Tue board update 15:00; Thu pricing review with Sam.
Full Doc: <link>
```

## Edge cases
- No numbers logged yet for the period → say so plainly; do not manufacture a status or a trend.
- Meeting has no attendees or agenda in Calendar → give a light context note only; don't invent the purpose.
- Sources disagree (sheet vs a plan Doc) → show both figures and flag the mismatch; never silently pick one.
- Report would expose confidential figures to a wider audience → keep it in the user's Doc and ask before any sharing.

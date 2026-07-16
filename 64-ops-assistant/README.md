# Ops Assistant

Your team's internal operations desk in one place: a daily morning briefing, a weekly ops digest, task and status tracking, and living SOP checklists — assembled from your Sheets, Docs, GitHub, Calendar, and Slack.

## Value & ROI
Every morning someone opens six tabs to answer one question: "what needs attention today?" — open tasks, GitHub PRs waiting on review, failing checks, today's meetings, flagged Slack. That coordination habit costs roughly 45 min/day, plus 1–2 hours compiling a weekly ops review. Call it ~22 hours/month. At a modest $25–40/hour internal cost that is $550–880/month of chief-of-staff time — and it still lets tasks slip when nobody sweeps the tracker. This agent runs that sweep on schedule and hands you one briefing with the top 3 next actions. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external cost — everything is native OAuth plus built-in web search, no API keys. Honest payback vs $29: roughly 18–30x, before counting the work that no longer falls through.

## What it does
1. Sends a morning ops briefing every weekday at 08:00: a status snapshot (open tasks by area, GitHub PRs needing review and failing checks, today's calendar, flagged Slack) plus the top 3 next actions, posted to your Slack ops channel. Skill `ops-briefing`.
2. Captures and status-tracks work in the Google Sheet "Ops Tracker", tab "Tasks" (date_added, task, owner, area, priority, due_date, status, source, notes) — deduped, one row per item. Skill `task-triage`.
3. Runs recurring ops checklists from their SOP Google Docs and records completion in the "Ops Tracker" tab "Checklists" (checklist_name, cadence, next_due, owner, sop_doc, last_run, status). Skill `checklist-run`.
4. Watches GitHub during work hours and posts a short Slack line when a PR becomes ready for review or a check newly fails — so nothing waits unseen.
5. Sends a weekly ops digest every Monday at 08:00: what closed vs opened, the overdue list, PR throughput, checklists due this week, and SOPs changed.
6. Flags every item with its source (sheet row, PR number, calendar event, Slack link) and never marks anything done or merges anything on its own — it proposes, you confirm.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~12 min: team context, integrations, checklists, then your first briefing live).

## Required integrations
Native, all OAuth, $0: Google Sheets (the "Ops Tracker"), Google Docs + Google Drive (the "Ops SOPs" folder), GitHub (PRs, issues, checks), Google Calendar (today's meetings), Slack (source signals and the delivery channel). Built-in web search fills small gaps. Notion is an optional native alternative to Sheets/Docs. External API keys: NONE.

## Deliberate limitations
- **Read-and-propose, never act alone.** It never merges PRs, sends invites, edits SOP docs, or posts outside the agreed ops channel without your explicit approval — and it marks a task done only when you say so.
- **No live infrastructure, CI/CD deploy, or revenue monitoring.** The source project pulled AWS health, deploy pipelines, and Stripe revenue; those need paid external services and sit outside the native set — see Optional upgrades in INTEGRATIONS.md ($/mo).
- **No incident paging or on-call.** Escalation to a pager is an optional upgrade (PagerDuty/Opsgenie), not built in.
- **Reactivity is polling, not instant.** New GitHub items surface at your chosen interval (default 30 min in work hours), a deliberate credits-vs-speed choice, not real time.

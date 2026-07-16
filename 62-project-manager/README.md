# Project Manager

Keeps every project on track: a daily standup digest, a board that mirrors your GitHub issues and PRs, and early nudges on stalled or at-risk work — so nothing slips silently.

## Value & ROI
A project coordinator or junior PM costs $3,000–6,000/mo; standup-bot and status-automation add-ons run $8–20/user/mo. Chasing status by hand — reading issues, pinging owners, rebuilding the picture — eats 30–60 min every day. This agent compiles the standup for you, keeps the board in sync with GitHub, and flags a deadline or a blocker before it becomes a slip. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external API cost — every integration is native OAuth. Honest payback vs $29: roughly 100x versus a coordinator, and it earns its keep the first time it catches one missed deadline.

## What it does
1. Keeps a single "Project Board" (Notion database, or Google Sheets) as the source of truth: task, owner, status, priority, due_date, blocked_by, github_link, last_update, notes.
2. Every 30 minutes during work hours, polls GitHub issues and PRs and reconciles their state onto the board (opened, moved, merged, closed) so status is never stale.
3. Reads deadlines and milestones from Google Calendar and cross-checks them against each task's due_date.
4. Flags at-risk work by three simple rules: due within 2 working days, blocked more than 2 days, or no movement in 3 working days.
5. Every weekday at 09:00 delivers a ready-to-post standup digest — moved / blocked / due today / silent owners — for you to approve before it posts to your team Slack channel.
6. Drafts short, factual nudges to the owners of at-risk tasks; sends them only after you approve.
7. Every Friday at 16:00 sends a weekly status report with a Red/Amber/Green health call, velocity, and aging blockers.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (projects, team, board, integrations, first live standup).

## Required integrations
Native: Notion (board — or Google Sheets), GitHub (issues/PRs), Slack (standup and nudges), Google Calendar (deadlines). External: none. Channel: Slack for the team, plus ASCN chat or Telegram for your private approvals.

## Deliberate limitations
- It reads GitHub, Slack, and Calendar freely, but writes to them — posting, commenting, closing issues, creating events — only after your confirmation. The board itself is its own ledger, which it keeps current.
- It coordinates; it does not run code, merge PRs, assign work, or move deadlines on its own — those stay human decisions.
- The board is Notion or Google Sheets. There is no native Jira, Linear, or Asana connector — those can be added later via a custom MCP server (see Optional upgrades in INTEGRATIONS.md, ~$8–20/user/mo).
- No browser automation and no voice calls (platform limits) — all work is cloud-side through the native integrations.

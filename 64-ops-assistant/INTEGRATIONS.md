# Integrations: Ops Assistant

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The "Ops Tracker" — tab "Tasks" and tab "Checklists" | Native OAuth, 1 click — $0 |
| Google Docs + Drive | Required | The "Ops SOPs" folder: one Google Doc per SOP, read during checklists | Native OAuth — $0 |
| GitHub | Required | Open PRs needing review, failing checks, issues for the briefing | Native OAuth — $0 |
| Google Calendar | Required | Today's meetings in the daily briefing | Native OAuth — $0 |
| Slack | Required | Source signals (flagged/unread) and the delivery channel for briefings | Native OAuth — $0 |
| Built-in web search | Included | Fill small context gaps (a doc, a reference) | Native, no key — $0 |
| Notion | Optional | Native alternative to Sheets/Docs for the tracker and SOPs | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. Every integration is native OAuth — no API keys, no tokens, no external spend beyond the $29/mo ASCN Start plan (10,000 credits).

Onboarding connection order: team context → GitHub repos + Slack channels → Google Sheets (Ops Tracker) → Google Docs/Drive (Ops SOPs) + GitHub + Calendar → Slack → checklists → first briefing.

Degradation: without Google Sheets — the tracker is held in workspace files (less shareable; Notion is the native alternative). Without GitHub — the briefing skips the PR/check section and says so. Without Calendar — the briefing omits meetings. Without Slack — briefings post to the ASCN chat instead. No single missing source blocks the rest of the briefing.

Deliberately absent / notes:
- **No live infrastructure or CI/CD deploy control.** The agent reads GitHub PR and check status; it never merges, deploys, or probes cloud infra. Those need paid external services (below).
- **No revenue or billing monitoring.** Financial dashboards are out of the native set; keep numbers in your own Sheet and the agent will summarize what you put there.
- **No incident paging.** Escalation is a Slack @mention with approval, not an automated page.

Optional upgrades (not wired in — need approval + budget, keys in Settings → Secrets):
- **PagerDuty or Opsgenie** — on-call escalation and paging for incidents — from ~$21/user/mo. Buys: a real page when an overdue P1 or a broken run needs someone now.
- **Datadog (or a status-page monitor)** — live infrastructure/service health in the briefing — from ~$15/host/mo. Buys: the "is anything down?" line the source project pulled from AWS.
- **Jira or Linear sync via custom MCP** — mirror the "Ops Tracker" into your issue tracker — tool cost varies (Linear from ~$8/user/mo). Buys: two-way sync instead of a standalone Sheet.

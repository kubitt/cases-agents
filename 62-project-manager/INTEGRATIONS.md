# Integrations: Project Manager

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Notion | Required | The "Project Board" database — the single source of truth for tasks and status | OAuth, 1 click; free |
| GitHub | Required | Read issues and PRs and mirror their state onto the board | OAuth, 1 click; free |
| Slack | Recommended | Post the approved standup digest to a team channel and send owner nudges | OAuth, 1 click; free |
| Google Calendar | Recommended | Read deadlines and milestones; cross-check against task due_date | OAuth, 1 click; free |
| Google Sheets | Optional | Native alternative to Notion for the "Project Board" | OAuth; free |
| Telegram (channel) | Optional | Private channel for your morning digest and approvals | 2-min setup; free |

Onboarding connection order: Notion (or Google Sheets) → GitHub → Slack → Google Calendar → notification channel.

Degradation: without Slack — the digest and nudges arrive in ASCN chat or Telegram, ready to copy; without Google Calendar — deadlines come only from the board's due_date; without Notion — the board runs in Google Sheets with the same columns.

Deliberately absent: Jira / Linear / Asana (no native connector) — replaced by the Notion or Google Sheets board; a real Jira/Linear board can be bridged later via a custom MCP server. No browser automation and no voice calls (platform limits).

Secrets: NONE — no API keys or tokens are ever required. Every integration is native OAuth; web search and reading are built in.

Optional upgrades (not wired in — need approval + budget):
- Jira / Linear / Asana sync via a custom MCP server — mirror a real external board instead of Notion — ~$8–20/user/mo (the tool's own subscription; the MCP bridge itself is free to run).
- PagerDuty or Opsgenie escalation for on-call paging when a P1 task is blocked past its deadline — ~$21–41/user/mo.

# Integrations: Task Pilot

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The "Task List": every task with priority, due date, and status | Native OAuth, 1 click — $0 |
| Google Calendar | Required | Read today's events for the plan; create approved time-blocks | Native OAuth — $0 |
| Telegram | Recommended | Capture tasks by message; receive the daily plan and weekly review | Native OAuth channel, 2-min setup — $0 |
| Built-in web search | Included | Look up a quick fact a task needs (address, opening hours, reference) | Native, no key — $0 |
| Notion | Optional | Native alternative to Google Sheets for the Task List | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. Every core integration is native OAuth — no API keys, no tokens.

Onboarding connection order: projects/context → priority rules → Google Sheets (Task List) → Google Calendar → Telegram → capture first tasks → daily-plan automations.

Degradation: without Telegram — the daily plan and weekly review post in the ASCN chat instead. Without Google Calendar — the plan is built from the Task List alone, with no event-aware time-blocking. Without Google Sheets — the list can live in Notion (native alternative) or a workspace file, but a spreadsheet is easiest to edit by hand.

Deliberately absent:
- No task execution and no auto-completion — the agent captures, ranks, and plans; you mark tasks done and do the work.
- No always-on inbox scanning in core (see Optional upgrades) — capture is by message, which keeps credit use predictable.

Optional upgrades (not wired into the workspace files — need your approval to enable):
- Todoist (for existing Todoist users) — sync the Task List and daily plan to your Todoist projects and sections via the Todoist REST API. Free-tier API token, ~$0/mo. Enabled on request; adds a TODOIST_TOKEN secret only when switched on.
- Gmail email-to-task — poll a dedicated "Tasks" Gmail label so forwarded emails become captured tasks. Native Gmail OAuth, $0. Adds one polling automation (a credits/speed tradeoff you set).

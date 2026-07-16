# Integrations: Circle Keeper (Personal CRM)

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Gmail | Required | See when you last spoke with someone; draft check-ins (never sent); mail history for briefings | OAuth, 1 click |
| Google Calendar | Required | Log meetings as interactions; morning meeting-prep briefings | OAuth |
| Google Sheets | Required | The "Relationship Log": circles, cadence, last_contact, next_checkin, open_threads | OAuth |
| Notion | Optional | Native alternative to Sheets for the Relationship Log | OAuth |
| Telegram (channel) | Recommended | Morning briefings, weekly keep-in-touch digest, draft approvals | 2-min setup |

Onboarding connection order: Gmail → Calendar → Sheets → Telegram.

Degradation: without Telegram — briefings and digests arrive in ASCN chat; without Calendar — the log and check-ins still work, but no meeting-prep; without Gmail — no interaction sync and no drafts (the core value), so Gmail is required.

Deliberately absent: LinkedIn / X and other closed platforms (no browser automation, ToS) — context comes from your own Gmail/Calendar and open web instead; bought or broker contact lists (privacy and quality) — never used.

Optional upgrades (not wired in — need approval + budget):
- People enrichment API (e.g. People Data Labs / Clearbit) — auto-fill role, company, city, timezone for new contacts and richer briefings — REST + key in Secrets; ~$30–100/mo depending on lookup volume.
- News-monitoring API (e.g. a paid NewsAPI/GDELT tier) — surface public news about your contacts' companies inside briefings — REST + key in Secrets; ~$10–50/mo.

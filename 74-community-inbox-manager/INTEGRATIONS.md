# Integrations: Community Inbox Manager

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Inbox Queue": every message and review, intent, priority, draft, status | OAuth, 1 click |
| Telegram | Native, if used | Triage your bot/group messages; also the alert and digest channel | OAuth / 2-min setup |
| Slack | Native, if used | Triage messages in your workspace | OAuth, 1 click |
| Gmail | Native, if used | Triage a support inbox and draft email replies | OAuth, 1 click |
| Web search + page reading | Required | Read your public review pages (Google Business Profile, Yelp, marketplaces) | Built-in, zero setup |

Onboarding connection order: reply voice → channels (Telegram / Slack / Gmail) → review pages → Google Sheets → Telegram as the notification channel.

Degradation: without Telegram — alerts and the digest arrive in ASCN chat; connect only the channels you use — the agent triages whatever is connected and watches your public review pages regardless.

Deliberately absent: no paid social-inbox API in the native core (cost, and native Telegram/Slack/Gmail plus public review pages cover the common inbox); no browser automation or closed-API social posting (platform limits, source terms of service). Secrets required for the native core: NONE.

Optional upgrades (not wired in — need your approval + budget):
- Unified social-inbox API (a paid SMM inbox provider) — pulls Instagram / Facebook / X direct messages and comments into the same "Inbox Queue" for triage and drafting — ~$29–99/mo depending on provider and volume; key stored in Settings → Secrets as SOCIAL_INBOX_API_KEY. Ask the deployed agent to add it.
- Google Business Profile API — lets the agent post an approved review reply directly instead of you pasting it; the API itself is free ($0), you generate a token and store it in Settings → Secrets as GOOGLE_BUSINESS_TOKEN. Replies still go out only after your approval.

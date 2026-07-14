# Integrations: Personal Assistant

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Gmail | Required | Read & triage inbox, extract tasks, save reply drafts | Native OAuth, 1 click |
| Notion | Required (option A) | "Action Tracker" task database | Native OAuth, 1 click |
| Google Sheets | Required (option B) | "Action Tracker" spreadsheet | Native OAuth, 1 click |
| Google Calendar | Recommended | Today's meetings + event deadlines in the brief | Native OAuth, 1 click |
| Google Meet | Optional | Meeting transcripts for summaries | Native OAuth, 1 click |
| Telegram (channel) | Recommended | Morning brief, deadline nudges | 2-min setup |

Everything is native OAuth — no external API keys, no cost beyond the ASCN plan ($29/mo Start). The user picks Notion OR Google Sheets for the tracker at onboarding step 4.

Onboarding connection order: Gmail → task destination (Notion or Sheets) → Google Calendar → Telegram.

Degradation: without Calendar — the brief runs on tasks + emails only. Without Telegram — the brief arrives in ASCN chat. Without a task destination — onboarding blocks (the tracker is core). Gmail is the core dependency; without it the agent cannot triage.

## Optional upgrades (need approval + budget)
- **Instant reaction to a specific VIP sender** (instead of the 30-min poll) — possible via the platform's event reactivity; ask the deployed agent to set it up. Adds per-event credit cost; enable only if minutes matter.
- **Transcription for calls without a native transcript** (e.g., phone calls) — an external transcription API (e.g., ~$0.006/min) can be added later; not included by default.

## Deliberately absent
- No auto-send of any email or message — drafts only, by design.
- No inbox cleanup (archive / label / delete) — the agent reads and surfaces; it doesn't reorganize your mailbox.
- No CRM — this is a personal assistant, not a sales tool. Pair it with an SDR agent if you need outreach.

# Cron playbook — Sales Enablement Copilot

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Overnight brief prep
- Schedule: `0 5 * * 1-5` — weekdays 05:00. Night shift: the heavy web research runs while you sleep, so briefs are ready by morning. Runs silently — no notification before 08:00.
- Task prompt: "Open Google Calendar and list today's sales meetings (external guest, or the keywords set at onboarding). For each, per skill call-brief: research the account and attendees from the open web, pull context from the 'Deal Room Tracker' row, and build a Google Doc 'Call Brief — account — date' with account snapshot, buying-committee roles, 5–7 discovery questions, likely objections with responses, and the relevant battlecard from the 'Battlecard Library'. Write the Doc link into the tracker column brief_link and update meeting_date, meeting_type, stage. Do NOT notify the user. Save to memory which briefs are ready."
- Delivers to: nothing yet (silent prep).

### 2. Morning brief delivery
- Schedule: `0 8 * * 1-5` — weekdays 08:00.
- Task prompt: "Read from memory the briefs prepared overnight. Send a summary: numbered list 'Account — meeting time — one-line angle', each with its Call Brief Doc link, and flag the first meeting of the day. If no sales meetings today, finish silently."
- Delivers to: Telegram (or ASCN chat).

### 3. Weekly enablement refresh
- Schedule: `0 16 * * 5` — Friday 16:00.
- Task prompt: "Per skill battlecard-builder, refresh each competitor card in the 'Battlecard Library' from the open web (recent pricing, launches, positioning) — cite sources, mark unverified where needed. Then roll the week's new entries from the tracker column open_objections into the 'Objection Playbook'. Send a short digest: cards updated, new objections captured, one thing to watch. Max 12 lines."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity here is scheduled polling of your calendar (task 1) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; overnight prep is silent (critical alerts exempt).

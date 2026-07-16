# Cron playbook — Social Media Manager

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly plan-and-draft batch
- Schedule: `0 8 * * 1` (Monday 08:00 — convert to the user's timezone when writing the cron; do the heavy web-search research and drafting during the run so the package lands in the morning).
- Task prompt: "Read knowledge/BRAND_VOICE.md and knowledge/NETWORK_PLAYBOOK.md. Open Google Sheets 'Content Calendar'. (1) Plan the coming week per skill content-planner: fill empty slots by content pillar with date, pillar, network, working_title, status=idea. (2) For each planned slot, run skill post-writer: research a sourced angle via web search, write the master copy plus per-network versions into the 'Post Drafts' Google Doc, put the doc link in doc_link, and set status=in_review. (3) Send the notification channel a summary: numbered 'date — network — working_title', ending with 'Approve all / numbers / edit #N'. Do NOT publish anything and do NOT mark anything approved — drafts only."
- Delivers to: Telegram / ASCN chat.
- Credits note: one weekly run with web searches and a couple of drafts — modest credits, no external cost.

### 2. Weekday queue digest
- Schedule: `30 8 * * 1-5` (weekdays 08:30, user timezone).
- Task prompt: "Open Google Sheets 'Content Calendar'. (1) List rows with date=today and status=approved as 'ready to publish today', each with its network and working_title so the user can post them. (2) List rows with status=in_review as 'waiting for your review'. (3) If nothing is due and nothing is waiting, finish silently without notifying. Never publish and never change a status yourself. Send the digest to the notification channel."
- Delivers to: Telegram / ASCN chat.
- Credits note: a light daily read — a few credits.

### How to change it
- "Plan on Sunday instead" → change task 1 to `0 8 * * 7`; keep the same task prompt.
- "No daily digest" → disable/delete task 2; on-command planning, drafting, and the queue still work.

## Reactivity
This agent is schedule-driven (two crons above) and command-driven; it does not watch external events or poll social platforms. Notifications respect the user's window (default 08:00–23:00); heavy work prepared before the window delivers in the morning.

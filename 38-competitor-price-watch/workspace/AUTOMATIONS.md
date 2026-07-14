# Automations: Competitor Price Watch

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Daily price watch (created at onboarding)
- Cron: `0 8 * * *` (daily 08:00 user time — convert to UTC when writing the cron; e.g., 08:00 Moscow = `0 5 * * *`).
- Task prompt: "Run skill price-scan on all competitors in Google Sheets 'Competitor Prices' (read the list and parsing hints from knowledge/PRICE_PARSING.md and knowledge/WATCH_CONFIG.md). Then run skill price-diff against yesterday's stored values. Then run skill price-report: if there are real changes or flags, send the morning summary to the notification channel; if nothing changed, send one line 'No changes ✅'. Finally store today's values as the new baseline and mark any unavailable sites for retry. Do not invent prices; flag anything unreadable."
- Channel: Telegram / ASCN chat.
- Credits note: one scan/day across N competitor pages. Firecrawl (if used) may bill per page — the user owns the competitor-count tradeoff.

### How to change it
- "Check twice a day" → add a second cron (e.g., 08:00 and 18:00), converted to UTC; price-diff compares to the last stored snapshot each time.
- "Only weekdays" → `0 8 * * 1-5`.
- "Pause the watch" → disable/delete the cron; history stays in the sheet.

## Reactivity
This agent is schedule-driven and command-driven only; it does not watch external events. The daily summary is delivered inside the notification window (default 08:00–23:00); the scan itself may run earlier so results are ready by morning.

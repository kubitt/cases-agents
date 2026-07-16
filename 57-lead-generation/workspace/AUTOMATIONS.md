# Cron playbook — Lead Scout (Top-of-Funnel Prospector)

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Night research batch
- Schedule: `0 2 * * 1-5` — every weekday at 02:00. Night shift: the heavy research runs while you sleep, so the qualified list and drafts are ready by morning. This task does NOT notify you — it works silently and saves everything to the Sheet.
- Task prompt: "Open Google Sheets 'Prospect List'. Take up to {batch_size, default 20} rows with status=new. For each: research per skill prospect-research (fill website, contact_name, role, email, source, signal, notes; set status=researched); then score per skill fit-qualification (fill fit_score, fit_reason; set status=qualified when fit_score>=3, else disqualified). For each qualified row, draft the first touch per skill first-touch-draft (create the Gmail draft, put its summary in first_touch, set status=drafted). Do NOT send any email. When done, write to memory a marker `last_batch_summary` with counts (researched, qualified, disqualified, drafted) and the list of drafted companies for the morning delivery."
- Delivers to: nothing at night — results saved to the Sheet and memory only.

### 2. Morning delivery
- Schedule: `0 8 * * 1-5` — every weekday at 08:00, inside the notification window.
- Task prompt: "Read memory `last_batch_summary`. If empty or all-zero, finish silently. Otherwise send a summary: total new qualified leads, and a numbered list 'company — fit_score — signal — draft ready?'. End with 'Review the drafts in Gmail, then Review all / numbers to approve.' Clear the marker after sending."
- Delivers to: Telegram (or ASCN chat).

### 3. Weekly list snapshot
- Schedule: `30 8 * * 1` — every Monday at 08:30.
- Task prompt: "From 'Prospect List' compute for the last 7 days: prospects added, researched, qualified, disqualified, drafted, handed_off. Report the qualified rate and the top 3 buying signals seen. Flag any duplicate companies and any rows stuck at status=new for over 7 days. Suggest one ICP or search-brief adjustment. Max 15 lines."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity here is polling-based (the night batch reads the Sheet); this agent does not use platform event hooks. Notifications only 08:00–23:00 user time — the night batch stays silent; critical alerts (broken access, failed run) are exempt.

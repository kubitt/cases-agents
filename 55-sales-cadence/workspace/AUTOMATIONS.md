# Cron playbook — Sales Cadence Keeper

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Evening review
- Schedule: `0 18 * * 1-5` — weekdays 18:00, inside the notification window.
- Task prompt: "Open Google Sheets 'Sales Cadence Pipeline'. Read today's Gmail and Google Calendar activity for leads in the sheet; ignore internal-team domains listed in knowledge/CADENCE_PLAYBOOK.md. List each lead that moved with a one-line suggested next step. Deliver the list to Telegram and ask the user for quick context per lead ('going cold', 'call Friday', 'liked pricing'). When the user replies, file each note into context_note, update stage where clear, set next_touch, and per skill evening-recap create Google Calendar reminders for any calls or tasks mentioned. Do not send anything to a prospect."
- Delivers to: Telegram.

### 2. Morning outreach
- Schedule: `0 8 * * 1-5` — weekdays 08:00. Drafts are prepared early so they are waiting by the time the user opens the batch.
- Task prompt: "Open 'Sales Cadence Pipeline'. Take leads whose next_touch is today or overdue and touch_count < 3. For each, decide next_action (email / call / text / wait) from stage, context_note and the cadence in knowledge/CADENCE_PLAYBOOK.md. For email actions, draft the next touch per skill followup-writer in the voice from knowledge/VOICE.md and save a Gmail draft. Update next_touch, touch_count, next_action. Send a Telegram summary: numbered 'company — next_action — one line why', ending 'Approve all / numbers'. Do NOT send any email to a prospect — drafts only."
- Delivers to: Telegram.

### 3. Reply polling
- Schedule: `*/30 8-22 * * *` — every 30 min, 08:00–22:00 (interval set at onboarding step 9: 15 = faster but more credits, 60 = cheaper).
- Task prompt: "Check the Gmail inbox for messages newer than memory marker last_reply_check from senders present in 'Sales Cadence Pipeline'. If none — update the marker and finish silently. For each reply, per skill reply-triage: classify interested / question / objection / rejection / auto-reply; update stage and thread_log; for interested/question/objection draft a response in the user's voice and send the lead's quote + draft to Telegram for approval; rejection → do_not_contact and stop touches; auto-reply → move next_touch to the return date. Update the marker."

## Rules
Reactivity is polling (task 3) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night is silent except a broken-access or failed-run alert.

# Cron playbook — Job-Post Prospector

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Night signal sweep
- Cron: `0 4 * * *` (daily 04:00; night shift: the heavy research runs while you sleep, results are ready by morning).
- Task prompt: "Using built-in web search over open, public pages, find companies that posted a role matching knowledge/OFFER_ICP.md within the last 3 days and are not already in Google Sheets 'Outreach Pipeline' (dedupe on company + posted_role). For each new company: add a row with status=new, then research per skill signal-research and fill contact_name, contact_role, email, posted_role, budget_signal, source_url, notes; set status=researched. Draft the first-touch Gmail draft per skill pitch-sequence and set status=in_sequence with next_touch. Do NOT send any email — drafts only. Do NOT notify: this runs during quiet hours; the morning task delivers."
- Delivers to: nothing at night (prepares silently).

### 2. Morning batch delivery
- Cron: `0 9 * * 1-5` (weekdays 09:00).
- Task prompt: "Open Google Sheets 'Outreach Pipeline'. Collect drafts prepared overnight (status=in_sequence created since the last batch) plus any in_sequence whose next_touch is today; for the latter, draft the next touch per skill pitch-sequence considering thread_log. Send to Telegram a summary: 'drafts ready', then a numbered list 'company - posted_role - one-line signal'. End with 'Approve all / numbers'. Do NOT send any email — drafts only."
- Delivers to: Telegram.

### 3. Reply polling
- Cron: `*/30 8-22 * * *` (every 30 min, 08:00-22:00; interval set at onboarding step 7).
- Task prompt: "Check the Gmail inbox for messages newer than the memory marker last_reply_check, from senders present in 'Outreach Pipeline' with status in_sequence. None — finish silently and update the marker. For each reply: classify interested / question / objection / rejection / auto-reply; update status and thread_log; for interested/question/objection draft a reply in the user's voice (knowledge/VOICE.md) and send the sender's quote plus the draft to Telegram for approval; rejection or opt-out - set do_not_contact and stop touches; auto-reply - shift next_touch to the return date. Update the marker."
- Credits note: 30 min balances speed and credits; 15 min for hot pipelines, 60 for economy — the user's call at onboarding.

### 4. Friday funnel analytics
- Cron: `0 17 * * 5` (Friday 17:00).
- Task prompt: "From 'Outreach Pipeline' compute for the week: new companies, drafts sent, replies, positives, reply rate by target role and by opener_type. Name the best and worst performing opener_type. Give 2 recommendations. Telegram, max 15 lines."
- Delivers to: Telegram.

## Rules
Reactivity is polling (task 3) — this agent does not use platform event hooks. Notifications only 08:00-23:00 user time; night is silent (critical alerts exempt).

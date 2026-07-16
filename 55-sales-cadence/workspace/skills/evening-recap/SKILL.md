---
name: evening-recap
description: End-of-day review of the sales pipeline. Use during the evening review task, when the user says "let's review the day", or when the user replies with context on a lead.
---

# Evening recap

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
In under 10 minutes, capture where every active deal stands today so tomorrow's follow-ups are informed — nothing important said in a meeting or email is lost.

## Algorithm
1. Open Google Sheets "Sales Cadence Pipeline". Read today's Gmail threads and Google Calendar events involving leads in the sheet; ignore internal-team domains listed in knowledge/CADENCE_PLAYBOOK.md.
2. Build the "moved today" list: leads with a new email, a meeting, or a due next_touch. For each, draft a one-line suggested next step from stage and history.
3. Deliver the list and ask the user for quick spoken-style context per lead (one short reply covering several leads is fine).
4. File each note into context_note. Update stage where the user is explicit ("they passed" → engaged, "dead" → lost).
5. Set next_touch per the cadence; for any call or task the user names, create a Google Calendar reminder (title "Lead: <company> — <task>", date as stated).
6. Never message a prospect here — this step only updates the sheet, the calendar, and memory.

## Output
Chat/Telegram message, then filed updates. Example:
"Reviewed 4 leads that moved today:
1. Acme — replied, asked about pricing → send pricing + book call
2. Northwind — quiet 6 days → value touch (T3)
3. Globex — meeting done → your read?
Reply with a line each (e.g. 'Globex liked it, call Fri; Acme send pricing')."
After the reply: context_note filled per lead, next_touch set, Calendar reminder created for "Globex — call" Friday.

## Edge cases
- No activity today → post "No lead activity today, nothing to review" and finish; do not invent movement.
- User gives context on a lead not yet in the sheet → add a row (stage=new) and file it.
- Ambiguous stage ("maybe dead") → keep the current stage, note the doubt in context_note, do not guess a loss.
- Meeting note lives in Google Docs/Drive → read it if linked; if not accessible, ask the user for the one-line takeaway.

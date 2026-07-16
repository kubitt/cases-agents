---
name: reply-triage
description: Classify incoming lead replies and update the pipeline. Use during reply polling, when a lead replies, and when the user asks "what came in?".
---

# Reply triage

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Every lead reply is read, classified, and reflected in the pipeline within the polling window, with a suggested response ready — so the user reacts fast without living in the inbox.

## Algorithm
1. For each new Gmail reply from a sender in "Sales Cadence Pipeline", read the thread.
2. Classify into one: interested / question / objection / rejection / auto-reply.
3. Update the lead's row: stage (interested/question/objection → engaged; rejection → do_not_contact; won/lost when explicit), append a dated line to thread_log, reset touch_count to 0 on any genuine reply.
4. For interested / question / objection: draft a response in the voice from knowledge/VOICE.md and send the lead's quote + your draft to the user for approval.
5. For rejection: set do_not_contact, stop all touches, send nothing further. For auto-reply "away until N": set next_touch = N+1, leave touch_count unchanged.
6. Update the memory marker last_reply_check. Do not send any reply without the user's approval.

## Output
Telegram approval card, e.g.:
"Reply from Dana (Acme) — QUESTION:
'Looks good but can you do net-45 terms?'
Draft: 'Net-45 works for annual plans — I'll note it on the order. Want me to send it over today?'
Approve / edit / skip."
Sheet: stage=engaged, touch_count=0, thread_log += '2026-07-16 inbound question re: payment terms'.

## Edge cases
- Sender not in the pipeline → do not treat as a lead reply; leave for the user (it may be internal or a new inbound to add manually).
- Mixed signal (interested + objection) → classify by the strongest ask, note the nuance in the draft.
- Rejection plus a referral ("talk to my colleague") → do_not_contact the original, surface the referral for the user to add as a new lead.
- Out-of-office with no return date → hold next_touch 3 days, do not count a touch.

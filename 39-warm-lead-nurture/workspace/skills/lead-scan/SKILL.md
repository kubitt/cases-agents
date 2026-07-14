---
name: lead-scan
description: Find warm leads due for a follow-up today. Use on the daily run or on "who needs a follow-up". Reads the sheet and applies the timing and touch-limit rules.
---

# Lead scan

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce today's list of leads who are due for a follow-up — the right people, at the right time, within the touch limit — so followup-writer only writes what should be sent.

## Algorithm
1. Read Google Sheets "Warm Leads": name, contact, channel, status, interest, last_contact, touches, next_touch, notes.
2. Select candidates: status in {thinking, call_later, follow_up} AND (next_touch is today/overdue, OR days since last_contact ≥ the delay in knowledge/NURTURE_PLAYBOOK.md, default 2).
3. Exclude: status replied / meeting / won / lost / do_not_contact; and any lead already at the max touches (default 3) — mark those `cold` instead.
4. For each candidate, pull the context followup-writer needs: name, last interest, touches so far, notes, and how many days silent.
5. Sort by warmth (fewest days silent + highest prior interest first) and cap the daily batch to the configured size (default 25) to keep quality high.
6. Hand the due list to followup-writer.

## Output (due list handed to followup-writer)
```
Due for follow-up — 2026-07-13 (4 leads)
1. Anna K. | Telegram | interest: pricing for Pro | touch 1→2 | silent 3d
2. Ivan P. | email | interest: integration with Sheets | touch 2→3 (last) | silent 4d
3. Marat S. | Telegram | interest: demo | touch 3 reached → mark cold
```

## Edge cases
- No last_contact date recorded → treat as due now, set the baseline this run, don't skip the lead.
- Lead replied since last run (reply logged in notes) → skip and set status replied; never follow up over a reply.
- Missing channel/contact → flag "needs contact", don't attempt to send; ask the user.
- Duplicate rows for one lead → use the most recent, note duplicate in notes; never send twice.
- Empty due list → finish silently, no batch, no notification.

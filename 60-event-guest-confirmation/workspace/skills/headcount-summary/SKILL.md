---
name: headcount-summary
description: Compile the live RSVP headcount and the event-morning final summary. Use on "headcount" or "how many are coming", in the daily batch snapshot, and on the event morning.
---

# Headcount summary

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the host an accurate, at-a-glance picture of who is coming, who isn't, who is silent, and every dietary need — straight from the sheet, with no invented numbers.

## Algorithm
1. Read Google Sheets 'Guest List' in full. Count by status: confirmed, declined, maybe, no_response, invited (not yet replied); opt_out is excluded from totals.
2. Compute total party size = the sum of party_size across confirmed guests (a blank party_size counts as 1).
3. Collect every non-blank dietary_notes value with the guest name.
4. Status snapshot (daily batch): one compact line plus the count of guests still to chase.
5. Event-morning final summary: the full breakdown, the total headcount to expect, the dietary list grouped by guest, and the names still marked no_response.
6. If the sheet is empty or a period has no data, say "data not provided" — never fabricate a count.

## Output
A status snapshot and the final summary. Example:
```
Snapshot: Coming 18 (party 24) · Declined 5 · Maybe 3 · No reply 6 · to chase: 6
Final (event morning): Expect 24 guests.
- Confirmed: 18 people, party total 24
- Declined: 5 · Maybe: 3 · No reply: 6
Dietary notes:
- Sarah Johnson: vegetarian
- David Kim: nut allergy
```

## Edge cases
- Empty or missing sheet → report "data not provided" and ask the host to add guests; never invent a count.
- party_size blank for a confirmed guest → count as 1 and flag it so the host can correct.
- Numbers look off (e.g. more confirmed than invited) → show the raw counts and flag the discrepancy rather than smoothing it over.
- Guests marked opt_out → excluded from totals but noted, so the host knows they were dropped.

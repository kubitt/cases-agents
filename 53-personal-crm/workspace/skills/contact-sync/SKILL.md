---
name: contact-sync
description: Scan Gmail and Google Calendar for new people and interactions and keep the Relationship Log current. Use during the nightly sync task and on "log the people I met today".
---

# Contact sync

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: keep the "Relationship Log" accurate with zero manual entry — every real interaction updates last_contact and next_checkin, and genuinely new people get a row to confirm.

## Algorithm
1. Read the memory marker last_sync (default: 24h ago). Read Gmail and Google Calendar for items newer than it.
2. For each item, resolve the person by email against the "Relationship Log": a sent/received mail or a meeting held both count as an interaction on that date.
3. Existing person: set last_contact to the interaction date, append a short open_thread if the exchange raised one ("asked about her move to Berlin"), and recompute next_checkin = last_contact + cadence_days.
4. New person (not in the log, and clearly a real human, not a newsletter or no-reply): add a row with circle=professional, cadence_days from knowledge/RELATIONSHIP_CIRCLES.md, how_we_met from the context, and notes='new — confirm circle'.
5. Skip automated senders, receipts, and bulk mail. Never copy sensitive content into notes verbatim — summarize in one neutral line.
6. Update last_sync. Do not notify during the nightly run; surface new-person confirmations in the next digest.

## Output (rows written to the Relationship Log; nightly run stays silent)
```
Updated: Maria Alvarez — last_contact 2026-07-15, open_threads += "sending her the intro to Devi", next_checkin 2026-08-14
Updated: Sam Okafor — last_contact 2026-07-15 (met at coffee), next_checkin 2026-10-13
New: Priya Nair — priya@northwind.io, circle=professional, how_we_met="intro thread from Sam", notes="new — confirm circle"
```

## Edge cases
- Source unavailable (Gmail/Calendar not reachable) → keep last_sync unchanged, log the failure, and send one critical alert; do not half-update the log.
- Same person under two emails → merge into the existing row, keep both addresses in notes, never create a duplicate.
- Bulk/newsletter/no-reply sender → skip; never add as a contact.
- Ambiguous or sensitive content → record a neutral one-line summary in open_threads, never the raw text, and never a guessed fact.

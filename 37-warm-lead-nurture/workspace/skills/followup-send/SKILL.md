---
name: followup-send
description: Deliver follow-ups (draft for approval or send), update the sheet, and retire cold leads. Use right after followup-writer.
---

# Follow-up send

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: get the follow-ups to leads the right way — approval-first by default — and keep the sheet accurate so no one is over-touched.

## Algorithm
1. Take the drafted messages from followup-writer.
2. Delivery mode (from knowledge/NURTURE_PLAYBOOK.md):
   - Default (approval): send the batch to the owner in Telegram as a numbered list with each message; wait for "send all / send #N / edit #N".
   - Auto-send (only if explicitly enabled): skip approval and send directly.
3. Send each approved message on the lead's channel: Telegram via the native channel, or email via Gmail (with the subject from followup-writer).
4. Update "Warm Leads" per lead: last_contact = today, touches +1, next_touch = today + delay, status stays in follow-up. Log the message text in the thread notes.
5. Retire rule: if this was the 3rd touch (max) and no reply, set status = cold, stop future follow-ups.
6. Stop rule: if a reply arrived before sending, cancel that lead's follow-up, set status = replied, and flag it for the owner to take over.
7. Report: what was sent (or queued for approval), what became cold, what needs owner attention.

## Output (owner report / approval batch)
```
Follow-ups ready for approval (3):
1. Anna K. (TG, touch 2): "Anna, quick one — you were weighing the Pro plan..."
2. Ivan P. (email, touch 3 last): subj "The Sheets integration you asked about" — "..."
Reply "send all" or "send 1", "edit 2".
Auto-updated: 1 lead → cold (Marat S., 3 touches no reply).
```

## Edge cases
- Gmail daily send caution → keep total emails/day modest (≤30–50); if the batch is larger, split across days and warn about deliverability.
- Lead replied mid-batch → pull them from the send, mark replied, notify the owner; never send over a reply.
- Send fails (bad address, channel error) → mark the row send_failed with the reason, keep touches unchanged, report it; don't silently drop.
- Auto-send enabled but a message trips a SOUL check (fake urgency, unverified claim) → hold that one for manual approval, send the rest.
- Owner approves "send all" but one lead hit the touch cap → skip that one, mark cold, note it in the report.

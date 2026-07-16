# Relationship circles and cadence

> Your reference file. The agent reads it before working and updates it as it learns. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; you may edit it any time]

## Circles and how often to stay in touch
(plain "circle: cadence_days" lines — no tables, the ASCN UI breaks them)
- inner: [FILL DURING ONBOARDING] (default 30) — closest people, never let slip
- personal: [FILL DURING ONBOARDING] (default 90) — friends you like keeping up with
- professional: [FILL DURING ONBOARDING] (default 120) — network, mentors, ex-colleagues
- dormant: [FILL DURING ONBOARDING] (default 180) — worth keeping alive lightly
- muted: never surfaced — people you explicitly do not want reminders about

next_checkin is always last_contact + cadence_days for the person's circle. When a person's circle changes, recompute their next_checkin.

## Worked example
- Maria Alvarez — circle inner, cadence_days 30. Last_contact 2026-07-15 → next_checkin 2026-08-14.
- Priya Nair — circle professional, cadence_days 120. Met via Sam, 2026-06-24 → next_checkin 2026-10-22.
- Old Uni Group chat — circle muted — never surfaced, kept only for reference.

## Rules for this file
- A person is surfaced at most once per overdue cycle; snooze means hold, not delete.
- Circle drives the default cadence, but a per-person cadence_days override in the log always wins.
- Never move someone to a tighter cadence without the user asking — no one wants to be nagged.

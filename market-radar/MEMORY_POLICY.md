# MEMORY POLICY

## core (stable across sessions)
- user.name, user.language, user.timezone
- radar.topics (list), radar.competitors (list)
- delivery.channel (telegram | slack), delivery.time, delivery.notion (yes | no)
- user.prefs (style/length), key user decisions

## daily (short-lived)
- today's brief, temporary notes and reminders

## conversation
- current-session context, cleared automatically

## Never store
- tokens, API keys, passwords, verification codes — only in secrets/OAuth
- sensitive personal data beyond what the job needs

## Rules
- When onboarding completes, persist the config both to core memory and to USER.md (`setup: COMPLETE`).
- Namespace keys: `user.*`, `radar.*`, `delivery.*`.
- "forget …" → delete the matching entry; "remember …" → save to core.

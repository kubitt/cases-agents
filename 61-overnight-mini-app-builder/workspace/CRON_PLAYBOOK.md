# Cron playbook — Overnight Mini-App Builder

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Overnight build (night shift, created at onboarding)
- Schedule: `0 2 * * *` — every day at 02:00 user time (convert to UTC when writing the task; heavy code work runs at night so results are ready by morning). If the user chose fewer build nights, use those weekdays instead, for example `0 2 * * 1,3,5` for Mon/Wed/Fri.
- Task prompt: "Open Google Sheets 'Build Queue' (columns: date_added, name, spec, type, priority, status, artifact_link, notes). Pick the row with status=ready and the lowest-number priority; if none, finish silently with no message. Set that row status=building. Run skill overnight-build: write and run code in files/scripts/ (Python first, TypeScript second) per knowledge/BUILD_PREFERENCES.md, produce a working artifact, save it to the Drive build folder, and test it against the spec's acceptance check. Append the run to 'Build Log' (columns: build_date, name, outcome, artifact_link, summary, next_step), set the Build Queue row status=built (or partial/blocked), and store the one-line summary in memory for the morning delivery. Do NOT notify anyone now — it is quiet hours. Never mark a broken build as built and never spend on a paid service."
- Delivers to: nothing at night (silent); the morning task delivers.
- Credits note: one real code build per night is token-heavy. On the Start plan (10,000 credits/mo) expect a few solid builds per week; the user picks how many nights to build at onboarding.

### 2. Morning delivery
- Schedule: `0 8 * * *` — every day at 08:00 user time (the first moment of the notification window).
- Task prompt: "Read 'Build Log' (columns: build_date, name, outcome, artifact_link, summary, next_step) for runs since the last delivery. For each: send one message with what was built, the artifact_link, how to run it, and what is tested vs untested. If a build is status=blocked, report exactly what's needed (for example a paid API key) and ask. Offer to ship (push to GitHub or hand off deploy steps) but do NOT act until the user confirms. If nothing was built overnight, finish silently — send no message."
- Delivers to: Telegram / ASCN chat.
- Credits note: a light read plus one message — a few credits per day.

## Rules
Reactivity is the nightly queue check above — this agent watches no external events and polls no third-party platform. Notifications only 08:00–23:00 user time; a critical failure alert (broken access, or a failed run the user must know about) is the only exception.

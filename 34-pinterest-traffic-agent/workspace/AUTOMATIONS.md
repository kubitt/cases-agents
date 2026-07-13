# Automations: Pinterest Traffic Agent

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

None by default. This is a Builder-archetype agent — pins are created on your command. The one optional cron below is autoposting, created only if you ask for it.

### Optional: Autoposting (offered, not imposed)
Publishes one pin automatically on a schedule. Enabling it is your standing approval to publish without a per-pin confirmation; you can pause it anytime.

- Cron: user's chosen time. Example: daily 12:00 Moscow = `0 9 * * *` (09:00 UTC). Always convert the user's local time to UTC when writing the cron.
- Task prompt: "Autoposting run. Read knowledge/NICHE_STRATEGY.md and knowledge/PIN_SETTINGS.md. Run skill pin-writer for one fresh pin (an angle not in the recent-headings log). Then run skill pin-publisher: generate the image, overlay the plaque, and publish to Pinterest directly (standing approval — skip the preview wait). Send the live-pin report to the notification channel: heading, pin link, target link, and the ~$0.05 image cost. Log the heading and date so the next run avoids repeats. If any secret is missing or the image/publish fails, send one alert and stop — do not retry in a loop."
- Channel: Telegram / ASCN chat (user's preference from onboarding).
- Credits note: each run spends ASCN credits plus ~$0.05 OpenRouter per image. Daily = ~$1.5/mo images; hourly would be far more — the user owns this frequency tradeoff.

### How to change it
- "Post twice a day at 9:00 and 18:00" → two crons, or a single cron with two times, converted to UTC.
- "Pause autoposting" → delete or disable the cron; set autoposting to off in PIN_SETTINGS.md.

## Reactivity
This agent is command-driven and schedule-driven only; it does not watch external events. Notifications respect the user's window (default 08:00–23:00); a night-scheduled post delivers its report in the morning unless the user set a specific night time.

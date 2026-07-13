# Automations: SMM Content Factory

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly package prep (default, created at onboarding if agreed)
- Cron: `0 8 * * 1` (Monday 08:00).
- Task prompt: "For each active brand profile in knowledge/BRAND_PROFILE.md: run skill trend-research for this week's topics, then skill post-writer for the batch, then skill post-publisher to generate images and assemble the package. Send the package to the notification channel for approval ('Approve all / edit #N'). Do NOT publish yet — wait for approval. If a brand has autoposting enabled, publish directly per the autoposting rule below instead."
- Channel: Telegram / ASCN chat.
- Credits note: image generation costs ~$0.05 per post via OpenRouter — a 5-post weekly package ≈ $1/mo. The user owns the cadence.

### 2. Scheduled autoposting (optional, offered — not imposed)
Enabling it is your standing approval to publish without a per-package confirmation.
- Cron: user's chosen time, converted to UTC. Example: Monday 12:00 Moscow = `0 9 * * 1`.
- Task prompt: "Autoposting run for brands with autoposting enabled. Run trend-research → post-writer → post-publisher, then publish directly (standing approval — skip the approval wait): Telegram via the native channel, VK/Blotato where connected, otherwise store the ready package. Log each post to 'SMM Content Log'. Send a report: what published where and the image cost. If a secret is missing or a post fails checks, skip that post, log why, continue."
- Channel: Telegram / ASCN chat.

### How to change it
- "Prepare packages twice a week" → add a second prep cron (e.g., Monday and Thursday), UTC.
- "Pause autoposting" → delete/disable the autoposting cron; set the brand's autoposting note to off in BRAND_PROFILE.md.

## Reactivity
This agent is schedule-driven and command-driven only; it does not watch external events. Notifications respect the user's window (default 08:00–23:00); heavy generation prepared before the window delivers in the morning.

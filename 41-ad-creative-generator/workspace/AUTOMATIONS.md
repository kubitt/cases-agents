# Automations: Ad Creative Generator

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

None by default. This is a Builder-archetype agent — creatives are produced on your command. The one optional cron below is a weekly batch, created only if you ask for it.

### Optional: Weekly creative batch (offered, not imposed)
Prepares a fresh set of variants for your active campaign each week, for your review.
- Cron: `0 8 * * 1` (Monday 08:00 — convert to UTC when writing the cron; heavy image generation can run earlier so the package is ready by morning).
- Task prompt: "Read the active campaign brief from knowledge/BRIEF_TEMPLATE.md and the winning hooks from the 'Ad Tests' sheet. Run skill ad-copywriter for 5 fresh variants (favor hooks that won, vary the ones that flopped, avoid exact repeats of prior headlines), then skill creative-packager to generate an image per variant and assemble the package. Deliver to the notification channel with the Drive link and log the batch to 'Ad Tests'. Do not publish ads — deliver for the user to upload. If OPENROUTER_API_KEY is missing or an image fails, deliver text variants and flag it."
- Channel: Telegram / ASCN chat.
- Credits note: each batch spends ~$0.05 per image via OpenRouter (~$0.25 for 5). Weekly ≈ $1/mo. The user owns the cadence.

### How to change it
- "Two campaigns weekly" → one cron per active campaign, or a single cron looping both briefs.
- "Pause the weekly batch" → disable/delete the cron; on-command generation still works.

## Reactivity
This agent is command-driven, with an optional weekly schedule; it does not watch external events. Notifications respect the user's window (default 08:00–23:00); a batch prepared before the window delivers in the morning.

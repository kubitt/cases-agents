# Cron playbook — Social Intel Radar

> This file lives in my workspace. I read it whenever I create or edit cron tasks. You can change schedules and wording — I will follow the updated version.

## Cron tasks

### 1. Nightly competitor and trend scan
- Schedule: `0 3 * * *` — every day at 03:00 user time. Heavy collection runs at night and stays silent; the results wait for the Monday brief unless something is clearly notable.
- Task prompt: "Run skill competitor-scan: for each handle in knowledge/NICHE_PROFILE.md, use built-in web search and page reading to find recent best-performing public posts newer than the saved `last_scan_marker` for that handle (skip any post_url already in the log). Extract format, hook_type, topic, and any visible engagement; mark each number verified or estimated; compute engagement_rate per knowledge/RESEARCH_METHOD.md; append one row per post to Google Sheets 'Social Intel Log' with date, platform, source_handle, post_url, format, hook_type, topic, likes, comments, shares, views, engagement_rate, verified, notes; update the marker per handle. Then run skill trend-scan: find rising topics, hashtags, sounds, and formats in the niche across trend and news sources, rank each by momentum evidence, tie every item to a source URL, and append rows to Google Sheets 'Trend Radar' with date, platform, trend, type, momentum, example_url, notes — never a row without a source. Finish silently unless a genuinely notable move appears (a tracked competitor going viral); only then send one short note to the channel, and only between 08:00 and 23:00."
- Delivers to: Telegram or ASCN chat (silent on a normal night).

### 2. Weekly insight digest
- Schedule: `0 8 * * 1` — every Monday at 08:00 user time.
- Task prompt: "Run skill insight-digest: read Google Sheets 'Social Intel Log' and 'Trend Radar' for the last 7 days and write the what's-working brief — top 3 repeatable patterns, 2 formats worth testing this week, and 1-2 content-gap opportunities. Tag every line [fact] (backed by a logged row or source) or [estimate]. If fewer than 5 posts or trends were logged this week, say 'insufficient data' instead of forcing patterns. Deliver to the notification channel, max 18 lines."
- Delivers to: Telegram or ASCN chat.

## Rules
Reactivity here is schedule and command driven: I run on these crons and when you ask ("scan now", "brief") — I do not watch for events between runs. Heavy scanning happens at night; notifications go out only 08:00–23:00 user time, except a critical alert you explicitly asked me to send outside that window.

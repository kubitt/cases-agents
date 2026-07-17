# Cron playbook — LinkedIn Page Manager

> This file lives in the agent's workspace. The agent reads it whenever it sets up or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly draft batch
- Schedule: `0 8 * * 1` — Monday at 08:00. Heavy web research and drafting run first, so you get the approve-ready summary at the start of the week.
- Task prompt: "Open Google Sheets 'LinkedIn Calendar'. Plan this week's open slots by content pillar (from knowledge/PAGE_PROFILE.md), then for each planned slot draft the post per skill page-post-writer: research a sourced angle, write master copy into the 'Post Drafts' Google Doc, save the doc_link, and set status=in_review. Send a summary to the notification channel: a numbered list 'date — pillar — working_title — status', ending with 'Approve all / numbers / edit #N'. Do NOT publish anything — drafts only."
- Delivers to: Telegram or ASCN chat.

### 2. Weekday readiness digest
- Schedule: `30 8 * * 1-5` — every weekday at 08:30.
- Task prompt: "Open 'LinkedIn Calendar'. List rows with status=approved or status=scheduled whose date is today (ready to publish) and rows with status=in_review (waiting for review). In connected mode, remind the user to run skill page-publisher on the approved rows; in draft mode, assemble the approve-ready package (final copy + doc_link) so the user can post by hand. Keep it under 15 lines. If nothing is ready and nothing is waiting, finish silently."
- Delivers to: Telegram or ASCN chat.

### 3. Weekly analytics refresh (connected mode)
- Schedule: `0 17 * * 5` — Friday at 17:00.
- Task prompt: "Connected mode only (LINKEDIN_ACCESS_TOKEN set). Run skill page-analytics: pull Company-Page impressions, engagement, follower count and demographics via the LinkedIn API, write impressions and engagement_rate onto the matching published rows in 'LinkedIn Calendar', and send a weekly summary with 3 concrete recommendations. Keep verified API numbers separate from any estimate. If no token is set, finish silently."
- Delivers to: Telegram or ASCN chat.

## Reactivity
This agent works on a schedule and on your commands — it does not use platform event hooks; scheduled checks of the calendar are how it stays current. Notifications stay within 08:00–23:00 user time (a failed run or broken access is the only exception). Heavy drafting and research run early in the day so the delivery lands when you start work.

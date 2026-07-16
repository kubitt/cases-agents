# Cron playbook — Daily Reddit Digest

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Nightly digest collection
- Schedule: `0 6 * * *` — every day at 06:00 user time (convert to UTC when writing the cron). This runs before the notification window: the heavy web reads happen early so the digest is ready by morning. No message is sent now.
- Task prompt: "Run skill subreddit-digest. Read knowledge/SUBREDDIT_LIST.md and knowledge/DIGEST_PREFERENCES.md. For each subreddit, read its public top/hot page with built-in web reading; record post_title, post_url, upvotes, num_comments, posted_ago, category. Score = upvotes + (num_comments x 2), favor posts under 24h; rank descending into digest_rank. Drop any post_url already in 'Reddit Digest Log' in the last 7 days and anything the preferences exclude. Append the kept rows to 'Reddit Digest Log' (date, subreddit, post_title, post_url, upvotes, num_comments, posted_ago, category, digest_rank, shortlisted=no, feedback empty, notes) and save the formatted digest text to memory as today's draft. If a subreddit can't be read, note it and continue. Do NOT notify the user yet."
- Delivers to: nothing (preparation only).

### 2. Morning digest delivery
- Schedule: `0 8 * * *` — every day at 08:00 user time (convert to UTC). Inside the notification window.
- Task prompt: "Read today's digest draft from memory. If it's missing or stale, run skill subreddit-digest now to rebuild it. Send the digest to the notification channel: numbered list, one line each 'r/sub — title — upvotes/comments/age — category' with the link under it. End with: 'Liked today's picks? Say what to change (e.g., no memes, more how-tos) and I'll tune tomorrow.' Do NOT post anything to Reddit. Never invent posts to fill the list."
- Delivers to: Telegram / ASCN chat.

## How to change it
- "Weekdays only" → set both schedules to `0 6 * * 1-5` and `0 8 * * 1-5`; keep the task prompts.
- "Send it at 09:00" → change delivery to `0 9 * * *` (still inside the window); leave collection early.
- "Pause the digest" → disable/delete both crons; 'digest now', deep-dive, and tuning still work on command.

## Reactivity
This agent is schedule-driven (nightly collection + morning delivery) and command-driven; it does not watch external events or poll Reddit continuously. Notifications respect the user's window (default 08:00–23:00); collection prepared before the window delivers in the morning.
